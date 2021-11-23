# OhmniRobot-contest-project
This is a project based on the technology of OhmniRobot, whose information can be found at [OhmniLabs website](https://ohmnilabs.com/)

Objective: To provide a local-hosted webpage, accessible by OhmniRobot via its available tools, displaying health information (body temperature and SpO2 ratio) of participants.

In this file will you find prerequisite on hardwares, middlewares and softwares installation along with their purposes; instructions on how to use source code files and what outputs to expect from them.

Let's begin!

## 1. Requirements
### a/ Hardwares
MLX90640 module: To capture thermal image of participants

MAX30102 module: To retrieve SpO2 ratio from participants

ESP32 module: To process data from MAX30102 module and connect it with the main processor, Raspberry Pi module

Raspberry Pi cam: To capture RGB images

Raspberry Pi module: To process the nodes from MLX90640 module and ESP32

### b/ Middlewares
Install Ubuntu 18.04 and  [ROS Noetic](https://varhowto.com/install-ros-noetic-raspberry-pi-4/)


### c/ Softwares
Lists of lib used and their main effect on the project:

adafruit_mlx90640: Provide I2C connection between the MLX90640 module and our processor

busio, board: Initialize I2C connection

mediapiipe: To design a face recognition node

numpy, scipy: Analyze thermal data collected from MLX90640 to calculate the facial region temperature

from sensor_msgs.msg import Image: Initialize messages type published to rostopic

from cv_bridge import CvBridge: Transfer image read by opencv "cv2" into one that ROS can understand

## 2. Instuctions
### a/ Hardware connections:
   Between MAX30102 and ESP32

```
   MAX30102         ESP32
------------------------------------
     Vin             3.3V
     GND             GND
     SDA             21
     SCL             22
     INT             13
```

   Between Raspberry Pi and MLX90640
   
```
   MLX90640         RaspPi
------------------------------------
     Vin             3.3V
     GND             GND
     SDA             3
     SCL             5
```
### b/ Running the nodes
Go to your workspace, if you had already created one, or follow [ROS Tutorial](http://wiki.ros.org/ROS/Tutorials) and create yourself a **ros_ws**.

Git clone the repository:
```
cd ~/ros_ws/src
git clone https://github.com/VGUIngenieurBaeren/OhmniRobot-contest-project.git
```

Then go back to your workspace and compile it:
```
cd ~/ros_ws
catkin_make
```
### For hosting local Vue server

#### Project setup
```
cd ~/ros_ws/src/Vue
npm install
npm install echarts
```

#### Compiles and hot-reloads for development
```
npm run serve
```

#### Compiles and minifies for production
```
npm run build
```

#### Lints and fixes files
```
npm run lint
```

#### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/)

### For launching Heart beat node to display SpO2 data collected

#### Running Rosserial and Rosbridge
```
roslaunch heartbeat_ros ohmni_heartbeat.launch
```

#### Expecting results:
![Vue Server established_with heartbeat and SpO2 data](https://github.com/VGUIngenieurBaeren/OhmniRobot-contest-project/blob/main/figures/vue_server_with_HB_data.png)

### For launching face detection and thermal data collecting node:
```

```

#### Expecting results:
![Images in RGB and thermal region](https://github.com/VGUIngenieurBaeren/OhmniRobot-contest-project/blob/main/figures/RGB%20and%20thermal%20images.png)






