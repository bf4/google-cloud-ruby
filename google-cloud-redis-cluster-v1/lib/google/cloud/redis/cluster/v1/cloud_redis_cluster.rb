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

require "gapic/common"
require "gapic/config"
require "gapic/config/method"

require "google/cloud/redis/cluster/v1/version"

require "google/cloud/redis/cluster/v1/cloud_redis_cluster/credentials"
require "google/cloud/redis/cluster/v1/cloud_redis_cluster/paths"
require "google/cloud/redis/cluster/v1/cloud_redis_cluster/operations"
require "google/cloud/redis/cluster/v1/cloud_redis_cluster/client"
require "google/cloud/redis/cluster/v1/cloud_redis_cluster/rest"

module Google
  module Cloud
    module Redis
      module Cluster
        module V1
          ##
          # Configures and manages Cloud Memorystore for Redis clusters
          #
          # Google Cloud Memorystore for Redis Cluster
          #
          # The `redis.googleapis.com` service implements the Google Cloud Memorystore
          # for Redis API and defines the following resource model for managing Redis
          # clusters:
          # * The service works with a collection of cloud projects, named: `/projects/*`
          # * Each project has a collection of available locations, named: `/locations/*`
          # * Each location has a collection of Redis clusters, named: `/clusters/*`
          # * As such, Redis clusters are resources of the form:
          #   `/projects/{project_id}/locations/{location_id}/clusters/{instance_id}`
          #
          # Note that location_id must be a GCP `region`; for example:
          # * `projects/redpepper-1290/locations/us-central1/clusters/my-redis`
          #
          # We use API version selector for Flex APIs
          # * The versioning strategy is release-based versioning
          # * Our backend CLH only deals with the superset version (called v1main)
          # * Existing backend for Redis Gen1 and MRR is not touched.
          # * More details in go/redis-flex-api-versioning
          #
          # @example Load this service and instantiate a gRPC client
          #
          #     require "google/cloud/redis/cluster/v1/cloud_redis_cluster"
          #     client = ::Google::Cloud::Redis::Cluster::V1::CloudRedisCluster::Client.new
          #
          # @example Load this service and instantiate a REST client
          #
          #     require "google/cloud/redis/cluster/v1/cloud_redis_cluster/rest"
          #     client = ::Google::Cloud::Redis::Cluster::V1::CloudRedisCluster::Rest::Client.new
          #
          module CloudRedisCluster
          end
        end
      end
    end
  end
end

helper_path = ::File.join __dir__, "cloud_redis_cluster", "helpers.rb"
require "google/cloud/redis/cluster/v1/cloud_redis_cluster/helpers" if ::File.file? helper_path
