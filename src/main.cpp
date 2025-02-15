#include <uWS/uWS.h>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>
#include "Eigen-3.3/Eigen/Core"
#include "Eigen-3.3/Eigen/QR"
#include "helpers.h"
#include "json.hpp"
#include "spline.h"
// for convenience  
using nlohmann::json;
using std::string;
using std::vector;

double ref_vel = 0;
//start with lane 1 (mid lane)
int lane = 1;
int prev_lane = 1;
double time_since_last_lane_change = 0;
int main() {
	uWS::Hub h;

	// Load up map values for waypoint's x,y,s and d normalized normal vectors
	vector<double> map_waypoints_x;
	vector<double> map_waypoints_y;
	vector<double> map_waypoints_s;
	vector<double> map_waypoints_dx;
	vector<double> map_waypoints_dy;



	// Waypoint map to read from
	string map_file_ = "../data/highway_map.csv";
	// The max s value before wrapping around the track back to 0
	double max_s = 6945.554;
	//std::cout<< map_file_;
	std::ifstream in_map_(map_file_.c_str(), std::ifstream::in);


	string line;
	while (getline(in_map_, line)) {
		std::istringstream iss(line);
		double x;
		double y;
		float s;
		float d_x;
		float d_y;
		iss >> x;
		iss >> y;
		iss >> s;
		iss >> d_x;
		iss >> d_y;
		map_waypoints_x.push_back(x);
		map_waypoints_y.push_back(y);
		map_waypoints_s.push_back(s);
		map_waypoints_dx.push_back(d_x);
		map_waypoints_dy.push_back(d_y);

	}


	h.onMessage([&map_waypoints_x, &map_waypoints_y, &map_waypoints_s,
		&map_waypoints_dx, &map_waypoints_dy]
		(uWS::WebSocket<uWS::SERVER> ws, char* data, size_t length,
			uWS::OpCode opCode) {
				// "42" at the start of the message means there's a websocket message event.
				// The 4 signifies a websocket message
				// The 2 signifies a websocket event


				if (length && length > 2 && data[0] == '4' && data[1] == '2') {

					auto s = hasData(data);

					if (s != "") {
						auto j = json::parse(s);
						string event = j[0].get<string>();
						if (event == "telemetry") {
							// j[1] is the data JSON object
							// Main car's localization Data
							double car_x = j[1]["x"];
							double car_y = j[1]["y"];
							double car_s = j[1]["s"];
							double car_d = j[1]["d"];
							double car_yaw = j[1]["yaw"];
							double car_speed = j[1]["speed"];
							// Previous path data given to the Planner
							auto previous_path_x = j[1]["previous_path_x"];
							auto previous_path_y = j[1]["previous_path_y"];
							// Previous path's end s and d values 
							double end_path_s = j[1]["end_path_s"];
							double end_path_d = j[1]["end_path_d"];
							// Sensor Fusion Data, a list of all other cars on the same side of the road.
							auto sensor_fusion = j[1]["sensor_fusion"];
							//get the path size
							int prev_size = previous_path_x.size();
							//sensor fusion data collision avoidance logic


							if (prev_size > 0) {
								car_s = end_path_s;
								car_d = end_path_d;
							}
							bool too_close = false;
							bool car_in_left_lane = false;
							bool car_in_right_lane = false;
							bool left_lane_clear = true;
							bool right_lane_clear = true;
							//loop through all the cars that sesor funsion detected
							for (int i = 0; i < sensor_fusion.size(); i++) {
								double vx = sensor_fusion[i][3];
								double vy = sensor_fusion[i][4];
								double check_speed = sqrt(vx * vx + vy * vy);
								double check_car_s = sensor_fusion[i][5];
								float d = sensor_fusion[i][6];
								// predict at where is this car in future (next few 0.02 secs)
								check_car_s += ((double)prev_size * .02 * check_speed);
								double s_dist = fabs(check_car_s - car_s);
								//ifthis ar is in my lane
								if (d<(2 + 4 * lane + 2) && d>(2 + 4 * lane - 2)) {
									//if the car is close to our car (less than 30
									if ((check_car_s > car_s) && ((check_car_s - car_s) < 30)) {
										too_close = true;
									}
								}// check the other cars in my left lane if my car is in middle lane or right lane
								else if (lane > 0 && d < (2 + 4 * lane - 2) && d > (2 + 4 * lane - 6)) {

									if (s_dist < 15) {
										car_in_left_lane = true;
									}
									if (s_dist < 50) {
										left_lane_clear = false;
									}
								}// check the other cars in my right lane if my car is in middle lane or left lane
								else if (lane < 2 && d >(2 + 4 * lane + 2) && d < (2 + 4 * lane + 6)) {
									if (s_dist < 15) {
										car_in_right_lane = true;
									}
									if (s_dist < 50) {
										right_lane_clear = false;
									}

								}
							}
							if (too_close) {
								//change lane
								if (time_since_last_lane_change > 10) {
									if (left_lane_clear && lane > 0) {
										lane--;
									}
									else if (right_lane_clear && lane < 2) {
										lane++;
									}
									else if (!car_in_left_lane && lane > 0) {

										lane--;
									}
									else if (!car_in_right_lane && lane < 2) {
										lane++;
									}
									else {
										ref_vel -= .224;
									}
								}
								else {
									ref_vel -= .224;
								}
							}
							else {
								// change back to middle lane if possible
								if ((time_since_last_lane_change > 20 ) && (lane == 0 && right_lane_clear || lane == 2 && left_lane_clear)) {
									lane = 1;
								}
								if (ref_vel < 49.5) {
									ref_vel += .224;
								}
							}


							if (prev_lane != lane) {
								time_since_last_lane_change = 0;
								prev_lane = lane;

							}
							time_since_last_lane_change += 0.02;

							//a list of widely spaced (x,y) waypoints ,spaced at 30 m
							vector<double> ptsx;
							vector<double> ptsy;

							//reference x, y, yaw states
							double ref_x = car_x;
							double ref_y = car_y;
							double ref_yaw = deg2rad(car_yaw);
							//if previous size is almost empty, use car as starting reference
							if (prev_size < 2) {
								//two points that creats a path tangent to the car
								double prev_car_x = car_x - cos(car_yaw);
								double prev_car_y = car_y - sin(car_yaw);
								ptsx.push_back(prev_car_x);
								ptsx.push_back(car_x);
								ptsy.push_back(prev_car_y);
								ptsy.push_back(car_y);
							}
							else {
								//use previous path's end point as starting ref
								ref_x = previous_path_x[prev_size - 1];
								ref_y = previous_path_y[prev_size - 1];
								double ref_x_prev = previous_path_x[prev_size - 2];
								double ref_y_prev = previous_path_y[prev_size - 2];
								ref_yaw = atan2(ref_y - ref_y_prev, ref_x - ref_x_prev);

								//Use two points that create a path tangent to the prvevious path's end point
								ptsx.push_back(ref_x_prev);
								ptsx.push_back(ref_x);

								ptsy.push_back(ref_y_prev);
								ptsy.push_back(ref_y);
							}
							//In Frenet add evenly 30m spaced points ahead of starting reference
							double d = 2 + 4 * (double)lane;

							vector<double> next_wp0 = getXY(car_s + 30, d, map_waypoints_s, map_waypoints_x, map_waypoints_y);
							vector<double> next_wp1 = getXY(car_s + 60, d, map_waypoints_s, map_waypoints_x, map_waypoints_y);
							vector<double> next_wp2 = getXY(car_s + 90, d, map_waypoints_s, map_waypoints_x, map_waypoints_y);


							//add these waypoints to anchor point list
							ptsx.push_back(next_wp0[0]);
							ptsx.push_back(next_wp1[0]);
							ptsx.push_back(next_wp2[0]);
							ptsy.push_back(next_wp0[1]);
							ptsy.push_back(next_wp1[1]);
							ptsy.push_back(next_wp2[1]);



							//coordinate transform to car coordinate for easier calculation 
							for (int i = 0; i < ptsx.size(); i++) {
								//shift car reference angel to 0 degrees
							   // std::cout << ref_yaw << std::endl;
								double shift_x = ptsx[i] - ref_x;
								double shift_y = ptsy[i] - ref_y;
								ptsx[i] = (shift_x * cos(0 - ref_yaw) - shift_y * sin(0 - ref_yaw));
								ptsy[i] = (shift_x * sin(0 - ref_yaw) + shift_y * cos(0 - ref_yaw));

							}

							//create a spline
							tk::spline s;
							//set (x,y) points to the spline
							s.set_points(ptsx, ptsy);
							// interpolated points of spline
							vector<double> next_x_vals;
							vector<double> next_y_vals;
							//start with all previous points(not being eaten by the car)
							for (int i = 0; i < previous_path_x.size(); i++) {
								next_x_vals.push_back(previous_path_x[i]);
								next_y_vals.push_back(previous_path_y[i]);
							}

							// break up spline points so we travel at desired ref velocity
							double target_x = 30.0;
							double target_y = s(target_x);
							double target_dist = distance(0, 0, target_x, target_y);

							double x_add_on = 0;
							for (int i = 1; i <= 50 - previous_path_x.size(); i++) {
								double N = (target_dist / (.02 * ref_vel / 2.24));
								double x_point = x_add_on + (target_x / N);
								double y_point = s(x_point);
								x_add_on = x_point;
								double x_temp = x_point;
								double y_temp = y_point;
								//inverse transform - need to backto global coordniater
								x_point = (x_temp * cos(ref_yaw) - y_temp * sin(ref_yaw));
								y_point = (x_temp * sin(ref_yaw) + y_temp * cos(ref_yaw));
								x_point += ref_x;
								y_point += ref_y;

								next_x_vals.push_back(x_point);
								next_y_vals.push_back(y_point);
							}


							json msgJson;



							//END
							msgJson["next_x"] = next_x_vals;
							msgJson["next_y"] = next_y_vals;

							auto msg = "42[\"control\"," + msgJson.dump() + "]";

							ws.send(msg.data(), msg.length(), uWS::OpCode::TEXT);
						}  // end "telemetry" if
					}
					else {
						// Manual driving
						std::string msg = "42[\"manual\",{}]";
						ws.send(msg.data(), msg.length(), uWS::OpCode::TEXT);
					}
				}  // end websocket if
		}); // end h.onMessage

	h.onConnection([&h](uWS::WebSocket<uWS::SERVER> ws, uWS::HttpRequest req) {
		std::cout << "Connected!!!" << std::endl;
		});

	h.onDisconnection([&h](uWS::WebSocket<uWS::SERVER> ws, int code,
		char* message, size_t length) {
			ws.close();
			std::cout << "Disconnected" << std::endl;
		});

	int port = 4567;
	if (h.listen("127.0.0.1", port)) {
		std::cout << "Listening to port " << port << std::endl;
	}
	else {
		std::cerr << "Failed to listen to port" << std::endl;
		return -1;
	}

	h.run();
}