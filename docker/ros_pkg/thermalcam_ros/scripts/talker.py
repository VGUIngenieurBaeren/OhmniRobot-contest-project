#!/home/rik/PycharmProjects/thermal_pub_rawdata/venv/bin/python3
import cv2 as cv
import mediapipe as mp
import time

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


# --- Face detection Module ---
class FaceDetector:
    def __init__(self, minDetectionConfidence=0.8):

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


def talker():

    cap = cv.VideoCapture(0)
    detector = FaceDetector()

    count = 0

    bridge = CvBridge()
    pub = rospy.Publisher('Vidcam', Image, queue_size=1)  # topic2_publish the image which includes face detected & avg temperature
    rospy.init_node('Vidcam', anonymous=True)
    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        while cap.isOpened():
            ret, img = cap.read()
            if ret:
                count = count + 1
                img = cv.resize(img, dsize=(640, 480))

                if count % 1 == 0:                              
                    img, bboxes = detector.findFaces(img)
                    for bbox in bboxes:
                        x_min, y_min, width, height = bbox[0]
                        confidence = bbox[1]

                        cv.rectangle(img, (x_min, y_min), (x_min + width, y_min + height), (255, 0, 255), 1)

                        # --- Draw the bounding box for detected face ---
                        cv.line(img, (x_min, y_min), (x_min + 10, y_min), (255, 0, 255), 2)
                        cv.line(img, (x_min, y_min), (x_min, y_min + 10), (255, 0, 255), 2)
                        cv.line(img, (x_min + width, y_min + height), (x_min + width - 10, y_min + height), (255, 0, 255), 2)
                        cv.line(img, (x_min + width, y_min + height), (x_min + width, y_min + height - 10), (255, 0, 255), 2)

                        cv.line(img, (x_min + width, y_min), (x_min + width, y_min + 10), (255, 0, 255), 2)
                        cv.line(img, (x_min + width, y_min), (x_min + width - 10, y_min), (255, 0, 255), 2)
                        cv.line(img, (x_min, y_min + height), (x_min, y_min + height - 10), (255, 0, 255), 2)
                        cv.line(img, (x_min, y_min + height), (x_min + 10, y_min + height), (255, 0, 255), 2)
                        # ------------------

                        cv.putText(img, f'{int(confidence[0] * 100)}%', (x_min, y_min - 7),
                                   cv.FONT_HERSHEY_PLAIN, 1, (255, 0, 255), 1)

                        msg = bridge.cv2_to_imgmsg(img, "bgr8")			# convert to image message for ROS to publish
                        rospy.loginfo(msg)
                        pub.publish(msg)
                        rate.sleep()


        if cv.waitKey(1) & 0xFF == ord('q'):
            break
    cap.release()


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
