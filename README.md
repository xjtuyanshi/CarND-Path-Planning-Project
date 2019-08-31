[//]: # (Image References)
[image1]: result_screenshot.PNG  "result screenshot"
[image2]: result_screenshot_error.PNG  "result screenshot with error"
# CarND-Path-Planning-Project
Self-Driving Car Engineer Nanodegree Program
   
### Simulator.
The Simulator which contains the Path Planning Project from the [releases tab (https://github.com/udacity/self-driving-car-sim/releases/tag/T3_v1.2).  

To run the simulator on Mac/Linux, first make the binary file executable with the following command:
```shell
sudo chmod u+x {simulator_file_name}
```
#### The map of the highway is in data/highway_map.txt
Each waypoint in the list contains  [x,y,s,dx,dy] values. x and y are the waypoint's map coordinate position, the s value is the distance along the road to get to that waypoint in meters, the dx and dy values define the unit normal vector pointing outward of the highway loop.

The highway's waypoints loop around so the frenet s value, distance along the road, goes from 0 to 6945.554.

##Build Instructions

1. Clone this repo.
2. Make a build directory: `mkdir build && cd build`
3. Compile: `cmake .. && make`
4. Run it: `./path_planning`.

Here is the data provided from the Simulator to the C++ Program

#### Main car's localization Data (No Noise)

["x"] The car's x position in map coordinates

["y"] The car's y position in map coordinates

["s"] The car's s position in frenet coordinates

["d"] The car's d position in frenet coordinates

["yaw"] The car's yaw angle in the map

["speed"] The car's speed in MPH

#### Previous path data given to the Planner

["previous_path_x"] The previous list of x points previously given to the simulator

["previous_path_y"] The previous list of y points previously given to the simulator

#### Previous path's end s and d values 

["end_path_s"] The previous list's last point's frenet s value

["end_path_d"] The previous list's last point's frenet d value

#### Sensor Fusion Data, a list of all other car's attributes on the same side of the road. (No Noise)

["sensor_fusion"] A 2d vector of cars and then that car's [car's unique ID, car's x position in map coordinates, car's y position in map coordinates, car's x velocity in m/s, car's y velocity in m/s, car's s position in frenet coordinates, car's d position in frenet coordinates. 

## Dependencies

* cmake >= 3.5
  * All OSes: [click here for installation instructions](https://cmake.org/install/)
* make >= 4.1
  * Linux: make is installed by default on most Linux distros
  * Mac: [install Xcode command line tools to get make](https://developer.apple.com/xcode/features/)
  * Windows: [Click here for installation instructions](http://gnuwin32.sourceforge.net/packages/make.htm)
* gcc/g++ >= 5.4
  * Linux: gcc / g++ is installed by default on most Linux distros
  * Mac: same deal as make - [install Xcode command line tools]((https://developer.apple.com/xcode/features/)
  * Windows: recommend using [MinGW](http://www.mingw.org/)
* [uWebSockets](https://github.com/uWebSockets/uWebSockets)
  * Run either `install-mac.sh` or `install-ubuntu.sh`.
  * If you install from source, checkout to commit `e94b6e1`, i.e.
    ```
    git clone https://github.com/uWebSockets/uWebSockets 
    cd uWebSockets
    git checkout e94b6e1
    ```
## Implemetations
1. Lane Following -basic trajectory generation (Line 187 -284)
   * Spline library was used to generate smooth driving curve
   * Use Frenet coordinate system to make sure the car stays in the lane(d is constant)
2. Jerk minimizing and collision avoidance (line 146-169)
   * slowly increase speed to minimize the initial jerk
   * use sensor fusion data to decect the distance(s) between the ego car and the car in front of it.
   * if too close, reduce speed 
3. Lane changing (line 105- 186)
   * Try to stay in one lane until if the car in front is slow and there is saftey space of other lanes, change lane.
   * Change back to middle lane - after lane changing, if middle lane is also clear, change back to middle lane
   *Recude lane change frequency by adding timer to count the time since last lane change ( ~10 sec)

## Project Rubric Points
1.  The car is able to drive at least 4.32 miles without incident.
![4.10 miles][image1]
2. The car drives according to the speed limit.
   * No speed limit red message was seen.
3. Max Acceleration and Jerk are not Exceeded.
4. Car does not have collisions.
5. The car stays in its lane, except for the time between changing lanes.
   * The car stays in its lane most of the time only changing lanes when necessary
6. The car is able to change lanes
   * The car is able to smoothly change lanes when it makes sense to do so, such as when behind a slower moving car and an adjacent lane is clear of other traffic






