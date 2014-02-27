/**
 * Autogenerated by Thrift Compiler (0.9.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
#ifndef EchoServer_TYPES_H
#define EchoServer_TYPES_H

#include <thrift/Thrift.h>
#include <thrift/TApplicationException.h>
#include <thrift/protocol/TProtocol.h>
#include <thrift/transport/TTransport.h>

#include <thrift/cxxfunctional.h>




struct PacketType {
  enum type {
    PacketTypeCmd = 0,
    PacketTypeData = 1
  };
};

extern const std::map<int, const char*> _PacketType_VALUES_TO_NAMES;


class Packet {
 public:

  static const char* ascii_fingerprint; // = "D3BA2D33C1BA9DD4F2FDDA18F1640BC8";
  static const uint8_t binary_fingerprint[16]; // = {0xD3,0xBA,0x2D,0x33,0xC1,0xBA,0x9D,0xD4,0xF2,0xFD,0xDA,0x18,0xF1,0x64,0x0B,0xC8};

  Packet() : type((PacketType::type)0), len(0), data() {
  }

  virtual ~Packet() throw() {}

  PacketType::type type;
  int32_t len;
  std::string data;

  void __set_type(const PacketType::type val) {
    type = val;
  }

  void __set_len(const int32_t val) {
    len = val;
  }

  void __set_data(const std::string& val) {
    data = val;
  }

  bool operator == (const Packet & rhs) const
  {
    if (!(type == rhs.type))
      return false;
    if (!(len == rhs.len))
      return false;
    if (!(data == rhs.data))
      return false;
    return true;
  }
  bool operator != (const Packet &rhs) const {
    return !(*this == rhs);
  }

  bool operator < (const Packet & ) const;

  uint32_t read(::apache::thrift::protocol::TProtocol* iprot);
  uint32_t write(::apache::thrift::protocol::TProtocol* oprot) const;

};

void swap(Packet &a, Packet &b);



#endif
