# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/aiplatform/v1/annotation_spec.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/aiplatform/v1/annotation_spec.proto", :syntax => :proto3) do
    add_message "google.cloud.aiplatform.v1.AnnotationSpec" do
      optional :name, :string, 1
      optional :display_name, :string, 2
      optional :create_time, :message, 3, "google.protobuf.Timestamp"
      optional :update_time, :message, 4, "google.protobuf.Timestamp"
      optional :etag, :string, 5
    end
  end
end

module Google
  module Cloud
    module AIPlatform
      module V1
        AnnotationSpec = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.AnnotationSpec").msgclass
      end
    end
  end
end
