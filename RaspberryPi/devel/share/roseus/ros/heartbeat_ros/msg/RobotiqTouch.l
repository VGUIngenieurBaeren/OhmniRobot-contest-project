;; Auto-generated. Do not edit!


(when (boundp 'heartbeat_ros::RobotiqTouch)
  (if (not (find-package "HEARTBEAT_ROS"))
    (make-package "HEARTBEAT_ROS"))
  (shadow 'RobotiqTouch (find-package "HEARTBEAT_ROS")))
(unless (find-package "HEARTBEAT_ROS::ROBOTIQTOUCH")
  (make-package "HEARTBEAT_ROS::ROBOTIQTOUCH"))

(in-package "ROS")
;;//! \htmlinclude RobotiqTouch.msg.html


(defclass heartbeat_ros::RobotiqTouch
  :super ros::object
  :slots (_f0 _f1 _f2 ))

(defmethod heartbeat_ros::RobotiqTouch
  (:init
   (&key
    ((:f0 __f0) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:f1 __f1) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:f2 __f2) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _f0 __f0)
   (setq _f1 __f1)
   (setq _f2 __f2)
   self)
  (:f0
   (&optional __f0)
   (if __f0 (setq _f0 __f0)) _f0)
  (:f1
   (&optional __f1)
   (if __f1 (setq _f1 __f1)) _f1)
  (:f2
   (&optional __f2)
   (if __f2 (setq _f2 __f2)) _f2)
  (:serialization-length
   ()
   (+
    ;; float32[] _f0
    (* 4    (length _f0)) 4
    ;; float32[] _f1
    (* 4    (length _f1)) 4
    ;; float32[] _f2
    (* 4    (length _f2)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _f0
     (write-long (length _f0) s)
     (dotimes (i (length _f0))
       (sys::poke (elt _f0 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _f1
     (write-long (length _f1) s)
     (dotimes (i (length _f1))
       (sys::poke (elt _f1 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _f2
     (write-long (length _f2) s)
     (dotimes (i (length _f2))
       (sys::poke (elt _f2 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _f0
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _f0 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _f0 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _f1
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _f1 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _f1 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _f2
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _f2 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _f2 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get heartbeat_ros::RobotiqTouch :md5sum-) "234fe178cd7a49e08b0a65ebe3a3936d")
(setf (get heartbeat_ros::RobotiqTouch :datatype-) "heartbeat_ros/RobotiqTouch")
(setf (get heartbeat_ros::RobotiqTouch :definition-)
      "# message format for raw sensor data
float32[] f0
float32[] f1
float32[] f2

")



(provide :heartbeat_ros/RobotiqTouch "234fe178cd7a49e08b0a65ebe3a3936d")


