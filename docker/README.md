# Docker Build 
This repository contains build files for building ROS docker images for reading and processing sensor data.
It's inspired by [OhmniLabs](https://gitlab.com/ohmni-sdk/docker-ohmni-rgbcamera)


Dependencies:
* libuvc backend: http://wiki.ros.org/libuvc_camera  
* v4l2 backend (standalone): http://wiki.ros.org/usb_cam 
* v4l2 backend (gstreamer): http://wiki.ros.org/gscam 
* Web_video_server: http://wiki.ros.org/web_video_server
* Ros bridge: http://wiki.ros.org/rosbridge_suite
* Ros serial: http://wiki.ros.org/rosserial

# Build Images
Requirements:
 * Host enviroment: Ubuntu 20.04, amd64
 * Docker [Install instruction](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

To build these images, change the _DOCKER_SERVER_ variable in the _build_all.sh_ file to your publish registry and run:
```
chmod u+x build_all.sh
./build_all.sh
```
<img src="image/docker.png" width="640" height="480" />

This will build 2 images:
* $DOCKER_SERVER:base_ros: install all necessary dependencies (ROS, OpenCV, )
* $DOCKER_SERVER:launch_ros: add launch files and deploy scripts

Prebuilt image has been built in the [this repo](https://hub.docker.com/repository/docker/vguingbaeren/ohmni_contest), you could push and try it on Ohmni Robot.

# Basic Usage
**Step 1:** Pull the image onto the bot (Ohmni developer edition)

Build your images or try our prebuild images [Ohmni_Contest](docker pull vguingbaeren/ohmni_contest:launch), then adb or ssh to the bot, pull the image:
```
host computer$  adb connect [bot ip] && adb shell
bot cli: /$ su
bot cli: /# docker pull vguingbaeren/ohmni_health:launch
```
**Step 2:** run the image and access the main tmux session (make sure you don't open the camera by any app)
```
bot cli: /$ su
bot cli: /# docker run -it --privileged --network host -v /dev:/dev  vguingbaeren/ohmni_contest:launch 
```
Please open tmux "work" session for accessing all ros nodes and roscore.
```
docker cli: /# tmux attach -t work
```
By default for this image, we open the main camera: 640x480@30Hz yuyv format. Check if the image stream is already published:
```
docker cli: /# rostopic hz /main_cam/image_raw

## output something like this:
subscribed to [/main_cam/image_raw]
average rate: 29.896
	min: 0.031s max: 0.037s std dev: 0.00192s window: 30
average rate: 29.826
	min: 0.031s max: 0.037s std dev: 0.00197s window: 60
average rate: 29.846
	min: 0.031s max: 0.037s std dev: 0.00196s window: 90
average rate: 29.843
	min: 0.031s max: 0.037s std dev: 0.00196s window: 119
average rate: 29.851
```
We provided several launch files of different packages in the root dirrectory of the containner, you could try these and change the default launch code (_/ros_launch.sh_).
# Example: write a simple ROS node to process the stream
**Requirement**: 

please head to http://wiki.ros.org/ROS/Tutorials to complete basic tutorials of how to create a workspace, a ROS node that subcribe to the image stream

We made a simple example (source code in the directory __example_draw_image__) for processing the main camera stream in the workspace, you could take a look in the source code. To run this example:
```
# source enviroment variables
docker cli: /# source ~/catkin_ws/devel/setup.bash
# to run the example
docker cli: /# rosrun example_draw_image example_draw_image input_image:=/main_cam/image_raw
```
**Code explain**: 

the source code in this file: ~/catkin_ws/src/example_draw_image/src/example_draw_image.cpp
```

```
Basicly we create a [image transport object](http://wiki.ros.org/image_transport) which is simliar to [a standard ROS publisher and subcriber](http://wiki.ros.org/ROS/Tutorials/WritingPublisherSubscriber) to handle subcribe an image topic (/input_image) and publish an processed image topic (/output_image). 

The output is something like this:

![](ohmni_rgbcamera/example_draw_image/output.png)

**Display result for debugging**

To display the debug images at the above figure in a local machine, we need to connect the bot and the local machine in the same network. In __Both__ the bot and the local machine we add local IP of the bot and the local machine:
```
#In the bot and the local machine, file /etc/hosts, add 2 IP and hostname. Use tools like ifconfig to get the IP
[bot ip]            [bot_name]
[local machine ip]  [local_machine_name]
```
To check the connectivity, you could go through checking steps in [this document](http://wiki.ros.org/ROS/NetworkSetup) with 2 machine names: [bot_name] and [local_machine_name]

If connectivity is good, then you need to export necessary info to use any ROS tools (e.g. rviz, rqt) in the local machine as the same environment as the bot machine.

```
# export necessary info
In the local machine> export ROS_HOSTNAME=[local_machine_name]
In the local machine> export ROS_MASTER_URI=http://[bot_name]:11311

#After running the docker below, free to access topic/service from the bot machine (required export above info for each new terminal), for example:
# list all available topic
In the local machine> rostopic list
# run visualization tool
In the local machine> rviz
```
Then use [rviz](http://wiki.ros.org/rviz) to display /input_image and /output_iamge

# Limitations
1. Because 2 cameras of the bot are connected to a usb hub 2.0, the OS limits the bandwidth so you can't not get 2 streams at hight resolutions. Some combinations we tested will work (for v4l2) such as:
* 2 streams 320x240@30Hz yuyv
* 1 stream 1280x1024@30Hz mjpg + 1 stream 320x240@30Hz yuyv
* only one stream 640x48030Hz yuyv eachtime
We love to hear from you how improve this limitation

2. The mjpg decoder in avaibable packages is not efficient, need to improve this.
3. Open 2 streams using libuvc still does not work, because 2 cameras have same product id,vendor id, serial.  
4. While using this way to open a camera, our call app can not access to the camera stream. please refer [Docker examples - processing camera frames](https://docs.ohmnilabs.com/ohmnidocker/) to access the stream durring the call.
