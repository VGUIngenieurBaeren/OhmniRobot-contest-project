// Auto-generated. Do not edit!

// (in-package heartbeat_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class HeartBeat {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.bpm = null;
      this.oxygen = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('bpm')) {
        this.bpm = initObj.bpm
      }
      else {
        this.bpm = 0.0;
      }
      if (initObj.hasOwnProperty('oxygen')) {
        this.oxygen = initObj.oxygen
      }
      else {
        this.oxygen = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HeartBeat
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [bpm]
    bufferOffset = _serializer.float64(obj.bpm, buffer, bufferOffset);
    // Serialize message field [oxygen]
    bufferOffset = _serializer.float64(obj.oxygen, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HeartBeat
    let len;
    let data = new HeartBeat(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [bpm]
    data.bpm = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [oxygen]
    data.oxygen = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'heartbeat_ros/HeartBeat';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '48fe24edbde326dd4f8672f1cc71748c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
     Header header             # timestamp of the measurement
                               # frame_id is the location of the Max30102 sensor
    
     float64 bpm # Expression of the Beat per minute
    
     float64 oxygen          #Oxygen is interpreted SpO2
     
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HeartBeat(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.bpm !== undefined) {
      resolved.bpm = msg.bpm;
    }
    else {
      resolved.bpm = 0.0
    }

    if (msg.oxygen !== undefined) {
      resolved.oxygen = msg.oxygen;
    }
    else {
      resolved.oxygen = 0.0
    }

    return resolved;
    }
};

module.exports = HeartBeat;
