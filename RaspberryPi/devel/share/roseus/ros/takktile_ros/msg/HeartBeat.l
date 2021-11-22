;; Auto-generated. Do not edit!


(when (boundp 'takktile_ros::HeartBeat)
  (if (not (find-package "TAKKTILE_ROS"))
    (make-package "TAKKTILE_ROS"))
  (shadow 'HeartBeat (find-package "TAKKTILE_ROS")))
(unless (find-package "TAKKTILE_ROS::HEARTBEAT")
  (make-package "TAKKTILE_ROS::HEARTBEAT"))

(in-package "ROS")
;;//! \htmlinclude HeartBeat.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass takktile_ros::HeartBeat
  :super ros::object
  :slots (_header _bpm _oxygen ))

(defmethod takktile_ros::HeartBeat
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:bpm __bpm) 0.0)
    ((:oxygen __oxygen) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _bpm (float __bpm))
   (setq _oxygen (float __oxygen))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:bpm
   (&optional __bpm)
   (if __bpm (setq _bpm __bpm)) _bpm)
  (:oxygen
   (&optional __oxygen)
   (if __oxygen (setq _oxygen __oxygen)) _oxygen)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _bpm
    8
    ;; float64 _oxygen
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _bpm
       (sys::poke _bpm (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _oxygen
       (sys::poke _oxygen (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _bpm
     (setq _bpm (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _oxygen
     (setq _oxygen (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get takktile_ros::HeartBeat :md5sum-) "48fe24edbde326dd4f8672f1cc71748c")
(setf (get takktile_ros::HeartBeat :datatype-) "takktile_ros/HeartBeat")
(setf (get takktile_ros::HeartBeat :definition-)
      "
 Header header             # timestamp of the measurement
                           # frame_id is the location of the humidity sensor

 float64 bpm # Expression of the relative humidity
                           # from 0.0 to 1.0.
                           # 0.0 is no partial pressure of water vapor
                           # 1.0 represents partial pressure of saturation

 float64 oxygen          # 0 is interpreted as variance unknown
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :takktile_ros/HeartBeat "48fe24edbde326dd4f8672f1cc71748c")


