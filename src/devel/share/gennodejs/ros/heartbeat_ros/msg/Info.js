// Auto-generated. Do not edit!

// (in-package heartbeat_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.frame_id = null;
      this.xyz = null;
      this.indexes = null;
    }
    else {
      if (initObj.hasOwnProperty('frame_id')) {
        this.frame_id = initObj.frame_id
      }
      else {
        this.frame_id = '';
      }
      if (initObj.hasOwnProperty('xyz')) {
        this.xyz = initObj.xyz
      }
      else {
        this.xyz = [];
      }
      if (initObj.hasOwnProperty('indexes')) {
        this.indexes = initObj.indexes
      }
      else {
        this.indexes = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Info
    // Serialize message field [frame_id]
    bufferOffset = _serializer.string(obj.frame_id, buffer, bufferOffset);
    // Serialize message field [xyz]
    // Serialize the length for message field [xyz]
    bufferOffset = _serializer.uint32(obj.xyz.length, buffer, bufferOffset);
    obj.xyz.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point32.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [indexes]
    bufferOffset = _arraySerializer.int32(obj.indexes, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Info
    let len;
    let data = new Info(null);
    // Deserialize message field [frame_id]
    data.frame_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [xyz]
    // Deserialize array length for message field [xyz]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.xyz = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.xyz[i] = geometry_msgs.msg.Point32.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [indexes]
    data.indexes = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.frame_id);
    length += 12 * object.xyz.length;
    length += 4 * object.indexes.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'heartbeat_ros/Info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '65ae3675ccd5c1fffecb419320f4ac07';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # message format for raw sensor data
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Info(null);
    if (msg.frame_id !== undefined) {
      resolved.frame_id = msg.frame_id;
    }
    else {
      resolved.frame_id = ''
    }

    if (msg.xyz !== undefined) {
      resolved.xyz = new Array(msg.xyz.length);
      for (let i = 0; i < resolved.xyz.length; ++i) {
        resolved.xyz[i] = geometry_msgs.msg.Point32.Resolve(msg.xyz[i]);
      }
    }
    else {
      resolved.xyz = []
    }

    if (msg.indexes !== undefined) {
      resolved.indexes = msg.indexes;
    }
    else {
      resolved.indexes = []
    }

    return resolved;
    }
};

module.exports = Info;
