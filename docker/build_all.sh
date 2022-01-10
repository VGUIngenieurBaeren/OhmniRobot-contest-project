#!/bin/bash
WSDIR=$PWD
DOCKER_SERVER="vguingbaeren/ohmni_contest"

echo  "========= build base image  ========="
cd  $WSDIR/base_ros; chmod u+x build.sh; ./build.sh c

echo  "========= build rgb ROS image  ========="
cd  $WSDIR/ros_pkg;chmod u+x build.sh; ./build.sh 

sudo docker tag ohmnihealth:base $DOCKER_SERVER:base_ros
sudo docker tag ohmnihealth:launch $DOCKER_SERVER:launch_ros

sudo docker push $DOCKER_SERVER:base_ros
sudo docker push $DOCKER_SERVER:launch_ros
