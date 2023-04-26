#!/bin/bash

mkdir -p ~/lidar_ws/src
cd ~/lidar_ws
catkin init
catkin build

cd src
git clone https://github.com/Slamtec/rplidar_ros.git
catkin build

echo "source ~/lidar_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
