/* Example sending array messages from ESP32 to Ohmni Robot via rosserial */


#include <std_msgs/Int16MultiArray.h>
#include <ros.h>



ros::NodeHandle nh;
std_msgs::Int16MultiArray msg;
ros::Publisher example("example", &msg);
void setup() {
  nh.getHardware()->setBaud(115200); //was 115200
  nh.initNode();              // init ROS
  nh.advertise(example);
}
void loop() {
 
  short value[4] = {0,100,0,0};
  msg.data = value;
  msg.data_length = 4;
 
  example.publish(&msg);

  nh.spinOnce();      
}