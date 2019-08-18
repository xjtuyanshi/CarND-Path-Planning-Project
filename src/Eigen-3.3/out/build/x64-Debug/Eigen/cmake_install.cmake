# Install script for directory: C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen" TYPE FILE FILES
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/Cholesky"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/CholmodSupport"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/Core"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/Dense"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/Eigen"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/Eigenvalues"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/Geometry"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/Householder"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/IterativeLinearSolvers"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/Jacobi"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/LU"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/MetisSupport"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/OrderingMethods"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/PaStiXSupport"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/PardisoSupport"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/QR"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/QtAlignedMalloc"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/SPQRSupport"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/SVD"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/Sparse"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/SparseCholesky"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/SparseCore"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/SparseLU"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/SparseQR"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/StdDeque"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/StdList"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/StdVector"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/SuperLUSupport"
    "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/UmfPackSupport"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen" TYPE DIRECTORY FILES "C:/Users/shi_y/Documents/GitHub/Udacity/CarND-Path-Planning-Project/src/Eigen-3.3/Eigen/src" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

