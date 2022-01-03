; Auto-generated. Do not edit!


(cl:in-package takktile_ros-msg)


;//! \htmlinclude HeartBeat.msg.html

(cl:defclass <HeartBeat> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (bpm
    :reader bpm
    :initarg :bpm
    :type cl:float
    :initform 0.0)
   (oxygen
    :reader oxygen
    :initarg :oxygen
    :type cl:float
    :initform 0.0))
)

(cl:defclass HeartBeat (<HeartBeat>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HeartBeat>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HeartBeat)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name takktile_ros-msg:<HeartBeat> is deprecated: use takktile_ros-msg:HeartBeat instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <HeartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader takktile_ros-msg:header-val is deprecated.  Use takktile_ros-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'bpm-val :lambda-list '(m))
(cl:defmethod bpm-val ((m <HeartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader takktile_ros-msg:bpm-val is deprecated.  Use takktile_ros-msg:bpm instead.")
  (bpm m))

(cl:ensure-generic-function 'oxygen-val :lambda-list '(m))
(cl:defmethod oxygen-val ((m <HeartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader takktile_ros-msg:oxygen-val is deprecated.  Use takktile_ros-msg:oxygen instead.")
  (oxygen m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HeartBeat>) ostream)
  "Serializes a message object of type '<HeartBeat>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'bpm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'oxygen))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HeartBeat>) istream)
  "Deserializes a message object of type '<HeartBeat>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bpm) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'oxygen) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HeartBeat>)))
  "Returns string type for a message object of type '<HeartBeat>"
  "takktile_ros/HeartBeat")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HeartBeat)))
  "Returns string type for a message object of type 'HeartBeat"
  "takktile_ros/HeartBeat")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HeartBeat>)))
  "Returns md5sum for a message object of type '<HeartBeat>"
  "48fe24edbde326dd4f8672f1cc71748c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HeartBeat)))
  "Returns md5sum for a message object of type 'HeartBeat"
  "48fe24edbde326dd4f8672f1cc71748c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HeartBeat>)))
  "Returns full string definition for message of type '<HeartBeat>"
  (cl:format cl:nil "~% Header header             # timestamp of the measurement~%                           # frame_id is the location of the humidity sensor~%~% float64 bpm # Expression of the relative humidity~%                           # from 0.0 to 1.0.~%                           # 0.0 is no partial pressure of water vapor~%                           # 1.0 represents partial pressure of saturation~%~% float64 oxygen          # 0 is interpreted as variance unknown~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HeartBeat)))
  "Returns full string definition for message of type 'HeartBeat"
  (cl:format cl:nil "~% Header header             # timestamp of the measurement~%                           # frame_id is the location of the humidity sensor~%~% float64 bpm # Expression of the relative humidity~%                           # from 0.0 to 1.0.~%                           # 0.0 is no partial pressure of water vapor~%                           # 1.0 represents partial pressure of saturation~%~% float64 oxygen          # 0 is interpreted as variance unknown~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HeartBeat>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HeartBeat>))
  "Converts a ROS message object to a list"
  (cl:list 'HeartBeat
    (cl:cons ':header (header msg))
    (cl:cons ':bpm (bpm msg))
    (cl:cons ':oxygen (oxygen msg))
))
