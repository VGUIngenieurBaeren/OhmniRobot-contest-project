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

class Touch {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pressure = null;
    }
    else {
      if (initObj.hasOwnProperty('pressure')) {
        this.pressure = initObj.pressure
      }
      else {
        this.pressure = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Touch
    // Serialize message field [pressure]
    bufferOffset = _arraySerializer.float32(obj.pressure, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Touch
    let len;
    let data = new Touch(null);
    // Deserialize message field [pressure]
    data.pressure = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.pressure.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'heartbeat_ros/Touch';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4a3d699886be367f8749f5edfbaab0ff';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # message format for raw sensor data
    float32[] pressure
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Touch(null);
    if (msg.pressure !== undefined) {
      resolved.pressure = msg.pressure;
    }
    else {
      resolved.pressure = []
    }

    return resolved;
    }
};

module.exports = Touch;
