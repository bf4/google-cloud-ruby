# frozen_string_literal: true

# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "helper"

require "gapic/grpc/service_stub"

require "google/cloud/aiplatform/v1/persistent_resource_service_pb"
require "google/cloud/aiplatform/v1/persistent_resource_service_services_pb"
require "google/cloud/ai_platform/v1/persistent_resource_service"

class ::Google::Cloud::AIPlatform::V1::PersistentResourceService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args, **kwargs
      @call_rpc_count += 1

      @requests << @block&.call(*args, **kwargs)

      yield @response, @operation if block_given?

      @response
    end

    def endpoint
      "endpoint.example.com"
    end

    def universe_domain
      "example.com"
    end
  end

  def test_create_persistent_resource
    # Create GRPC objects.
    grpc_response = ::Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    persistent_resource = {}
    persistent_resource_id = "hello world"

    create_persistent_resource_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_persistent_resource, name
      assert_kind_of ::Google::Cloud::AIPlatform::V1::CreatePersistentResourceRequest, request
      assert_equal "hello world", request["parent"]
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::AIPlatform::V1::PersistentResource), request["persistent_resource"]
      assert_equal "hello world", request["persistent_resource_id"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_persistent_resource_client_stub do
      # Create client
      client = ::Google::Cloud::AIPlatform::V1::PersistentResourceService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_persistent_resource({ parent: parent, persistent_resource: persistent_resource, persistent_resource_id: persistent_resource_id }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_persistent_resource parent: parent, persistent_resource: persistent_resource, persistent_resource_id: persistent_resource_id do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_persistent_resource ::Google::Cloud::AIPlatform::V1::CreatePersistentResourceRequest.new(parent: parent, persistent_resource: persistent_resource, persistent_resource_id: persistent_resource_id) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_persistent_resource({ parent: parent, persistent_resource: persistent_resource, persistent_resource_id: persistent_resource_id }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_persistent_resource(::Google::Cloud::AIPlatform::V1::CreatePersistentResourceRequest.new(parent: parent, persistent_resource: persistent_resource, persistent_resource_id: persistent_resource_id), grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_persistent_resource_client_stub.call_rpc_count
    end
  end

  def test_get_persistent_resource
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::AIPlatform::V1::PersistentResource.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_persistent_resource_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_persistent_resource, name
      assert_kind_of ::Google::Cloud::AIPlatform::V1::GetPersistentResourceRequest, request
      assert_equal "hello world", request["name"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_persistent_resource_client_stub do
      # Create client
      client = ::Google::Cloud::AIPlatform::V1::PersistentResourceService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_persistent_resource({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_persistent_resource name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_persistent_resource ::Google::Cloud::AIPlatform::V1::GetPersistentResourceRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_persistent_resource({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_persistent_resource(::Google::Cloud::AIPlatform::V1::GetPersistentResourceRequest.new(name: name), grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_persistent_resource_client_stub.call_rpc_count
    end
  end

  def test_list_persistent_resources
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::AIPlatform::V1::ListPersistentResourcesResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    list_persistent_resources_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_persistent_resources, name
      assert_kind_of ::Google::Cloud::AIPlatform::V1::ListPersistentResourcesRequest, request
      assert_equal "hello world", request["parent"]
      assert_equal 42, request["page_size"]
      assert_equal "hello world", request["page_token"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_persistent_resources_client_stub do
      # Create client
      client = ::Google::Cloud::AIPlatform::V1::PersistentResourceService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_persistent_resources({ parent: parent, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_persistent_resources parent: parent, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_persistent_resources ::Google::Cloud::AIPlatform::V1::ListPersistentResourcesRequest.new(parent: parent, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_persistent_resources({ parent: parent, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_persistent_resources(::Google::Cloud::AIPlatform::V1::ListPersistentResourcesRequest.new(parent: parent, page_size: page_size, page_token: page_token), grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_persistent_resources_client_stub.call_rpc_count
    end
  end

  def test_delete_persistent_resource
    # Create GRPC objects.
    grpc_response = ::Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_persistent_resource_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_persistent_resource, name
      assert_kind_of ::Google::Cloud::AIPlatform::V1::DeletePersistentResourceRequest, request
      assert_equal "hello world", request["name"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_persistent_resource_client_stub do
      # Create client
      client = ::Google::Cloud::AIPlatform::V1::PersistentResourceService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_persistent_resource({ name: name }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_persistent_resource name: name do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_persistent_resource ::Google::Cloud::AIPlatform::V1::DeletePersistentResourceRequest.new(name: name) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_persistent_resource({ name: name }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_persistent_resource(::Google::Cloud::AIPlatform::V1::DeletePersistentResourceRequest.new(name: name), grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_persistent_resource_client_stub.call_rpc_count
    end
  end

  def test_update_persistent_resource
    # Create GRPC objects.
    grpc_response = ::Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    persistent_resource = {}
    update_mask = {}

    update_persistent_resource_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_persistent_resource, name
      assert_kind_of ::Google::Cloud::AIPlatform::V1::UpdatePersistentResourceRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::AIPlatform::V1::PersistentResource), request["persistent_resource"]
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Protobuf::FieldMask), request["update_mask"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_persistent_resource_client_stub do
      # Create client
      client = ::Google::Cloud::AIPlatform::V1::PersistentResourceService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_persistent_resource({ persistent_resource: persistent_resource, update_mask: update_mask }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_persistent_resource persistent_resource: persistent_resource, update_mask: update_mask do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_persistent_resource ::Google::Cloud::AIPlatform::V1::UpdatePersistentResourceRequest.new(persistent_resource: persistent_resource, update_mask: update_mask) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_persistent_resource({ persistent_resource: persistent_resource, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_persistent_resource(::Google::Cloud::AIPlatform::V1::UpdatePersistentResourceRequest.new(persistent_resource: persistent_resource, update_mask: update_mask), grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_persistent_resource_client_stub.call_rpc_count
    end
  end

  def test_reboot_persistent_resource
    # Create GRPC objects.
    grpc_response = ::Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    reboot_persistent_resource_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :reboot_persistent_resource, name
      assert_kind_of ::Google::Cloud::AIPlatform::V1::RebootPersistentResourceRequest, request
      assert_equal "hello world", request["name"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, reboot_persistent_resource_client_stub do
      # Create client
      client = ::Google::Cloud::AIPlatform::V1::PersistentResourceService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.reboot_persistent_resource({ name: name }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.reboot_persistent_resource name: name do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.reboot_persistent_resource ::Google::Cloud::AIPlatform::V1::RebootPersistentResourceRequest.new(name: name) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.reboot_persistent_resource({ name: name }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.reboot_persistent_resource(::Google::Cloud::AIPlatform::V1::RebootPersistentResourceRequest.new(name: name), grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, reboot_persistent_resource_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    dummy_stub = ClientStub.new nil, nil
    Gapic::ServiceStub.stub :new, dummy_stub do
      client = ::Google::Cloud::AIPlatform::V1::PersistentResourceService::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of ::Google::Cloud::AIPlatform::V1::PersistentResourceService::Client::Configuration, config
  end

  def test_operations_client
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = nil
    dummy_stub = ClientStub.new nil, nil
    Gapic::ServiceStub.stub :new, dummy_stub do
      client = ::Google::Cloud::AIPlatform::V1::PersistentResourceService::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    assert_kind_of ::Google::Cloud::AIPlatform::V1::PersistentResourceService::Operations, client.operations_client
  end
end
