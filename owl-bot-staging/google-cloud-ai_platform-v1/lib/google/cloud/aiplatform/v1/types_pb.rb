# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/aiplatform/v1/types.proto

require 'google/protobuf'


descriptor_data = "\n&google/cloud/aiplatform/v1/types.proto\x12\x1agoogle.cloud.aiplatform.v1\"\x1b\n\tBoolArray\x12\x0e\n\x06values\x18\x01 \x03(\x08\"\x1d\n\x0b\x44oubleArray\x12\x0e\n\x06values\x18\x01 \x03(\x01\"\x1c\n\nInt64Array\x12\x0e\n\x06values\x18\x01 \x03(\x03\"\x1d\n\x0bStringArray\x12\x0e\n\x06values\x18\x01 \x03(\t\"\x93\x05\n\x06Tensor\x12:\n\x05\x64type\x18\x01 \x01(\x0e\x32+.google.cloud.aiplatform.v1.Tensor.DataType\x12\r\n\x05shape\x18\x02 \x03(\x03\x12\x10\n\x08\x62ool_val\x18\x03 \x03(\x08\x12\x12\n\nstring_val\x18\x0e \x03(\t\x12\x11\n\tbytes_val\x18\x0f \x03(\x0c\x12\x11\n\tfloat_val\x18\x05 \x03(\x02\x12\x12\n\ndouble_val\x18\x06 \x03(\x01\x12\x0f\n\x07int_val\x18\x07 \x03(\x05\x12\x11\n\tint64_val\x18\x08 \x03(\x03\x12\x10\n\x08uint_val\x18\t \x03(\r\x12\x12\n\nuint64_val\x18\n \x03(\x04\x12\x34\n\x08list_val\x18\x0b \x03(\x0b\x32\".google.cloud.aiplatform.v1.Tensor\x12\x45\n\nstruct_val\x18\x0c \x03(\x0b\x32\x31.google.cloud.aiplatform.v1.Tensor.StructValEntry\x12\x12\n\ntensor_val\x18\r \x01(\x0c\x1aT\n\x0eStructValEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\x31\n\x05value\x18\x02 \x01(\x0b\x32\".google.cloud.aiplatform.v1.Tensor:\x02\x38\x01\"\xac\x01\n\x08\x44\x61taType\x12\x19\n\x15\x44\x41TA_TYPE_UNSPECIFIED\x10\x00\x12\x08\n\x04\x42OOL\x10\x01\x12\n\n\x06STRING\x10\x02\x12\t\n\x05\x46LOAT\x10\x03\x12\n\n\x06\x44OUBLE\x10\x04\x12\x08\n\x04INT8\x10\x05\x12\t\n\x05INT16\x10\x06\x12\t\n\x05INT32\x10\x07\x12\t\n\x05INT64\x10\x08\x12\t\n\x05UINT8\x10\t\x12\n\n\x06UINT16\x10\n\x12\n\n\x06UINT32\x10\x0b\x12\n\n\x06UINT64\x10\x0c\x42\xc8\x01\n\x1e\x63om.google.cloud.aiplatform.v1B\nTypesProtoP\x01Z>cloud.google.com/go/aiplatform/apiv1/aiplatformpb;aiplatformpb\xaa\x02\x1aGoogle.Cloud.AIPlatform.V1\xca\x02\x1aGoogle\\Cloud\\AIPlatform\\V1\xea\x02\x1dGoogle::Cloud::AIPlatform::V1b\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module Google
  module Cloud
    module AIPlatform
      module V1
        BoolArray = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.BoolArray").msgclass
        DoubleArray = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.DoubleArray").msgclass
        Int64Array = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.Int64Array").msgclass
        StringArray = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.StringArray").msgclass
        Tensor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.Tensor").msgclass
        Tensor::DataType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.Tensor.DataType").enummodule
      end
    end
  end
end
