# frozen_string_literal: true

# Copyright 2021 Google LLC
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

require "google/cloud/errors"
require "google/devtools/containeranalysis/v1/containeranalysis_pb"

module Google
  module Cloud
    module ContainerAnalysis
      module V1
        module ContainerAnalysis
          ##
          # Client for the ContainerAnalysis service.
          #
          # Retrieves analysis results of Cloud components such as Docker container
          # images. The Container Analysis API is an implementation of the
          # [Grafeas](https://grafeas.io) API.
          #
          # Analysis results are stored as a series of occurrences. An `Occurrence`
          # contains information about a specific analysis instance on a resource. An
          # occurrence refers to a `Note`. A note contains details describing the
          # analysis and is generally stored in a separate project, called a `Provider`.
          # Multiple occurrences can refer to the same note.
          #
          # For example, an SSL vulnerability could affect multiple images. In this case,
          # there would be one note for the vulnerability and an occurrence for each
          # image with the vulnerability referring to that note.
          #
          class Client
            include Paths

            # @private
            attr_reader :container_analysis_stub

            ##
            # Configure the ContainerAnalysis Client class.
            #
            # See {::Google::Cloud::ContainerAnalysis::V1::ContainerAnalysis::Client::Configuration}
            # for a description of the configuration fields.
            #
            # @example
            #
            #   # Modify the configuration for all ContainerAnalysis clients
            #   ::Google::Cloud::ContainerAnalysis::V1::ContainerAnalysis::Client.configure do |config|
            #     config.timeout = 10.0
            #   end
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def self.configure
              @configure ||= begin
                namespace = ["Google", "Cloud", "ContainerAnalysis", "V1"]
                parent_config = while namespace.any?
                                  parent_name = namespace.join "::"
                                  parent_const = const_get parent_name
                                  break parent_const.configure if parent_const.respond_to? :configure
                                  namespace.pop
                                end
                default_config = Client::Configuration.new parent_config

                default_config.rpcs.set_iam_policy.timeout = 30.0

                default_config.rpcs.get_iam_policy.timeout = 30.0

                default_config.rpcs.test_iam_permissions.timeout = 30.0

                default_config
              end
              yield @configure if block_given?
              @configure
            end

            ##
            # Configure the ContainerAnalysis Client instance.
            #
            # The configuration is set to the derived mode, meaning that values can be changed,
            # but structural changes (adding new fields, etc.) are not allowed. Structural changes
            # should be made on {Client.configure}.
            #
            # See {::Google::Cloud::ContainerAnalysis::V1::ContainerAnalysis::Client::Configuration}
            # for a description of the configuration fields.
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def configure
              yield @config if block_given?
              @config
            end

            ##
            # Create a new ContainerAnalysis client object.
            #
            # @example
            #
            #   # Create a client using the default configuration
            #   client = ::Google::Cloud::ContainerAnalysis::V1::ContainerAnalysis::Client.new
            #
            #   # Create a client using a custom configuration
            #   client = ::Google::Cloud::ContainerAnalysis::V1::ContainerAnalysis::Client.new do |config|
            #     config.timeout = 10.0
            #   end
            #
            # @yield [config] Configure the ContainerAnalysis client.
            # @yieldparam config [Client::Configuration]
            #
            def initialize
              # These require statements are intentionally placed here to initialize
              # the gRPC module only when it's required.
              # See https://github.com/googleapis/toolkit/issues/446
              require "gapic/grpc"
              require "google/devtools/containeranalysis/v1/containeranalysis_services_pb"

              # Create the configuration object
              @config = Configuration.new Client.configure

              # Yield the configuration if needed
              yield @config if block_given?

              # Create credentials
              credentials = @config.credentials
              # Use self-signed JWT if the endpoint is unchanged from default,
              # but only if the default endpoint does not have a region prefix.
              enable_self_signed_jwt = @config.endpoint == Client.configure.endpoint &&
                                       !@config.endpoint.split(".").first.include?("-")
              credentials ||= Credentials.default scope: @config.scope,
                                                  enable_self_signed_jwt: enable_self_signed_jwt
              if credentials.is_a?(::String) || credentials.is_a?(::Hash)
                credentials = Credentials.new credentials, scope: @config.scope
              end
              @quota_project_id = @config.quota_project
              @quota_project_id ||= credentials.quota_project_id if credentials.respond_to? :quota_project_id

              @container_analysis_stub = ::Gapic::ServiceStub.new(
                ::Google::Cloud::ContainerAnalysis::V1::ContainerAnalysis::Stub,
                credentials:  credentials,
                endpoint:     @config.endpoint,
                channel_args: @config.channel_args,
                interceptors: @config.interceptors
              )
            end

            # Service calls

            ##
            # Sets the access control policy on the specified note or occurrence.
            # Requires `containeranalysis.notes.setIamPolicy` or
            # `containeranalysis.occurrences.setIamPolicy` permission if the resource is
            # a note or an occurrence, respectively.
            #
            # The resource takes the format `projects/[PROJECT_ID]/notes/[NOTE_ID]` for
            # notes and `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]` for
            # occurrences.
            #
            # @overload set_iam_policy(request, options = nil)
            #   Pass arguments to `set_iam_policy` via a request object, either of type
            #   {::Google::Iam::V1::SetIamPolicyRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Iam::V1::SetIamPolicyRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload set_iam_policy(resource: nil, policy: nil)
            #   Pass arguments to `set_iam_policy` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param resource [::String]
            #     REQUIRED: The resource for which the policy is being specified.
            #     See the operation documentation for the appropriate value for this field.
            #   @param policy [::Google::Iam::V1::Policy, ::Hash]
            #     REQUIRED: The complete policy to be applied to the `resource`. The size of
            #     the policy is limited to a few 10s of KB. An empty policy is a
            #     valid policy but certain Cloud Platform services (such as Projects)
            #     might reject them.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Iam::V1::Policy]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Iam::V1::Policy]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            def set_iam_policy request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Iam::V1::SetIamPolicyRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.set_iam_policy.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::ContainerAnalysis::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {}
              if request.resource
                header_params["resource"] = request.resource
              end

              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.set_iam_policy.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.set_iam_policy.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @container_analysis_stub.call_rpc :set_iam_policy, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Gets the access control policy for a note or an occurrence resource.
            # Requires `containeranalysis.notes.setIamPolicy` or
            # `containeranalysis.occurrences.setIamPolicy` permission if the resource is
            # a note or occurrence, respectively.
            #
            # The resource takes the format `projects/[PROJECT_ID]/notes/[NOTE_ID]` for
            # notes and `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]` for
            # occurrences.
            #
            # @overload get_iam_policy(request, options = nil)
            #   Pass arguments to `get_iam_policy` via a request object, either of type
            #   {::Google::Iam::V1::GetIamPolicyRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Iam::V1::GetIamPolicyRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload get_iam_policy(resource: nil, options: nil)
            #   Pass arguments to `get_iam_policy` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param resource [::String]
            #     REQUIRED: The resource for which the policy is being requested.
            #     See the operation documentation for the appropriate value for this field.
            #   @param options [::Google::Iam::V1::GetPolicyOptions, ::Hash]
            #     OPTIONAL: A `GetPolicyOptions` object for specifying options to
            #     `GetIamPolicy`. This field is only used by Cloud IAM.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Iam::V1::Policy]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Iam::V1::Policy]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            def get_iam_policy request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Iam::V1::GetIamPolicyRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.get_iam_policy.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::ContainerAnalysis::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {}
              if request.resource
                header_params["resource"] = request.resource
              end

              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.get_iam_policy.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.get_iam_policy.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @container_analysis_stub.call_rpc :get_iam_policy, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Returns the permissions that a caller has on the specified note or
            # occurrence. Requires list permission on the project (for example,
            # `containeranalysis.notes.list`).
            #
            # The resource takes the format `projects/[PROJECT_ID]/notes/[NOTE_ID]` for
            # notes and `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]` for
            # occurrences.
            #
            # @overload test_iam_permissions(request, options = nil)
            #   Pass arguments to `test_iam_permissions` via a request object, either of type
            #   {::Google::Iam::V1::TestIamPermissionsRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Iam::V1::TestIamPermissionsRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload test_iam_permissions(resource: nil, permissions: nil)
            #   Pass arguments to `test_iam_permissions` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param resource [::String]
            #     REQUIRED: The resource for which the policy detail is being requested.
            #     See the operation documentation for the appropriate value for this field.
            #   @param permissions [::Array<::String>]
            #     The set of permissions to check for the `resource`. Permissions with
            #     wildcards (such as '*' or 'storage.*') are not allowed. For more
            #     information see
            #     [IAM Overview](https://cloud.google.com/iam/docs/overview#permissions).
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Iam::V1::TestIamPermissionsResponse]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Iam::V1::TestIamPermissionsResponse]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            def test_iam_permissions request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Iam::V1::TestIamPermissionsRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.test_iam_permissions.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::ContainerAnalysis::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {}
              if request.resource
                header_params["resource"] = request.resource
              end

              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.test_iam_permissions.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.test_iam_permissions.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @container_analysis_stub.call_rpc :test_iam_permissions, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Gets a summary of the number and severity of occurrences.
            #
            # @overload get_vulnerability_occurrences_summary(request, options = nil)
            #   Pass arguments to `get_vulnerability_occurrences_summary` via a request object, either of type
            #   {::Google::Cloud::ContainerAnalysis::V1::GetVulnerabilityOccurrencesSummaryRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::ContainerAnalysis::V1::GetVulnerabilityOccurrencesSummaryRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload get_vulnerability_occurrences_summary(parent: nil, filter: nil)
            #   Pass arguments to `get_vulnerability_occurrences_summary` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param parent [::String]
            #     The name of the project to get a vulnerability summary for in the form of
            #     `projects/[PROJECT_ID]`.
            #   @param filter [::String]
            #     The filter expression.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Cloud::ContainerAnalysis::V1::VulnerabilityOccurrencesSummary]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Cloud::ContainerAnalysis::V1::VulnerabilityOccurrencesSummary]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            def get_vulnerability_occurrences_summary request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::ContainerAnalysis::V1::GetVulnerabilityOccurrencesSummaryRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.get_vulnerability_occurrences_summary.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::ContainerAnalysis::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {}
              if request.parent
                header_params["parent"] = request.parent
              end

              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.get_vulnerability_occurrences_summary.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.get_vulnerability_occurrences_summary.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @container_analysis_stub.call_rpc :get_vulnerability_occurrences_summary, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Configuration class for the ContainerAnalysis API.
            #
            # This class represents the configuration for ContainerAnalysis,
            # providing control over timeouts, retry behavior, logging, transport
            # parameters, and other low-level controls. Certain parameters can also be
            # applied individually to specific RPCs. See
            # {::Google::Cloud::ContainerAnalysis::V1::ContainerAnalysis::Client::Configuration::Rpcs}
            # for a list of RPCs that can be configured independently.
            #
            # Configuration can be applied globally to all clients, or to a single client
            # on construction.
            #
            # @example
            #
            #   # Modify the global config, setting the timeout for
            #   # set_iam_policy to 20 seconds,
            #   # and all remaining timeouts to 10 seconds.
            #   ::Google::Cloud::ContainerAnalysis::V1::ContainerAnalysis::Client.configure do |config|
            #     config.timeout = 10.0
            #     config.rpcs.set_iam_policy.timeout = 20.0
            #   end
            #
            #   # Apply the above configuration only to a new client.
            #   client = ::Google::Cloud::ContainerAnalysis::V1::ContainerAnalysis::Client.new do |config|
            #     config.timeout = 10.0
            #     config.rpcs.set_iam_policy.timeout = 20.0
            #   end
            #
            # @!attribute [rw] endpoint
            #   The hostname or hostname:port of the service endpoint.
            #   Defaults to `"containeranalysis.googleapis.com"`.
            #   @return [::String]
            # @!attribute [rw] credentials
            #   Credentials to send with calls. You may provide any of the following types:
            #    *  (`String`) The path to a service account key file in JSON format
            #    *  (`Hash`) A service account key as a Hash
            #    *  (`Google::Auth::Credentials`) A googleauth credentials object
            #       (see the [googleauth docs](https://googleapis.dev/ruby/googleauth/latest/index.html))
            #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
            #       (see the [signet docs](https://googleapis.dev/ruby/signet/latest/Signet/OAuth2/Client.html))
            #    *  (`GRPC::Core::Channel`) a gRPC channel with included credentials
            #    *  (`GRPC::Core::ChannelCredentials`) a gRPC credentails object
            #    *  (`nil`) indicating no credentials
            #   @return [::Object]
            # @!attribute [rw] scope
            #   The OAuth scopes
            #   @return [::Array<::String>]
            # @!attribute [rw] lib_name
            #   The library name as recorded in instrumentation and logging
            #   @return [::String]
            # @!attribute [rw] lib_version
            #   The library version as recorded in instrumentation and logging
            #   @return [::String]
            # @!attribute [rw] channel_args
            #   Extra parameters passed to the gRPC channel. Note: this is ignored if a
            #   `GRPC::Core::Channel` object is provided as the credential.
            #   @return [::Hash]
            # @!attribute [rw] interceptors
            #   An array of interceptors that are run before calls are executed.
            #   @return [::Array<::GRPC::ClientInterceptor>]
            # @!attribute [rw] timeout
            #   The call timeout in seconds.
            #   @return [::Numeric]
            # @!attribute [rw] metadata
            #   Additional gRPC headers to be sent with the call.
            #   @return [::Hash{::Symbol=>::String}]
            # @!attribute [rw] retry_policy
            #   The retry policy. The value is a hash with the following keys:
            #    *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
            #    *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
            #    *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
            #    *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
            #       trigger a retry.
            #   @return [::Hash]
            # @!attribute [rw] quota_project
            #   A separate project against which to charge quota.
            #   @return [::String]
            #
            class Configuration
              extend ::Gapic::Config

              config_attr :endpoint,      "containeranalysis.googleapis.com", ::String
              config_attr :credentials,   nil do |value|
                allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
                allowed += [::GRPC::Core::Channel, ::GRPC::Core::ChannelCredentials] if defined? ::GRPC
                allowed.any? { |klass| klass === value }
              end
              config_attr :scope,         nil, ::String, ::Array, nil
              config_attr :lib_name,      nil, ::String, nil
              config_attr :lib_version,   nil, ::String, nil
              config_attr(:channel_args,  { "grpc.service_config_disable_resolution" => 1 }, ::Hash, nil)
              config_attr :interceptors,  nil, ::Array, nil
              config_attr :timeout,       nil, ::Numeric, nil
              config_attr :metadata,      nil, ::Hash, nil
              config_attr :retry_policy,  nil, ::Hash, ::Proc, nil
              config_attr :quota_project, nil, ::String, nil

              # @private
              def initialize parent_config = nil
                @parent_config = parent_config unless parent_config.nil?

                yield self if block_given?
              end

              ##
              # Configurations for individual RPCs
              # @return [Rpcs]
              #
              def rpcs
                @rpcs ||= begin
                  parent_rpcs = nil
                  parent_rpcs = @parent_config.rpcs if defined?(@parent_config) && @parent_config.respond_to?(:rpcs)
                  Rpcs.new parent_rpcs
                end
              end

              ##
              # Configuration RPC class for the ContainerAnalysis API.
              #
              # Includes fields providing the configuration for each RPC in this service.
              # Each configuration object is of type `Gapic::Config::Method` and includes
              # the following configuration fields:
              #
              #  *  `timeout` (*type:* `Numeric`) - The call timeout in seconds
              #  *  `metadata` (*type:* `Hash{Symbol=>String}`) - Additional gRPC headers
              #  *  `retry_policy (*type:* `Hash`) - The retry policy. The policy fields
              #     include the following keys:
              #      *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
              #      *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
              #      *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
              #      *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
              #         trigger a retry.
              #
              class Rpcs
                ##
                # RPC-specific configuration for `set_iam_policy`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :set_iam_policy
                ##
                # RPC-specific configuration for `get_iam_policy`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :get_iam_policy
                ##
                # RPC-specific configuration for `test_iam_permissions`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :test_iam_permissions
                ##
                # RPC-specific configuration for `get_vulnerability_occurrences_summary`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :get_vulnerability_occurrences_summary

                # @private
                def initialize parent_rpcs = nil
                  set_iam_policy_config = parent_rpcs.set_iam_policy if parent_rpcs.respond_to? :set_iam_policy
                  @set_iam_policy = ::Gapic::Config::Method.new set_iam_policy_config
                  get_iam_policy_config = parent_rpcs.get_iam_policy if parent_rpcs.respond_to? :get_iam_policy
                  @get_iam_policy = ::Gapic::Config::Method.new get_iam_policy_config
                  test_iam_permissions_config = parent_rpcs.test_iam_permissions if parent_rpcs.respond_to? :test_iam_permissions
                  @test_iam_permissions = ::Gapic::Config::Method.new test_iam_permissions_config
                  get_vulnerability_occurrences_summary_config = parent_rpcs.get_vulnerability_occurrences_summary if parent_rpcs.respond_to? :get_vulnerability_occurrences_summary
                  @get_vulnerability_occurrences_summary = ::Gapic::Config::Method.new get_vulnerability_occurrences_summary_config

                  yield self if block_given?
                end
              end
            end
          end
        end
      end
    end
  end
end
