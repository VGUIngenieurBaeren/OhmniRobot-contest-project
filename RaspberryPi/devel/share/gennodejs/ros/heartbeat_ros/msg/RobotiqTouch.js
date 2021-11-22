// Auto-generated. Do not edit!

// (in-package heartbeat_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class RobotiqTouch {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.f0 = null;
      this.f1 = null;
      this.f2 = null;
    }
    else {
      if (initObj.hasOwnProperty('f0')) {
        this.f0 = initObj.f0
      }
      else {
        this.f0 = [];
      }
      if (initObj.hasOwnProperty('f1')) {
        this.f1 = initObj.f1
      }
      else {
        this.f1 = [];
      }
      if (initObj.hasOwnProperty('f2')) {
        this.f2 = initObj.f2
      }
      else {
        this.f2 = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotiqTouch
    // Serialize message field [f0]
    bufferOffset = _arraySerializer.float32(obj.f0, buffer, bufferOffset, null);
    // Serialize message field [f1]
    bufferOffset = _arraySerializer.float32(obj.f1, buffer, bufferOffset, null);
    // Serialize message field [f2]
    bufferOffset = _arraySerializer.float32(obj.f2, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotiqTouch
    let len;
    let data = new RobotiqTouch(null);
    // Deserialize message field [f0]
    data.f0 = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [f1]
    data.f1 = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [f2]
    data.f2 = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.f0.length;
    length += 4 * object.f1.length;
    length += 4 * object.f2.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'heartbeat_ros/RobotiqTouch';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '234fe178cd7a49e08b0a65ebe3a3936d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # message format for raw sensor data
    float32[] f0
    float32[] f1
    float32[] f2
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotiqTouch(null);
    if (msg.f0 !== undefined) {
      resolved.f0 = msg.f0;
    }
    else {
      resolved.f0 = []
    }

    if (msg.f1 !== undefined) {
      resolved.f1 = msg.f1;
    }
    else {
      resolved.f1 = []
    }

    if (msg.f2 !== undefined) {
      resolved.f2 = msg.f2;
    }
    else {
      resolved.f2 = []
    }

    return resolved;
    }
};

module.exports = RobotiqTouch;
