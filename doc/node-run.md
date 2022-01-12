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
rosrun thermalcam_ros face_temperature_publisher.py
```

#### Expecting results:
![Images in RGB and thermal region](https://github.com/VGUIngenieurBaeren/OhmniRobot-contest-project/blob/main/figures/RGB%20and%20thermal%20images.png)
