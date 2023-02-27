# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/api/servicemanagement/v1/servicemanager.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/service_pb'
require 'google/api/servicemanagement/v1/resources_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/any_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/api/servicemanagement/v1/servicemanager.proto", :syntax => :proto3) do
    add_message "google.api.servicemanagement.v1.ListServicesRequest" do
      optional :producer_project_id, :string, 1
      optional :page_size, :int32, 5
      optional :page_token, :string, 6
      optional :consumer_id, :string, 7
    end
    add_message "google.api.servicemanagement.v1.ListServicesResponse" do
      repeated :services, :message, 1, "google.api.servicemanagement.v1.ManagedService"
      optional :next_page_token, :string, 2
    end
    add_message "google.api.servicemanagement.v1.GetServiceRequest" do
      optional :service_name, :string, 1
    end
    add_message "google.api.servicemanagement.v1.CreateServiceRequest" do
      optional :service, :message, 1, "google.api.servicemanagement.v1.ManagedService"
    end
    add_message "google.api.servicemanagement.v1.DeleteServiceRequest" do
      optional :service_name, :string, 1
    end
    add_message "google.api.servicemanagement.v1.UndeleteServiceRequest" do
      optional :service_name, :string, 1
    end
    add_message "google.api.servicemanagement.v1.UndeleteServiceResponse" do
      optional :service, :message, 1, "google.api.servicemanagement.v1.ManagedService"
    end
    add_message "google.api.servicemanagement.v1.GetServiceConfigRequest" do
      optional :service_name, :string, 1
      optional :config_id, :string, 2
      optional :view, :enum, 3, "google.api.servicemanagement.v1.GetServiceConfigRequest.ConfigView"
    end
    add_enum "google.api.servicemanagement.v1.GetServiceConfigRequest.ConfigView" do
      value :BASIC, 0
      value :FULL, 1
    end
    add_message "google.api.servicemanagement.v1.ListServiceConfigsRequest" do
      optional :service_name, :string, 1
      optional :page_token, :string, 2
      optional :page_size, :int32, 3
    end
    add_message "google.api.servicemanagement.v1.ListServiceConfigsResponse" do
      repeated :service_configs, :message, 1, "google.api.Service"
      optional :next_page_token, :string, 2
    end
    add_message "google.api.servicemanagement.v1.CreateServiceConfigRequest" do
      optional :service_name, :string, 1
      optional :service_config, :message, 2, "google.api.Service"
    end
    add_message "google.api.servicemanagement.v1.SubmitConfigSourceRequest" do
      optional :service_name, :string, 1
      optional :config_source, :message, 2, "google.api.servicemanagement.v1.ConfigSource"
      optional :validate_only, :bool, 3
    end
    add_message "google.api.servicemanagement.v1.SubmitConfigSourceResponse" do
      optional :service_config, :message, 1, "google.api.Service"
    end
    add_message "google.api.servicemanagement.v1.CreateServiceRolloutRequest" do
      optional :service_name, :string, 1
      optional :rollout, :message, 2, "google.api.servicemanagement.v1.Rollout"
    end
    add_message "google.api.servicemanagement.v1.ListServiceRolloutsRequest" do
      optional :service_name, :string, 1
      optional :page_token, :string, 2
      optional :page_size, :int32, 3
      optional :filter, :string, 4
    end
    add_message "google.api.servicemanagement.v1.ListServiceRolloutsResponse" do
      repeated :rollouts, :message, 1, "google.api.servicemanagement.v1.Rollout"
      optional :next_page_token, :string, 2
    end
    add_message "google.api.servicemanagement.v1.GetServiceRolloutRequest" do
      optional :service_name, :string, 1
      optional :rollout_id, :string, 2
    end
    add_message "google.api.servicemanagement.v1.GenerateConfigReportRequest" do
      optional :new_config, :message, 1, "google.protobuf.Any"
      optional :old_config, :message, 2, "google.protobuf.Any"
    end
    add_message "google.api.servicemanagement.v1.GenerateConfigReportResponse" do
      optional :service_name, :string, 1
      optional :id, :string, 2
      repeated :change_reports, :message, 3, "google.api.servicemanagement.v1.ChangeReport"
      repeated :diagnostics, :message, 4, "google.api.servicemanagement.v1.Diagnostic"
    end
  end
end

module Google
  module Cloud
    module ServiceManagement
      module V1
        ListServicesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.ListServicesRequest").msgclass
        ListServicesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.ListServicesResponse").msgclass
        GetServiceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.GetServiceRequest").msgclass
        CreateServiceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.CreateServiceRequest").msgclass
        DeleteServiceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.DeleteServiceRequest").msgclass
        UndeleteServiceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.UndeleteServiceRequest").msgclass
        UndeleteServiceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.UndeleteServiceResponse").msgclass
        GetServiceConfigRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.GetServiceConfigRequest").msgclass
        GetServiceConfigRequest::ConfigView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.GetServiceConfigRequest.ConfigView").enummodule
        ListServiceConfigsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.ListServiceConfigsRequest").msgclass
        ListServiceConfigsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.ListServiceConfigsResponse").msgclass
        CreateServiceConfigRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.CreateServiceConfigRequest").msgclass
        SubmitConfigSourceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.SubmitConfigSourceRequest").msgclass
        SubmitConfigSourceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.SubmitConfigSourceResponse").msgclass
        CreateServiceRolloutRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.CreateServiceRolloutRequest").msgclass
        ListServiceRolloutsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.ListServiceRolloutsRequest").msgclass
        ListServiceRolloutsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.ListServiceRolloutsResponse").msgclass
        GetServiceRolloutRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.GetServiceRolloutRequest").msgclass
        GenerateConfigReportRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.GenerateConfigReportRequest").msgclass
        GenerateConfigReportResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.servicemanagement.v1.GenerateConfigReportResponse").msgclass
      end
    end
  end
end
