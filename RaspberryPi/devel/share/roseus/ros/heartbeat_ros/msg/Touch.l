;; Auto-generated. Do not edit!


(when (boundp 'heartbeat_ros::Touch)
  (if (not (find-package "HEARTBEAT_ROS"))
    (make-package "HEARTBEAT_ROS"))
  (shadow 'Touch (find-package "HEARTBEAT_ROS")))
(unless (find-package "HEARTBEAT_ROS::TOUCH")
  (make-package "HEARTBEAT_ROS::TOUCH"))

(in-package "ROS")
;;//! \htmlinclude Touch.msg.html


(defclass heartbeat_ros::Touch
  :super ros::object
  :slots (_pressure ))

(defmethod heartbeat_ros::Touch
  (:init
   (&key
    ((:pressure __pressure) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _pressure __pressure)
   self)
  (:pressure
   (&optional __pressure)
   (if __pressure (setq _pressure __pressure)) _pressure)
  (:serialization-length
   ()
   (+
    ;; float32[] _pressure
    (* 4    (length _pressure)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _pressure
     (write-long (length _pressure) s)
     (dotimes (i (length _pressure))
       (sys::poke (elt _pressure i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _pressure
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pressure (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pressure i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get heartbeat_ros::Touch :md5sum-) "4a3d699886be367f8749f5edfbaab0ff")
(setf (get heartbeat_ros::Touch :datatype-) "heartbeat_ros/Touch")
(setf (get heartbeat_ros::Touch :definition-)
      "# message format for raw sensor data
float32[] pressure

")



(provide :heartbeat_ros/Touch "4a3d699886be367f8749f5edfbaab0ff")


