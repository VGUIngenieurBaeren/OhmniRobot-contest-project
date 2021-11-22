# OhmniRobot-contest-project
This is a project based on the technology of OhmniRobot, whose information can be found at [link]()

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
Install Ubuntu 18.04 and  [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu)

Note: This project is intentionally written for ROS Melodic, but any other ROS version could be used, theorically. If you get into any problems, you can contact and ask for our help.

### c/ Softwares
Lists of lib used and their main effect on the project:

adafruit_mlx90640: Provide I2C connection between the MLX90640 module and our processor

busio, board: Initialize I2C connection

mediapiipe: To design a face recognition node

numpy, scipy: Analyze thermal data collected from MLX90640 to calculate the facial region temperature

from sensor_msgs.msg import Image: Initialize messages type published to rostopic

from cv_bridgee import CvBridge: Transfer image read by opencv "cv2" into one that ROS can understand

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
### b/










