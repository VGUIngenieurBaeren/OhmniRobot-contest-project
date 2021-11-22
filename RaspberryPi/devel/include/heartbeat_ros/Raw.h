// Generated by gencpp from file heartbeat_ros/Raw.msg
// DO NOT EDIT!


#ifndef HEARTBEAT_ROS_MESSAGE_RAW_H
#define HEARTBEAT_ROS_MESSAGE_RAW_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace heartbeat_ros
{
template <class ContainerAllocator>
struct Raw_
{
  typedef Raw_<ContainerAllocator> Type;

  Raw_()
    : pressure()
    , temp()  {
    }
  Raw_(const ContainerAllocator& _alloc)
    : pressure(_alloc)
    , temp(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _pressure_type;
  _pressure_type pressure;

   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _temp_type;
  _temp_type temp;





  typedef boost::shared_ptr< ::heartbeat_ros::Raw_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::heartbeat_ros::Raw_<ContainerAllocator> const> ConstPtr;

}; // struct Raw_

typedef ::heartbeat_ros::Raw_<std::allocator<void> > Raw;

typedef boost::shared_ptr< ::heartbeat_ros::Raw > RawPtr;
typedef boost::shared_ptr< ::heartbeat_ros::Raw const> RawConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::heartbeat_ros::Raw_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::heartbeat_ros::Raw_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::heartbeat_ros::Raw_<ContainerAllocator1> & lhs, const ::heartbeat_ros::Raw_<ContainerAllocator2> & rhs)
{
  return lhs.pressure == rhs.pressure &&
    lhs.temp == rhs.temp;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::heartbeat_ros::Raw_<ContainerAllocator1> & lhs, const ::heartbeat_ros::Raw_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace heartbeat_ros

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::heartbeat_ros::Raw_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::heartbeat_ros::Raw_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::heartbeat_ros::Raw_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::heartbeat_ros::Raw_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::heartbeat_ros::Raw_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::heartbeat_ros::Raw_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::heartbeat_ros::Raw_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1bb11887f72a36a8bd673f7e41665310";
  }

  static const char* value(const ::heartbeat_ros::Raw_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1bb11887f72a36a8ULL;
  static const uint64_t static_value2 = 0xbd673f7e41665310ULL;
};

template<class ContainerAllocator>
struct DataType< ::heartbeat_ros::Raw_<ContainerAllocator> >
{
  static const char* value()
  {
    return "heartbeat_ros/Raw";
  }

  static const char* value(const ::heartbeat_ros::Raw_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::heartbeat_ros::Raw_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# message format for raw sensor data\n"
"int32[] pressure\n"
"int32[] temp\n"
;
  }

  static const char* value(const ::heartbeat_ros::Raw_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::heartbeat_ros::Raw_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pressure);
      stream.next(m.temp);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Raw_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::heartbeat_ros::Raw_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::heartbeat_ros::Raw_<ContainerAllocator>& v)
  {
    s << indent << "pressure[]" << std::endl;
    for (size_t i = 0; i < v.pressure.size(); ++i)
    {
      s << indent << "  pressure[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.pressure[i]);
    }
    s << indent << "temp[]" << std::endl;
    for (size_t i = 0; i < v.temp.size(); ++i)
    {
      s << indent << "  temp[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.temp[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // HEARTBEAT_ROS_MESSAGE_RAW_H