# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/aiplatform/v1/feature_view_sync.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/timestamp_pb'
require 'google/rpc/status_pb'
require 'google/type/interval_pb'


descriptor_data = "\n2google/cloud/aiplatform/v1/feature_view_sync.proto\x12\x1agoogle.cloud.aiplatform.v1\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a\x1fgoogle/protobuf/timestamp.proto\x1a\x17google/rpc/status.proto\x1a\x1agoogle/type/interval.proto\"\x92\x04\n\x0f\x46\x65\x61tureViewSync\x12\x11\n\x04name\x18\x01 \x01(\tB\x03\xe0\x41\x08\x12\x34\n\x0b\x63reate_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x03\x12,\n\x08run_time\x18\x05 \x01(\x0b\x32\x15.google.type.IntervalB\x03\xe0\x41\x03\x12-\n\x0c\x66inal_status\x18\x04 \x01(\x0b\x32\x12.google.rpc.StatusB\x03\xe0\x41\x03\x12R\n\x0csync_summary\x18\x06 \x01(\x0b\x32\x37.google.cloud.aiplatform.v1.FeatureViewSync.SyncSummaryB\x03\xe0\x41\x03\x1a?\n\x0bSyncSummary\x12\x17\n\nrow_synced\x18\x01 \x01(\x03\x42\x03\xe0\x41\x03\x12\x17\n\ntotal_slot\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03:\xc3\x01\xea\x41\xbf\x01\n)aiplatform.googleapis.com/FeatureViewSync\x12\x91\x01projects/{project}/locations/{location}/featureOnlineStores/{feature_online_store}/featureViews/{feature_view}/featureViewSyncs/feature_view_syncB\xd2\x01\n\x1e\x63om.google.cloud.aiplatform.v1B\x14\x46\x65\x61tureViewSyncProtoP\x01Z>cloud.google.com/go/aiplatform/apiv1/aiplatformpb;aiplatformpb\xaa\x02\x1aGoogle.Cloud.AIPlatform.V1\xca\x02\x1aGoogle\\Cloud\\AIPlatform\\V1\xea\x02\x1dGoogle::Cloud::Aiplatform::V1b\x06proto3"

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
    ["google.protobuf.Timestamp", "google/protobuf/timestamp.proto"],
    ["google.type.Interval", "google/type/interval.proto"],
    ["google.rpc.Status", "google/rpc/status.proto"],
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
    module Aiplatform
      module V1
        FeatureViewSync = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.FeatureViewSync").msgclass
        FeatureViewSync::SyncSummary = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.FeatureViewSync.SyncSummary").msgclass
      end
    end
  end
end
