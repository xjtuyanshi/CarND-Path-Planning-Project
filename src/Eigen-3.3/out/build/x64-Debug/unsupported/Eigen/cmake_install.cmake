# Install script for directory: C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "c:/users/shi_y/documents/github/udacity/carnd-path-planning-project/src/eigen-3.3/out/install/x64-Debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen" TYPE FILE FILES
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/AdolcForward"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/AlignedVector3"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/ArpackSupport"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/AutoDiff"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/BVH"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/EulerAngles"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/FFT"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/IterativeSolvers"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/KroneckerProduct"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/LevenbergMarquardt"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/MatrixFunctions"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/MoreVectorization"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/MPRealSupport"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/NonLinearOptimization"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/NumericalDiff"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/OpenGLSupport"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/Polynomials"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/Skyline"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/SparseExtra"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/SpecialFunctions"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/Splines"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen" TYPE DIRECTORY FILES "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/unsupported/Eigen/src" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/out/build/x64-Debug/unsupported/Eigen/CXX11/cmake_install.cmake")

endif()

