# frozen_string_literal: true

# Copyright 2023 Google LLC
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
require "gapic/rest"
require "google/spanner/admin/instance/v1/spanner_instance_admin_pb"
require "google/cloud/spanner/admin/instance/v1/instance_admin/rest"


class ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_count, :requests

    def initialize response, &block
      @response = response
      @block = block
      @call_count = 0
      @requests = []
    end

    def make_get_request uri:, params: {}, options: {}
      make_http_request :get, uri: uri, body: nil, params: params, options: options
    end

    def make_delete_request uri:, params: {}, options: {}
      make_http_request :delete, uri: uri, body: nil, params: params, options: options
    end

    def make_post_request uri:, body: nil, params: {}, options: {}
      make_http_request :post, uri: uri, body: body, params: params, options: options
    end

    def make_patch_request uri:, body:, params: {}, options: {}
      make_http_request :patch, uri: uri, body: body, params: params, options: options
    end

    def make_put_request uri:, body:, params: {}, options: {}
      make_http_request :put, uri: uri, body: body, params: params, options: options
    end

    def make_http_request *args, **kwargs
      @call_count += 1

      @requests << @block&.call(*args, **kwargs)

      @response
    end
  end

  def test_list_instance_configs
    # Create test objects.
    client_result = ::Google::Cloud::Spanner::Admin::Instance::V1::ListInstanceConfigsResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    list_instance_configs_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_list_instance_configs_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, list_instance_configs_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.list_instance_configs({ parent: parent, page_size: page_size, page_token: page_token }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.list_instance_configs parent: parent, page_size: page_size, page_token: page_token do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.list_instance_configs ::Google::Cloud::Spanner::Admin::Instance::V1::ListInstanceConfigsRequest.new(parent: parent, page_size: page_size, page_token: page_token) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.list_instance_configs({ parent: parent, page_size: page_size, page_token: page_token }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.list_instance_configs(::Google::Cloud::Spanner::Admin::Instance::V1::ListInstanceConfigsRequest.new(parent: parent, page_size: page_size, page_token: page_token), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, list_instance_configs_client_stub.call_count
      end
    end
  end

  def test_get_instance_config
    # Create test objects.
    client_result = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceConfig.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_instance_config_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_get_instance_config_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, get_instance_config_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.get_instance_config({ name: name }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.get_instance_config name: name do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.get_instance_config ::Google::Cloud::Spanner::Admin::Instance::V1::GetInstanceConfigRequest.new(name: name) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.get_instance_config({ name: name }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.get_instance_config(::Google::Cloud::Spanner::Admin::Instance::V1::GetInstanceConfigRequest.new(name: name), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, get_instance_config_client_stub.call_count
      end
    end
  end

  def test_create_instance_config
    # Create test objects.
    client_result = ::Google::Longrunning::Operation.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    instance_config_id = "hello world"
    instance_config = {}
    validate_only = true

    create_instance_config_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_create_instance_config_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, create_instance_config_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.create_instance_config({ parent: parent, instance_config_id: instance_config_id, instance_config: instance_config, validate_only: validate_only }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.create_instance_config parent: parent, instance_config_id: instance_config_id, instance_config: instance_config, validate_only: validate_only do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.create_instance_config ::Google::Cloud::Spanner::Admin::Instance::V1::CreateInstanceConfigRequest.new(parent: parent, instance_config_id: instance_config_id, instance_config: instance_config, validate_only: validate_only) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.create_instance_config({ parent: parent, instance_config_id: instance_config_id, instance_config: instance_config, validate_only: validate_only }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.create_instance_config(::Google::Cloud::Spanner::Admin::Instance::V1::CreateInstanceConfigRequest.new(parent: parent, instance_config_id: instance_config_id, instance_config: instance_config, validate_only: validate_only), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, create_instance_config_client_stub.call_count
      end
    end
  end

  def test_update_instance_config
    # Create test objects.
    client_result = ::Google::Longrunning::Operation.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    instance_config = {}
    update_mask = {}
    validate_only = true

    update_instance_config_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_update_instance_config_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, update_instance_config_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.update_instance_config({ instance_config: instance_config, update_mask: update_mask, validate_only: validate_only }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.update_instance_config instance_config: instance_config, update_mask: update_mask, validate_only: validate_only do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.update_instance_config ::Google::Cloud::Spanner::Admin::Instance::V1::UpdateInstanceConfigRequest.new(instance_config: instance_config, update_mask: update_mask, validate_only: validate_only) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.update_instance_config({ instance_config: instance_config, update_mask: update_mask, validate_only: validate_only }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.update_instance_config(::Google::Cloud::Spanner::Admin::Instance::V1::UpdateInstanceConfigRequest.new(instance_config: instance_config, update_mask: update_mask, validate_only: validate_only), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, update_instance_config_client_stub.call_count
      end
    end
  end

  def test_delete_instance_config
    # Create test objects.
    client_result = ::Google::Protobuf::Empty.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    etag = "hello world"
    validate_only = true

    delete_instance_config_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_delete_instance_config_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, delete_instance_config_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.delete_instance_config({ name: name, etag: etag, validate_only: validate_only }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.delete_instance_config name: name, etag: etag, validate_only: validate_only do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.delete_instance_config ::Google::Cloud::Spanner::Admin::Instance::V1::DeleteInstanceConfigRequest.new(name: name, etag: etag, validate_only: validate_only) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.delete_instance_config({ name: name, etag: etag, validate_only: validate_only }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.delete_instance_config(::Google::Cloud::Spanner::Admin::Instance::V1::DeleteInstanceConfigRequest.new(name: name, etag: etag, validate_only: validate_only), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, delete_instance_config_client_stub.call_count
      end
    end
  end

  def test_list_instance_config_operations
    # Create test objects.
    client_result = ::Google::Cloud::Spanner::Admin::Instance::V1::ListInstanceConfigOperationsResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    filter = "hello world"
    page_size = 42
    page_token = "hello world"

    list_instance_config_operations_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_list_instance_config_operations_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, list_instance_config_operations_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.list_instance_config_operations({ parent: parent, filter: filter, page_size: page_size, page_token: page_token }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.list_instance_config_operations parent: parent, filter: filter, page_size: page_size, page_token: page_token do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.list_instance_config_operations ::Google::Cloud::Spanner::Admin::Instance::V1::ListInstanceConfigOperationsRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.list_instance_config_operations({ parent: parent, filter: filter, page_size: page_size, page_token: page_token }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.list_instance_config_operations(::Google::Cloud::Spanner::Admin::Instance::V1::ListInstanceConfigOperationsRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, list_instance_config_operations_client_stub.call_count
      end
    end
  end

  def test_list_instances
    # Create test objects.
    client_result = ::Google::Cloud::Spanner::Admin::Instance::V1::ListInstancesResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"
    filter = "hello world"

    list_instances_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_list_instances_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, list_instances_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.list_instances({ parent: parent, page_size: page_size, page_token: page_token, filter: filter }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.list_instances parent: parent, page_size: page_size, page_token: page_token, filter: filter do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.list_instances ::Google::Cloud::Spanner::Admin::Instance::V1::ListInstancesRequest.new(parent: parent, page_size: page_size, page_token: page_token, filter: filter) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.list_instances({ parent: parent, page_size: page_size, page_token: page_token, filter: filter }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.list_instances(::Google::Cloud::Spanner::Admin::Instance::V1::ListInstancesRequest.new(parent: parent, page_size: page_size, page_token: page_token, filter: filter), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, list_instances_client_stub.call_count
      end
    end
  end

  def test_get_instance
    # Create test objects.
    client_result = ::Google::Cloud::Spanner::Admin::Instance::V1::Instance.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    field_mask = {}

    get_instance_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_get_instance_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, get_instance_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.get_instance({ name: name, field_mask: field_mask }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.get_instance name: name, field_mask: field_mask do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.get_instance ::Google::Cloud::Spanner::Admin::Instance::V1::GetInstanceRequest.new(name: name, field_mask: field_mask) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.get_instance({ name: name, field_mask: field_mask }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.get_instance(::Google::Cloud::Spanner::Admin::Instance::V1::GetInstanceRequest.new(name: name, field_mask: field_mask), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, get_instance_client_stub.call_count
      end
    end
  end

  def test_create_instance
    # Create test objects.
    client_result = ::Google::Longrunning::Operation.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    instance_id = "hello world"
    instance = {}

    create_instance_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_create_instance_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, create_instance_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.create_instance({ parent: parent, instance_id: instance_id, instance: instance }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.create_instance parent: parent, instance_id: instance_id, instance: instance do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.create_instance ::Google::Cloud::Spanner::Admin::Instance::V1::CreateInstanceRequest.new(parent: parent, instance_id: instance_id, instance: instance) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.create_instance({ parent: parent, instance_id: instance_id, instance: instance }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.create_instance(::Google::Cloud::Spanner::Admin::Instance::V1::CreateInstanceRequest.new(parent: parent, instance_id: instance_id, instance: instance), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, create_instance_client_stub.call_count
      end
    end
  end

  def test_update_instance
    # Create test objects.
    client_result = ::Google::Longrunning::Operation.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    instance = {}
    field_mask = {}

    update_instance_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_update_instance_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, update_instance_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.update_instance({ instance: instance, field_mask: field_mask }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.update_instance instance: instance, field_mask: field_mask do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.update_instance ::Google::Cloud::Spanner::Admin::Instance::V1::UpdateInstanceRequest.new(instance: instance, field_mask: field_mask) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.update_instance({ instance: instance, field_mask: field_mask }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.update_instance(::Google::Cloud::Spanner::Admin::Instance::V1::UpdateInstanceRequest.new(instance: instance, field_mask: field_mask), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, update_instance_client_stub.call_count
      end
    end
  end

  def test_delete_instance
    # Create test objects.
    client_result = ::Google::Protobuf::Empty.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_instance_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_delete_instance_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, delete_instance_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.delete_instance({ name: name }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.delete_instance name: name do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.delete_instance ::Google::Cloud::Spanner::Admin::Instance::V1::DeleteInstanceRequest.new(name: name) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.delete_instance({ name: name }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.delete_instance(::Google::Cloud::Spanner::Admin::Instance::V1::DeleteInstanceRequest.new(name: name), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, delete_instance_client_stub.call_count
      end
    end
  end

  def test_set_iam_policy
    # Create test objects.
    client_result = ::Google::Iam::V1::Policy.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    resource = "hello world"
    policy = {}
    update_mask = {}

    set_iam_policy_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_set_iam_policy_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, set_iam_policy_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.set_iam_policy({ resource: resource, policy: policy, update_mask: update_mask }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.set_iam_policy resource: resource, policy: policy, update_mask: update_mask do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.set_iam_policy ::Google::Iam::V1::SetIamPolicyRequest.new(resource: resource, policy: policy, update_mask: update_mask) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.set_iam_policy({ resource: resource, policy: policy, update_mask: update_mask }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.set_iam_policy(::Google::Iam::V1::SetIamPolicyRequest.new(resource: resource, policy: policy, update_mask: update_mask), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, set_iam_policy_client_stub.call_count
      end
    end
  end

  def test_get_iam_policy
    # Create test objects.
    client_result = ::Google::Iam::V1::Policy.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    resource = "hello world"
    options = {}

    get_iam_policy_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_get_iam_policy_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, get_iam_policy_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.get_iam_policy({ resource: resource, options: options }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.get_iam_policy resource: resource, options: options do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.get_iam_policy ::Google::Iam::V1::GetIamPolicyRequest.new(resource: resource, options: options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.get_iam_policy({ resource: resource, options: options }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.get_iam_policy(::Google::Iam::V1::GetIamPolicyRequest.new(resource: resource, options: options), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, get_iam_policy_client_stub.call_count
      end
    end
  end

  def test_test_iam_permissions
    # Create test objects.
    client_result = ::Google::Iam::V1::TestIamPermissionsResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    resource = "hello world"
    permissions = ["hello world"]

    test_iam_permissions_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::ServiceStub.stub :transcode_test_iam_permissions_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, test_iam_permissions_client_stub do
        # Create client
        client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.test_iam_permissions({ resource: resource, permissions: permissions }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.test_iam_permissions resource: resource, permissions: permissions do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.test_iam_permissions ::Google::Iam::V1::TestIamPermissionsRequest.new(resource: resource, permissions: permissions) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.test_iam_permissions({ resource: resource, permissions: permissions }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.test_iam_permissions(::Google::Iam::V1::TestIamPermissionsRequest.new(resource: resource, permissions: permissions), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, test_iam_permissions_client_stub.call_count
      end
    end
  end

  def test_configure
    credentials_token = :dummy_value

    client = block_config = config = nil
    Gapic::Rest::ClientStub.stub :new, nil do
      client = ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client.new do |config|
        config.credentials = credentials_token
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of ::Google::Cloud::Spanner::Admin::Instance::V1::InstanceAdmin::Rest::Client::Configuration, config
  end
end