
#include <ros.h>
#include <ohmni_ros_msgs/HeartBeat.h>
ros::NodeHandle nh;
ohmni_ros_msgs::HeartBeat heartbeat_msg;
ros::Publisher pub_heart("HeartBeat", &heartbeat_msg);
#include <Wire.h>
#include "MAX30105.h"

MAX30105 particleSensor;
long publisher_timer;



void setup() {
  nh.initNode();
  nh.advertise(pub_heart);
      if (particleSensor.begin() == false)
  {
    nh.logerror("MAX30105 was not found. Please check wiring/power.");
    while (1);
  }
  particleSensor.setup(); //Configure sensor. Use 6.4mA for LED drive


}
void loop(){





    if (millis() > publisher_timer) {
  // step 1: request reading from sensor 
    heartbeat_msg.bpm= particleSensor.getRed();
    heartbeat_msg.oxygen=particleSensor.getIR();
    pub_heart.publish(&heartbeat_msg);
    publisher_timer = millis() + 1000;
  }
  

  nh.spinOnce();
}
