#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2 as cv

bridge = CvBridge()

def image_callback(img_msg):
    rospy.loginfo(img_msg.header)
    # try:
    #     cv_img = bridge.imgmsg_to_cv2(img_msg, "bgr8")        # Convert your ROS Image message to OpenCV2
    # except CvBridgeError as e:
    #     print(e)
    try:
         cv_img = bridge.imgmsg_to_cv2(img_msg, "passthrough")
    except CvBridgeError as e:
         rospy.logerr("CvBridge Error: {0}".format(e))

    cv.imshow("Image Window", cv_img)
    cv.waitKey(3)

def listener():
    rospy.init_node('listener')
    
    rospy.Subscriber('Picam', Image, image_callback)    # Set up your subscriber and define its callback
    
    while not rospy.is_shutdown():
        rospy.spin()


if __name__ == '__main__':
    listener()