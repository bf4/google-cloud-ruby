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


module Google
  module Api
    # `Context` defines which contexts an API requests.
    #
    # Example:
    #
    #     context:
    #       rules:
    #       - selector: "*"
    #         requested:
    #         - google.rpc.context.ProjectContext
    #         - google.rpc.context.OriginContext
    #
    # The above specifies that all methods in the API request
    # `google.rpc.context.ProjectContext` and
    # `google.rpc.context.OriginContext`.
    #
    # Available context types are defined in package
    # `google.rpc.context`.
    #
    # This also provides mechanism to allowlist any protobuf message extension that
    # can be sent in grpc metadata using “x-goog-ext-<extension_id>-bin” and
    # “x-goog-ext-<extension_id>-jspb” format. For example, list any service
    # specific protobuf types that can appear in grpc metadata as follows in your
    # yaml file:
    #
    # Example:
    #
    #     context:
    #       rules:
    #        - selector: "google.example.library.v1.LibraryService.CreateBook"
    #          allowed_request_extensions:
    #          - google.foo.v1.NewExtension
    #          allowed_response_extensions:
    #          - google.foo.v1.NewExtension
    #
    # You can also specify extension ID instead of fully qualified extension name
    # here.
    # @!attribute [rw] rules
    #   @return [::Array<::Google::Api::ContextRule>]
    #     A list of RPC context rules that apply to individual API methods.
    #
    #     **NOTE:** All service configuration rules follow "last one wins" order.
    class Context
      include ::Google::Protobuf::MessageExts
      extend ::Google::Protobuf::MessageExts::ClassMethods
    end

    # A context rule provides information about the context for an individual API
    # element.
    # @!attribute [rw] selector
    #   @return [::String]
    #     Selects the methods to which this rule applies.
    #
    #     Refer to {::Google::Api::DocumentationRule#selector selector} for syntax details.
    # @!attribute [rw] requested
    #   @return [::Array<::String>]
    #     A list of full type names of requested contexts.
    # @!attribute [rw] provided
    #   @return [::Array<::String>]
    #     A list of full type names of provided contexts.
    # @!attribute [rw] allowed_request_extensions
    #   @return [::Array<::String>]
    #     A list of full type names or extension IDs of extensions allowed in grpc
    #     side channel from client to backend.
    # @!attribute [rw] allowed_response_extensions
    #   @return [::Array<::String>]
    #     A list of full type names or extension IDs of extensions allowed in grpc
    #     side channel from backend to client.
    class ContextRule
      include ::Google::Protobuf::MessageExts
      extend ::Google::Protobuf::MessageExts::ClassMethods
    end
  end
end
