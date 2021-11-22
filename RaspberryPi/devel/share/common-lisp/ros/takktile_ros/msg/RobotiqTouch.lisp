; Auto-generated. Do not edit!


(cl:in-package takktile_ros-msg)


;//! \htmlinclude RobotiqTouch.msg.html

(cl:defclass <RobotiqTouch> (roslisp-msg-protocol:ros-message)
  ((f0
    :reader f0
    :initarg :f0
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (f1
    :reader f1
    :initarg :f1
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (f2
    :reader f2
    :initarg :f2
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass RobotiqTouch (<RobotiqTouch>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotiqTouch>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotiqTouch)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name takktile_ros-msg:<RobotiqTouch> is deprecated: use takktile_ros-msg:RobotiqTouch instead.")))

(cl:ensure-generic-function 'f0-val :lambda-list '(m))
(cl:defmethod f0-val ((m <RobotiqTouch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader takktile_ros-msg:f0-val is deprecated.  Use takktile_ros-msg:f0 instead.")
  (f0 m))

(cl:ensure-generic-function 'f1-val :lambda-list '(m))
(cl:defmethod f1-val ((m <RobotiqTouch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader takktile_ros-msg:f1-val is deprecated.  Use takktile_ros-msg:f1 instead.")
  (f1 m))

(cl:ensure-generic-function 'f2-val :lambda-list '(m))
(cl:defmethod f2-val ((m <RobotiqTouch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader takktile_ros-msg:f2-val is deprecated.  Use takktile_ros-msg:f2 instead.")
  (f2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotiqTouch>) ostream)
  "Serializes a message object of type '<RobotiqTouch>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'f0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'f0))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'f1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'f1))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'f2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'f2))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotiqTouch>) istream)
  "Deserializes a message object of type '<RobotiqTouch>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'f0) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'f0)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'f1) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'f1)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'f2) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'f2)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotiqTouch>)))
  "Returns string type for a message object of type '<RobotiqTouch>"
  "takktile_ros/RobotiqTouch")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotiqTouch)))
  "Returns string type for a message object of type 'RobotiqTouch"
  "takktile_ros/RobotiqTouch")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotiqTouch>)))
  "Returns md5sum for a message object of type '<RobotiqTouch>"
  "234fe178cd7a49e08b0a65ebe3a3936d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotiqTouch)))
  "Returns md5sum for a message object of type 'RobotiqTouch"
  "234fe178cd7a49e08b0a65ebe3a3936d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotiqTouch>)))
  "Returns full string definition for message of type '<RobotiqTouch>"
  (cl:format cl:nil "# message format for raw sensor data~%float32[] f0~%float32[] f1~%float32[] f2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotiqTouch)))
  "Returns full string definition for message of type 'RobotiqTouch"
  (cl:format cl:nil "# message format for raw sensor data~%float32[] f0~%float32[] f1~%float32[] f2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotiqTouch>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'f0) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'f1) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'f2) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotiqTouch>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotiqTouch
    (cl:cons ':f0 (f0 msg))
    (cl:cons ':f1 (f1 msg))
    (cl:cons ':f2 (f2 msg))
))
