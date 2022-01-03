HeartBeat-node
============

ROS drivers on RaspberryPi

## Installation

### Basic Requirements

1. [Ros Noetic](https://varhowto.com/install-ros-noetic-raspberry-pi-4/)
2. [RosSerial](http://wiki.ros.org/rosserial_arduino/Tutorials/Arduino%20IDE%20Setup)
3. [RosBridge](http://wiki.ros.org/rosbridge_suite)



### Repository Installation

Go to your ROS working directory. e.g.
```
cd ~/ros_ws/src
``` 

Clone the repository
```
git clone https://github.com/VGUIngenieurBaeren/OhmniRobot-contest-project.git
``` 

 
Now compile your ROS workspace. e.g.
```
cd ~/ros_ws && catkin_make
``` 

### Running rosserial & rosbridge
```
roslaunch heartbeat_ros ohmni_heartbeat.launch
``` 

