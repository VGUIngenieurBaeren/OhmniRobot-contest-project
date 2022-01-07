// Generated by gencpp from file takktile_ros/HeartBeat.msg
// DO NOT EDIT!


#ifndef TAKKTILE_ROS_MESSAGE_HEARTBEAT_H
#define TAKKTILE_ROS_MESSAGE_HEARTBEAT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace takktile_ros
{
template <class ContainerAllocator>
struct HeartBeat_
{
  typedef HeartBeat_<ContainerAllocator> Type;

  HeartBeat_()
    : header()
    , bpm(0.0)
    , oxygen(0.0)  {
    }
  HeartBeat_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , bpm(0.0)
    , oxygen(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef double _bpm_type;
  _bpm_type bpm;

   typedef double _oxygen_type;
  _oxygen_type oxygen;





  typedef boost::shared_ptr< ::takktile_ros::HeartBeat_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::takktile_ros::HeartBeat_<ContainerAllocator> const> ConstPtr;

}; // struct HeartBeat_

typedef ::takktile_ros::HeartBeat_<std::allocator<void> > HeartBeat;

typedef boost::shared_ptr< ::takktile_ros::HeartBeat > HeartBeatPtr;
typedef boost::shared_ptr< ::takktile_ros::HeartBeat const> HeartBeatConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::takktile_ros::HeartBeat_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::takktile_ros::HeartBeat_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::takktile_ros::HeartBeat_<ContainerAllocator1> & lhs, const ::takktile_ros::HeartBeat_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.bpm == rhs.bpm &&
    lhs.oxygen == rhs.oxygen;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::takktile_ros::HeartBeat_<ContainerAllocator1> & lhs, const ::takktile_ros::HeartBeat_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace takktile_ros

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::takktile_ros::HeartBeat_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::takktile_ros::HeartBeat_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::takktile_ros::HeartBeat_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::takktile_ros::HeartBeat_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::takktile_ros::HeartBeat_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::takktile_ros::HeartBeat_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::takktile_ros::HeartBeat_<ContainerAllocator> >
{
  static const char* value()
  {
    return "48fe24edbde326dd4f8672f1cc71748c";
  }

  static const char* value(const ::takktile_ros::HeartBeat_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x48fe24edbde326ddULL;
  static const uint64_t static_value2 = 0x4f8672f1cc71748cULL;
};

template<class ContainerAllocator>
struct DataType< ::takktile_ros::HeartBeat_<ContainerAllocator> >
{
  static const char* value()
  {
    return "takktile_ros/HeartBeat";
  }

  static const char* value(const ::takktile_ros::HeartBeat_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::takktile_ros::HeartBeat_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
" Header header             # timestamp of the measurement\n"
"                           # frame_id is the location of the humidity sensor\n"
"\n"
" float64 bpm # Expression of the relative humidity\n"
"                           # from 0.0 to 1.0.\n"
"                           # 0.0 is no partial pressure of water vapor\n"
"                           # 1.0 represents partial pressure of saturation\n"
"\n"
" float64 oxygen          # 0 is interpreted as variance unknown\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::takktile_ros::HeartBeat_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::takktile_ros::HeartBeat_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.bpm);
      stream.next(m.oxygen);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct HeartBeat_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::takktile_ros::HeartBeat_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::takktile_ros::HeartBeat_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "bpm: ";
    Printer<double>::stream(s, indent + "  ", v.bpm);
    s << indent << "oxygen: ";
    Printer<double>::stream(s, indent + "  ", v.oxygen);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TAKKTILE_ROS_MESSAGE_HEARTBEAT_H