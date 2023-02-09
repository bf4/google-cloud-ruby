# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/video/transcoder/v1/services.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/video/transcoder/v1/resources_pb'
require 'google/protobuf/empty_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/video/transcoder/v1/services.proto", :syntax => :proto3) do
    add_message "google.cloud.video.transcoder.v1.CreateJobRequest" do
      optional :parent, :string, 1
      optional :job, :message, 2, "google.cloud.video.transcoder.v1.Job"
    end
    add_message "google.cloud.video.transcoder.v1.ListJobsRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :filter, :string, 4
      optional :order_by, :string, 5
    end
    add_message "google.cloud.video.transcoder.v1.GetJobRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.video.transcoder.v1.DeleteJobRequest" do
      optional :name, :string, 1
      optional :allow_missing, :bool, 2
    end
    add_message "google.cloud.video.transcoder.v1.ListJobsResponse" do
      repeated :jobs, :message, 1, "google.cloud.video.transcoder.v1.Job"
      optional :next_page_token, :string, 2
      repeated :unreachable, :string, 3
    end
    add_message "google.cloud.video.transcoder.v1.CreateJobTemplateRequest" do
      optional :parent, :string, 1
      optional :job_template, :message, 2, "google.cloud.video.transcoder.v1.JobTemplate"
      optional :job_template_id, :string, 3
    end
    add_message "google.cloud.video.transcoder.v1.ListJobTemplatesRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :filter, :string, 4
      optional :order_by, :string, 5
    end
    add_message "google.cloud.video.transcoder.v1.GetJobTemplateRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.video.transcoder.v1.DeleteJobTemplateRequest" do
      optional :name, :string, 1
      optional :allow_missing, :bool, 2
    end
    add_message "google.cloud.video.transcoder.v1.ListJobTemplatesResponse" do
      repeated :job_templates, :message, 1, "google.cloud.video.transcoder.v1.JobTemplate"
      optional :next_page_token, :string, 2
      repeated :unreachable, :string, 3
    end
  end
end

module Google
  module Cloud
    module Video
      module Transcoder
        module V1
          CreateJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.video.transcoder.v1.CreateJobRequest").msgclass
          ListJobsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.video.transcoder.v1.ListJobsRequest").msgclass
          GetJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.video.transcoder.v1.GetJobRequest").msgclass
          DeleteJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.video.transcoder.v1.DeleteJobRequest").msgclass
          ListJobsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.video.transcoder.v1.ListJobsResponse").msgclass
          CreateJobTemplateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.video.transcoder.v1.CreateJobTemplateRequest").msgclass
          ListJobTemplatesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.video.transcoder.v1.ListJobTemplatesRequest").msgclass
          GetJobTemplateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.video.transcoder.v1.GetJobTemplateRequest").msgclass
          DeleteJobTemplateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.video.transcoder.v1.DeleteJobTemplateRequest").msgclass
          ListJobTemplatesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.video.transcoder.v1.ListJobTemplatesResponse").msgclass
        end
      end
    end
  end
end