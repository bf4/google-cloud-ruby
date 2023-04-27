# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/datastore/v1/datastore.proto for package 'Google.Cloud.Datastore.V1'
# Original file comments:
# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'grpc'
require 'google/datastore/v1/datastore_pb'

module Google
  module Cloud
    module Datastore
      module V1
        module Datastore
          # Each RPC normalizes the partition IDs of the keys in its input entities,
          # and always returns entities with keys with normalized partition IDs.
          # This applies to all keys and entities, including those in values, except keys
          # with both an empty path and an empty or unset partition ID. Normalization of
          # input keys sets the project ID (if not already set) to the project ID from
          # the request.
          #
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.datastore.v1.Datastore'

            # Looks up entities by key.
            rpc :Lookup, ::Google::Cloud::Datastore::V1::LookupRequest, ::Google::Cloud::Datastore::V1::LookupResponse
            # Queries for entities.
            rpc :RunQuery, ::Google::Cloud::Datastore::V1::RunQueryRequest, ::Google::Cloud::Datastore::V1::RunQueryResponse
            # Runs an aggregation query.
            rpc :RunAggregationQuery, ::Google::Cloud::Datastore::V1::RunAggregationQueryRequest, ::Google::Cloud::Datastore::V1::RunAggregationQueryResponse
            # Begins a new transaction.
            rpc :BeginTransaction, ::Google::Cloud::Datastore::V1::BeginTransactionRequest, ::Google::Cloud::Datastore::V1::BeginTransactionResponse
            # Commits a transaction, optionally creating, deleting or modifying some
            # entities.
            rpc :Commit, ::Google::Cloud::Datastore::V1::CommitRequest, ::Google::Cloud::Datastore::V1::CommitResponse
            # Rolls back a transaction.
            rpc :Rollback, ::Google::Cloud::Datastore::V1::RollbackRequest, ::Google::Cloud::Datastore::V1::RollbackResponse
            # Allocates IDs for the given keys, which is useful for referencing an entity
            # before it is inserted.
            rpc :AllocateIds, ::Google::Cloud::Datastore::V1::AllocateIdsRequest, ::Google::Cloud::Datastore::V1::AllocateIdsResponse
            # Prevents the supplied keys' IDs from being auto-allocated by Cloud
            # Datastore.
            rpc :ReserveIds, ::Google::Cloud::Datastore::V1::ReserveIdsRequest, ::Google::Cloud::Datastore::V1::ReserveIdsResponse
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
