# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/bigtable/admin/v2/common.proto

require 'google/protobuf/timestamp_pb'
require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/bigtable/admin/v2/common.proto", :syntax => :proto3) do
    add_message "google.bigtable.admin.v2.OperationProgress" do
      optional :progress_percent, :int32, 1
      optional :start_time, :message, 2, "google.protobuf.Timestamp"
      optional :end_time, :message, 3, "google.protobuf.Timestamp"
    end
    add_enum "google.bigtable.admin.v2.StorageType" do
      value :STORAGE_TYPE_UNSPECIFIED, 0
      value :SSD, 1
      value :HDD, 2
    end
  end
end

module Google
  module Cloud
    module Bigtable
      module Admin
        module V2
          OperationProgress = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.bigtable.admin.v2.OperationProgress").msgclass
          StorageType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.bigtable.admin.v2.StorageType").enummodule
        end
      end
    end
  end
end
