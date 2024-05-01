# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/aiplatform/v1/schedule.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/aiplatform/v1/pipeline_service_pb'
require 'google/protobuf/timestamp_pb'


descriptor_data = "\n)google/cloud/aiplatform/v1/schedule.proto\x12\x1agoogle.cloud.aiplatform.v1\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a\x31google/cloud/aiplatform/v1/pipeline_service.proto\x1a\x1fgoogle/protobuf/timestamp.proto\"\x85\t\n\x08Schedule\x12\x0e\n\x04\x63ron\x18\n \x01(\tH\x00\x12[\n\x1b\x63reate_pipeline_job_request\x18\x0e \x01(\x0b\x32\x34.google.cloud.aiplatform.v1.CreatePipelineJobRequestH\x01\x12\x11\n\x04name\x18\x01 \x01(\tB\x03\xe0\x41\x05\x12\x19\n\x0c\x64isplay_name\x18\x02 \x01(\tB\x03\xe0\x41\x02\x12\x33\n\nstart_time\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x01\x12\x31\n\x08\x65nd_time\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x01\x12\x1a\n\rmax_run_count\x18\x10 \x01(\x03\x42\x03\xe0\x41\x01\x12\x1e\n\x11started_run_count\x18\x11 \x01(\x03\x42\x03\xe0\x41\x03\x12>\n\x05state\x18\x05 \x01(\x0e\x32*.google.cloud.aiplatform.v1.Schedule.StateB\x03\xe0\x41\x03\x12\x34\n\x0b\x63reate_time\x18\x06 \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x03\x12\x34\n\x0bupdate_time\x18\x13 \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x03\x12\x36\n\rnext_run_time\x18\x07 \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x03\x12\x38\n\x0flast_pause_time\x18\x08 \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x03\x12\x39\n\x10last_resume_time\x18\t \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x03\x12%\n\x18max_concurrent_run_count\x18\x0b \x01(\x03\x42\x03\xe0\x41\x02\x12\x1b\n\x0e\x61llow_queueing\x18\x0c \x01(\x08\x42\x03\xe0\x41\x01\x12\x15\n\x08\x63\x61tch_up\x18\r \x01(\x08\x42\x03\xe0\x41\x03\x12Z\n\x1blast_scheduled_run_response\x18\x12 \x01(\x0b\x32\x30.google.cloud.aiplatform.v1.Schedule.RunResponseB\x03\xe0\x41\x03\x1a[\n\x0bRunResponse\x12\x36\n\x12scheduled_run_time\x18\x01 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12\x14\n\x0crun_response\x18\x02 \x01(\t\"E\n\x05State\x12\x15\n\x11STATE_UNSPECIFIED\x10\x00\x12\n\n\x06\x41\x43TIVE\x10\x01\x12\n\n\x06PAUSED\x10\x02\x12\r\n\tCOMPLETED\x10\x03:e\xea\x41\x62\n\"aiplatform.googleapis.com/Schedule\x12<projects/{project}/locations/{location}/schedules/{schedule}B\x14\n\x12time_specificationB\t\n\x07requestB\xcb\x01\n\x1e\x63om.google.cloud.aiplatform.v1B\rScheduleProtoP\x01Z>cloud.google.com/go/aiplatform/apiv1/aiplatformpb;aiplatformpb\xaa\x02\x1aGoogle.Cloud.AIPlatform.V1\xca\x02\x1aGoogle\\Cloud\\AIPlatform\\V1\xea\x02\x1dGoogle::Cloud::AIPlatform::V1b\x06proto3"

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
    ["google.cloud.aiplatform.v1.CreatePipelineJobRequest", "google/cloud/aiplatform/v1/pipeline_service.proto"],
    ["google.protobuf.Timestamp", "google/protobuf/timestamp.proto"],
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
        Schedule = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.Schedule").msgclass
        Schedule::RunResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.Schedule.RunResponse").msgclass
        Schedule::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.Schedule.State").enummodule
      end
    end
  end
end
