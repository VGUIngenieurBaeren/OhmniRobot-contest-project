#ifndef _ROS_sensor_msgs_HeartBeat_h
#define _ROS_sensor_msgs_HeartBeat_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "std_msgs/Header.h"

namespace ohmni_ros_msgs
{

  class HeartBeat : public ros::Msg
  {
    public:
      typedef std_msgs::Header _header_type;
      _header_type header;
      typedef float _bpm_type;
      _bpm_type bpm;
      typedef float _oxygen_type;
      _oxygen_type oxygen;

    HeartBeat():
      header(),
      bpm(0),
      oxygen(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      offset += this->header.serialize(outbuffer + offset);
      offset += serializeAvrFloat64(outbuffer + offset, this->bpm);
      offset += serializeAvrFloat64(outbuffer + offset, this->oxygen);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      offset += this->header.deserialize(inbuffer + offset);
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->bpm));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->oxygen));
     return offset;
    }

    virtual const char * getType() override { return "heartbeat_ros/HeartBeat"; };
    virtual const char * getMD5() override { return "48fe24edbde326dd4f8672f1cc71748c"; };

  };

}
#endif
