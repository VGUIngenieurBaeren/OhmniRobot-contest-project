## a/ Hardwares
MLX90640 module: To capture thermal image of participants

MAX30102 module: To retrieve SpO2 ratio from participants

ESP32 module: To process data from MAX30102 module and connect it with the main processor, Raspberry Pi module

Raspberry Pi cam: To capture RGB images

Raspberry Pi module: To process the nodes from MLX90640 module and ESP32

## b/ Middlewares
Install Ubuntu 18.04 and  [ROS Noetic](https://varhowto.com/install-ros-noetic-raspberry-pi-4/)


## c/ Softwares
Lists of lib used and their main effect on the project:

adafruit_mlx90640: Provide I2C connection between the MLX90640 module and our processor

busio, board: Initialize I2C connection

mediapiipe: To design a face recognition node

numpy, scipy: Analyze thermal data collected from MLX90640 to calculate the facial region temperature

from sensor_msgs.msg import Image: Initialize messages type published to rostopic

from cv_bridge import CvBridge: Transfer image read by opencv "cv2" into one that ROS can understand
