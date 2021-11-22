;; Auto-generated. Do not edit!


(when (boundp 'heartbeat_ros::Raw)
  (if (not (find-package "HEARTBEAT_ROS"))
    (make-package "HEARTBEAT_ROS"))
  (shadow 'Raw (find-package "HEARTBEAT_ROS")))
(unless (find-package "HEARTBEAT_ROS::RAW")
  (make-package "HEARTBEAT_ROS::RAW"))

(in-package "ROS")
;;//! \htmlinclude Raw.msg.html


(defclass heartbeat_ros::Raw
  :super ros::object
  :slots (_pressure _temp ))

(defmethod heartbeat_ros::Raw
  (:init
   (&key
    ((:pressure __pressure) (make-array 0 :initial-element 0 :element-type :integer))
    ((:temp __temp) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _pressure __pressure)
   (setq _temp __temp)
   self)
  (:pressure
   (&optional __pressure)
   (if __pressure (setq _pressure __pressure)) _pressure)
  (:temp
   (&optional __temp)
   (if __temp (setq _temp __temp)) _temp)
  (:serialization-length
   ()
   (+
    ;; int32[] _pressure
    (* 4    (length _pressure)) 4
    ;; int32[] _temp
    (* 4    (length _temp)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _pressure
     (write-long (length _pressure) s)
     (dotimes (i (length _pressure))
       (write-long (elt _pressure i) s)
       )
     ;; int32[] _temp
     (write-long (length _temp) s)
     (dotimes (i (length _temp))
       (write-long (elt _temp i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _pressure
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pressure (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _pressure i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _temp
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _temp (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _temp i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get heartbeat_ros::Raw :md5sum-) "1bb11887f72a36a8bd673f7e41665310")
(setf (get heartbeat_ros::Raw :datatype-) "heartbeat_ros/Raw")
(setf (get heartbeat_ros::Raw :definition-)
      "# message format for raw sensor data
int32[] pressure
int32[] temp

")



(provide :heartbeat_ros/Raw "1bb11887f72a36a8bd673f7e41665310")


