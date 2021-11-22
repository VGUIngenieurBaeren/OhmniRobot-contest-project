;; Auto-generated. Do not edit!


(when (boundp 'takktile_ros::Contact)
  (if (not (find-package "TAKKTILE_ROS"))
    (make-package "TAKKTILE_ROS"))
  (shadow 'Contact (find-package "TAKKTILE_ROS")))
(unless (find-package "TAKKTILE_ROS::CONTACT")
  (make-package "TAKKTILE_ROS::CONTACT"))

(in-package "ROS")
;;//! \htmlinclude Contact.msg.html


(defclass takktile_ros::Contact
  :super ros::object
  :slots (_pressure ))

(defmethod takktile_ros::Contact
  (:init
   (&key
    ((:pressure __pressure) (let (r) (dotimes (i 0) (push nil r)) r))
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
    ;; bool[] _pressure
    (* 1    (length _pressure)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool[] _pressure
     (write-long (length _pressure) s)
     (dotimes (i (length _pressure))
       (if (elt _pressure i) (write-byte -1 s) (write-byte 0 s))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool[] _pressure
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pressure (make-list n))
     (dotimes (i n)
     (setf (elt _pressure i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;;
   self)
  )

(setf (get takktile_ros::Contact :md5sum-) "620ca9b8e487092667c7d7be8066ab46")
(setf (get takktile_ros::Contact :datatype-) "takktile_ros/Contact")
(setf (get takktile_ros::Contact :definition-)
      "# message format for raw sensor data
bool[] pressure

")



(provide :takktile_ros/Contact "620ca9b8e487092667c7d7be8066ab46")


