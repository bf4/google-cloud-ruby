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

require "gapic/operation/retry_policy"
require "gapic/generic_lro/operation"

module Google
  module Cloud
    module Compute
      module V1
        module RegionOperations
          module Rest
            # A module containing nonstandard lro helpers
            module NonstandardLro
              class << self
                ##
                # Creates a Generic LRO operation object that wraps the nonstandard
                # long-running operation specific to this service.
                #
                # @param operation [Object] The long-running operation object that is returned by the initial method call.
                #
                # @param client [::Google::Cloud::Compute::V1::RegionOperations::Rest::Client] The client that handles the polling for the longrunning operation.
                #
                # @param request_values [Map<String, String>] The values that are to be copied from the request that
                #   triggered the longrunning operation, into the request that polls for the longrunning operation.
                #   The format is `name of the request field -> value`
                #
                # @param options [Gapic::CallOptions] call options for this operation
                #
                # @return [Gapic::GenericLRO::Operation]
                #
                def create_operation operation:, client:, request_values:, options:
                  Gapic::GenericLRO::Operation.new(operation,
                                                   client: client,
                                                   polling_method_name: "get",
                                                   request_values: request_values,
                                                   operation_status_field: "status",
                                                   operation_name_field: "name",
                                                   operation_err_code_field: "http_error_status_code",
                                                   operation_err_msg_field: "http_error_message",
                                                   operation_copy_fields: {
                                                     "name" => "operation"
                                                   },
                                                   options: options)
                end
              end
            end
          end
        end
      end
    end
  end
end
