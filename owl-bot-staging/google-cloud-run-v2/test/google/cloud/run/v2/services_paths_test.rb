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

require "gapic/grpc/service_stub"

require "google/cloud/run/v2/services"

class ::Google::Cloud::Run::V2::Services::ClientPathsTest < Minitest::Test
  def test_connector_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Run::V2::Services::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.connector_path project: "value0", location: "value1", connector: "value2"
      assert_equal "projects/value0/locations/value1/connectors/value2", path
    end
  end

  def test_crypto_key_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Run::V2::Services::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.crypto_key_path project: "value0", location: "value1", key_ring: "value2", crypto_key: "value3"
      assert_equal "projects/value0/locations/value1/keyRings/value2/cryptoKeys/value3", path
    end
  end

  def test_location_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Run::V2::Services::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.location_path project: "value0", location: "value1"
      assert_equal "projects/value0/locations/value1", path
    end
  end

  def test_revision_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Run::V2::Services::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.revision_path project: "value0", location: "value1", service: "value2", revision: "value3"
      assert_equal "projects/value0/locations/value1/services/value2/revisions/value3", path
    end
  end

  def test_secret_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Run::V2::Services::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.secret_path project: "value0", secret: "value1"
      assert_equal "projects/value0/secrets/value1", path
    end
  end

  def test_secret_version_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Run::V2::Services::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.secret_version_path project: "value0", secret: "value1", version: "value2"
      assert_equal "projects/value0/secrets/value1/versions/value2", path
    end
  end

  def test_service_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Run::V2::Services::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.service_path project: "value0", location: "value1", service: "value2"
      assert_equal "projects/value0/locations/value1/services/value2", path
    end
  end
end
