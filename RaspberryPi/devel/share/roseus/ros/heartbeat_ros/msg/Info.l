;; Auto-generated. Do not edit!


(when (boundp 'heartbeat_ros::Info)
  (if (not (find-package "HEARTBEAT_ROS"))
    (make-package "HEARTBEAT_ROS"))
  (shadow 'Info (find-package "HEARTBEAT_ROS")))
(unless (find-package "HEARTBEAT_ROS::INFO")
  (make-package "HEARTBEAT_ROS::INFO"))

(in-package "ROS")
;;//! \htmlinclude Info.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass heartbeat_ros::Info
  :super ros::object
  :slots (_frame_id _xyz _indexes ))

(defmethod heartbeat_ros::Info
  (:init
   (&key
    ((:frame_id __frame_id) "")
    ((:xyz __xyz) ())
    ((:indexes __indexes) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _frame_id (string __frame_id))
   (setq _xyz __xyz)
   (setq _indexes __indexes)
   self)
  (:frame_id
   (&optional __frame_id)
   (if __frame_id (setq _frame_id __frame_id)) _frame_id)
  (:xyz
   (&rest __xyz)
   (if (keywordp (car __xyz))
       (send* _xyz __xyz)
     (progn
       (if __xyz (setq _xyz (car __xyz)))
       _xyz)))
  (:indexes
   (&optional __indexes)
   (if __indexes (setq _indexes __indexes)) _indexes)
  (:serialization-length
   ()
   (+
    ;; string _frame_id
    4 (length _frame_id)
    ;; geometry_msgs/Point32[] _xyz
    (apply #'+ (send-all _xyz :serialization-length)) 4
    ;; int32[] _indexes
    (* 4    (length _indexes)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _frame_id
       (write-long (length _frame_id) s) (princ _frame_id s)
     ;; geometry_msgs/Point32[] _xyz
     (write-long (length _xyz) s)
     (dolist (elem _xyz)
       (send elem :serialize s)
       )
     ;; int32[] _indexes
     (write-long (length _indexes) s)
     (dotimes (i (length _indexes))
       (write-long (elt _indexes i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _frame_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _frame_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Point32[] _xyz
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _xyz (let (r) (dotimes (i n) (push (instance geometry_msgs::Point32 :init) r)) r))
     (dolist (elem- _xyz)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int32[] _indexes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _indexes (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _indexes i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get heartbeat_ros::Info :md5sum-) "65ae3675ccd5c1fffecb419320f4ac07")
(setf (get heartbeat_ros::Info :datatype-) "heartbeat_ros/Info")
(setf (get heartbeat_ros::Info :definition-)
      "# message format for raw sensor data
string frame_id
geometry_msgs/Point32[] xyz
int32[] indexes


================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
")



(provide :heartbeat_ros/Info "65ae3675ccd5c1fffecb419320f4ac07")


