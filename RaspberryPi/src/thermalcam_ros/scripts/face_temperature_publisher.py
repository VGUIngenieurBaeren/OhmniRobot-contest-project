#!/usr/bin/env python3
import cv2 as cv
import numpy as np
import mediapipe as mp
from scipy import ndimage
import time
import board
import busio
import adafruit_mlx90640
import rospy
from std_msgs.msg import Int32
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


i2c = busio.I2C(board.SCL, board.SDA, frequency=800000)
mlx = adafruit_mlx90640.MLX90640(i2c)
mlx.refresh_rate = adafruit_mlx90640.RefreshRate.REFRESH_2_HZ
mlx_shape = (24, 32)
mlx_interp_val = 10
mlx_interp_shape = (mlx_shape[0]*mlx_interp_val, mlx_shape[1]*mlx_interp_val)


# --- Face detection Module ---
class FaceDetector:
    def __init__(self, minDetectionConfidence = 0.8):

        self.minDetectionConfidence = minDetectionConfidence

        self.mpFaceDetection = mp.solutions.face_detection
       
        self.faceDetection = self.mpFaceDetection.FaceDetection(minDetectionConfidence)

    def findFaces(self, frame, draw=True):
        frameRGB = cv.cvtColor(frame, cv.COLOR_BGR2RGB)
        self.results = self.faceDetection.process(frameRGB)
        bboxes = []

        if self.results.detections:
            for id, detection in enumerate(self.results.detections):
                bboxC = detection.location_data.relative_bounding_box
                ih, iw, ic = frame.shape
                bbox = int(bboxC.xmin * iw), int(bboxC.ymin * ih), int(bboxC.width * iw), int(bboxC.height * ih)

                bboxes.append([bbox, detection.score])
        return frame, bboxes


frame = np.zeros(mlx_shape[0] * mlx_shape[1])


# ---Display thermal image---
def td_to_img(f,tmax,tmin):
    norm = np.uint8((f - tmin)*255/(tmax-tmin))
    return norm


def thermalcam():
    mlx.getFrame(frame) 
    data_array = (np.reshape(frame,mlx_shape)) 
    tmax = frame.max()
    tmin = frame.min()
    ta_img = td_to_img(data_array, tmax, tmin)
    np.fliplr(ta_img)
    
    timg = cv.applyColorMap(ta_img, cv.COLORMAP_JET)
    timg = cv.resize(timg, (640,480), interpolation = cv.INTER_CUBIC)
    timg = cv.flip(timg, 1)
    return timg
# ----------------------------


def temp_calc(x, y, w, h):    
    mlx.getFrame(frame)
    data_array = np.fliplr(np.reshape(frame, mlx_shape))   
    data_array = ndimage.zoom(data_array, mlx_interp_val)

    face_temp = round(np.max(data_array[y:y + round(h/3.3), x:x + w]), 2)      # in picam, x is column, y is row
                                                                               # finding max temperature in the forehead's area
    return face_temp


def talker():
    
    cap = cv.VideoCapture(0)
    detector = FaceDetector()
    
    count = 0

    bridge = CvBridge()				
    pub1 = rospy.Publisher('Face_Temperature', Int32, queue_size=10)	#topic1_publish temperature only
    pub2 = rospy.Publisher('Picam', Image, queue_size=1)		#topic2_publish the image which includes face detected & avg temperature
    rospy.init_node('MLX90640', anonymous=True)
    rate = rospy.Rate(10)
    
    while not rospy.is_shutdown():
        while cap.isOpened():
            ret, img = cap.read()
            if ret:
                count = count + 1
                img = cv.resize(img, dsize=(320, 240))
            
                if count % 11 == 0:                              # detect every 11 frames 
                    img, bboxes = detector.findFaces(img)
                    for bbox in bboxes:
                        x_min, y_min, width, height = bbox[0]    
                        y_min2 = y_min - round(height/3.3)          # location of the top of the forehead
                        height2 = height + round(height/3.3)        # height of forehead
                        confidence = bbox[1]

                        cv.rectangle(img, (x_min, y_min), (x_min + width, y_min + height), (255, 0, 255), 1)

                    #--- Draw the bounding box for detected face ---                     
                        cv.line(img, (x_min, y_min), (x_min + 10, y_min), (255, 0, 255), 2)
                        cv.line(img, (x_min, y_min), (x_min, y_min + 10), (255, 0, 255), 2)
                        cv.line(img, (x_min + width, y_min + height), (x_min + width - 10, y_min + height), (255, 0, 255), 2)
                        cv.line(img, (x_min + width, y_min + height), (x_min + width, y_min + height - 10), (255, 0, 255), 2)
            
                        cv.line(img, (x_min + width, y_min), (x_min + width, y_min + 10), (255, 0, 255), 2)
                        cv.line(img, (x_min + width, y_min), (x_min + width - 10, y_min), (255, 0, 255), 2)
                        cv.line(img, (x_min, y_min + height), (x_min, y_min + height - 10), (255, 0, 255), 2)
                        cv.line(img, (x_min, y_min + height), (x_min + 10, y_min + height), (255, 0, 255), 2)
                    #------------------

                        cv.putText(img, f'{int(confidence[0] * 100)}%', (x_min, y_min - 7),
                                cv.FONT_HERSHEY_PLAIN, 1, (255, 0, 255), 1)
                        
                    
                        t = temp_calc(x_min, y_min2, width, height2) 
                        if t < 37.40:   
                            cv.putText(img, f'{t}', (x_min + width - 40, y_min - 5), cv.FONT_HERSHEY_PLAIN, 1, (0, 255, 0), 2)
                        else:
                            cv.putText(img, f'{t}', (x_min + width - 40, y_min - 5), cv.FONT_HERSHEY_PLAIN, 1, (0, 0, 255), 2)

                        
                        msg = bridge.cv2_to_imgmsg(img, "bgr8")     	# convert to image message for ROS to publish
                        pub2.publish(msg)
                        rospy.loginfo(t)
                        pub1.publish(t)
                        rate.sleep()


        if cv.waitKey(1) & 0xFF == ord('q'):
            break
    cap.release()


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass

       
