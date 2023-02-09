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
require "google/monitoring/metricsscope/v1/metrics_scopes_pb"

module Google
  module Cloud
    module Monitoring
      module MetricsScope
        module V1
          module MetricsScopes
            ##
            # Client for the MetricsScopes service.
            #
            # Manages Cloud Monitoring Metrics Scopes, and the monitoring of Google Cloud
            # projects and AWS accounts.
            #
            class Client
              include Paths

              # @private
              attr_reader :metrics_scopes_stub

              ##
              # Configure the MetricsScopes Client class.
              #
              # See {::Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Client::Configuration}
              # for a description of the configuration fields.
              #
              # @example
              #
              #   # Modify the configuration for all MetricsScopes clients
              #   ::Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Client.configure do |config|
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
                  namespace = ["Google", "Cloud", "Monitoring", "MetricsScope", "V1"]
                  parent_config = while namespace.any?
                                    parent_name = namespace.join "::"
                                    parent_const = const_get parent_name
                                    break parent_const.configure if parent_const.respond_to? :configure
                                    namespace.pop
                                  end
                  default_config = Client::Configuration.new parent_config

                  default_config
                end
                yield @configure if block_given?
                @configure
              end

              ##
              # Configure the MetricsScopes Client instance.
              #
              # The configuration is set to the derived mode, meaning that values can be changed,
              # but structural changes (adding new fields, etc.) are not allowed. Structural changes
              # should be made on {Client.configure}.
              #
              # See {::Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Client::Configuration}
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
              # Create a new MetricsScopes client object.
              #
              # @example
              #
              #   # Create a client using the default configuration
              #   client = ::Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Client.new
              #
              #   # Create a client using a custom configuration
              #   client = ::Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Client.new do |config|
              #     config.timeout = 10.0
              #   end
              #
              # @yield [config] Configure the MetricsScopes client.
              # @yieldparam config [Client::Configuration]
              #
              def initialize
                # These require statements are intentionally placed here to initialize
                # the gRPC module only when it's required.
                # See https://github.com/googleapis/toolkit/issues/446
                require "gapic/grpc"
                require "google/monitoring/metricsscope/v1/metrics_scopes_services_pb"

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

                @operations_client = Operations.new do |config|
                  config.credentials = credentials
                  config.quota_project = @quota_project_id
                  config.endpoint = @config.endpoint
                end

                @metrics_scopes_stub = ::Gapic::ServiceStub.new(
                  ::Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Stub,
                  credentials:  credentials,
                  endpoint:     @config.endpoint,
                  channel_args: @config.channel_args,
                  interceptors: @config.interceptors
                )
              end

              ##
              # Get the associated client for long-running operations.
              #
              # @return [::Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Operations]
              #
              attr_reader :operations_client

              # Service calls

              ##
              # Returns a specific `Metrics Scope`.
              #
              # @overload get_metrics_scope(request, options = nil)
              #   Pass arguments to `get_metrics_scope` via a request object, either of type
              #   {::Google::Cloud::Monitoring::MetricsScope::V1::GetMetricsScopeRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Monitoring::MetricsScope::V1::GetMetricsScopeRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              #
              # @overload get_metrics_scope(name: nil)
              #   Pass arguments to `get_metrics_scope` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param name [::String]
              #     Required. The resource name of the `Metrics Scope`.
              #     Example:
              #     `locations/global/metricsScopes/{SCOPING_PROJECT_ID_OR_NUMBER}`
              #
              # @yield [response, operation] Access the result along with the RPC operation
              # @yieldparam response [::Google::Cloud::Monitoring::MetricsScope::V1::MetricsScope]
              # @yieldparam operation [::GRPC::ActiveCall::Operation]
              #
              # @return [::Google::Cloud::Monitoring::MetricsScope::V1::MetricsScope]
              #
              # @raise [::Google::Cloud::Error] if the RPC is aborted.
              #
              # @example Basic example
              #   require "google/cloud/monitoring/metrics_scope/v1"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Monitoring::MetricsScope::V1::GetMetricsScopeRequest.new
              #
              #   # Call the get_metrics_scope method.
              #   result = client.get_metrics_scope request
              #
              #   # The returned object is of type Google::Cloud::Monitoring::MetricsScope::V1::MetricsScope.
              #   p result
              #
              def get_metrics_scope request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Monitoring::MetricsScope::V1::GetMetricsScopeRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                metadata = @config.rpcs.get_metrics_scope.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Monitoring::MetricsScope::V1::VERSION
                metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                header_params = {}
                if request.name
                  header_params["name"] = request.name
                end

                request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
                metadata[:"x-goog-request-params"] ||= request_params_header

                options.apply_defaults timeout:      @config.rpcs.get_metrics_scope.timeout,
                                       metadata:     metadata,
                                       retry_policy: @config.rpcs.get_metrics_scope.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @metrics_scopes_stub.call_rpc :get_metrics_scope, request, options: options do |response, operation|
                  yield response, operation if block_given?
                  return response
                end
              rescue ::GRPC::BadStatus => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Returns a list of every `Metrics Scope` that a specific `MonitoredProject`
              # has been added to. The metrics scope representing the specified monitored
              # project will always be the first entry in the response.
              #
              # @overload list_metrics_scopes_by_monitored_project(request, options = nil)
              #   Pass arguments to `list_metrics_scopes_by_monitored_project` via a request object, either of type
              #   {::Google::Cloud::Monitoring::MetricsScope::V1::ListMetricsScopesByMonitoredProjectRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Monitoring::MetricsScope::V1::ListMetricsScopesByMonitoredProjectRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              #
              # @overload list_metrics_scopes_by_monitored_project(monitored_resource_container: nil)
              #   Pass arguments to `list_metrics_scopes_by_monitored_project` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param monitored_resource_container [::String]
              #     Required. The resource name of the `Monitored Project` being requested.
              #     Example:
              #     `projects/{MONITORED_PROJECT_ID_OR_NUMBER}`
              #
              # @yield [response, operation] Access the result along with the RPC operation
              # @yieldparam response [::Google::Cloud::Monitoring::MetricsScope::V1::ListMetricsScopesByMonitoredProjectResponse]
              # @yieldparam operation [::GRPC::ActiveCall::Operation]
              #
              # @return [::Google::Cloud::Monitoring::MetricsScope::V1::ListMetricsScopesByMonitoredProjectResponse]
              #
              # @raise [::Google::Cloud::Error] if the RPC is aborted.
              #
              # @example Basic example
              #   require "google/cloud/monitoring/metrics_scope/v1"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Monitoring::MetricsScope::V1::ListMetricsScopesByMonitoredProjectRequest.new
              #
              #   # Call the list_metrics_scopes_by_monitored_project method.
              #   result = client.list_metrics_scopes_by_monitored_project request
              #
              #   # The returned object is of type Google::Cloud::Monitoring::MetricsScope::V1::ListMetricsScopesByMonitoredProjectResponse.
              #   p result
              #
              def list_metrics_scopes_by_monitored_project request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Monitoring::MetricsScope::V1::ListMetricsScopesByMonitoredProjectRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                metadata = @config.rpcs.list_metrics_scopes_by_monitored_project.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Monitoring::MetricsScope::V1::VERSION
                metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                options.apply_defaults timeout:      @config.rpcs.list_metrics_scopes_by_monitored_project.timeout,
                                       metadata:     metadata,
                                       retry_policy: @config.rpcs.list_metrics_scopes_by_monitored_project.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @metrics_scopes_stub.call_rpc :list_metrics_scopes_by_monitored_project, request, options: options do |response, operation|
                  yield response, operation if block_given?
                  return response
                end
              rescue ::GRPC::BadStatus => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Adds a `MonitoredProject` with the given project ID
              # to the specified `Metrics Scope`.
              #
              # @overload create_monitored_project(request, options = nil)
              #   Pass arguments to `create_monitored_project` via a request object, either of type
              #   {::Google::Cloud::Monitoring::MetricsScope::V1::CreateMonitoredProjectRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Monitoring::MetricsScope::V1::CreateMonitoredProjectRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              #
              # @overload create_monitored_project(parent: nil, monitored_project: nil)
              #   Pass arguments to `create_monitored_project` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param parent [::String]
              #     Required. The resource name of the existing `Metrics Scope` that will monitor this
              #     project.
              #     Example:
              #     `locations/global/metricsScopes/{SCOPING_PROJECT_ID_OR_NUMBER}`
              #   @param monitored_project [::Google::Cloud::Monitoring::MetricsScope::V1::MonitoredProject, ::Hash]
              #     Required. The initial `MonitoredProject` configuration.
              #     Specify only the `monitored_project.name` field. All other fields are
              #     ignored. The `monitored_project.name` must be in the format:
              #     `locations/global/metricsScopes/{SCOPING_PROJECT_ID_OR_NUMBER}/projects/{MONITORED_PROJECT_ID_OR_NUMBER}`
              #
              # @yield [response, operation] Access the result along with the RPC operation
              # @yieldparam response [::Gapic::Operation]
              # @yieldparam operation [::GRPC::ActiveCall::Operation]
              #
              # @return [::Gapic::Operation]
              #
              # @raise [::Google::Cloud::Error] if the RPC is aborted.
              #
              # @example Basic example
              #   require "google/cloud/monitoring/metrics_scope/v1"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Monitoring::MetricsScope::V1::CreateMonitoredProjectRequest.new
              #
              #   # Call the create_monitored_project method.
              #   result = client.create_monitored_project request
              #
              #   # The returned object is of type Gapic::Operation. You can use it to
              #   # check the status of an operation, cancel it, or wait for results.
              #   # Here is how to wait for a response.
              #   result.wait_until_done! timeout: 60
              #   if result.response?
              #     p result.response
              #   else
              #     puts "No response received."
              #   end
              #
              def create_monitored_project request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Monitoring::MetricsScope::V1::CreateMonitoredProjectRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                metadata = @config.rpcs.create_monitored_project.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Monitoring::MetricsScope::V1::VERSION
                metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                header_params = {}
                if request.parent
                  header_params["parent"] = request.parent
                end

                request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
                metadata[:"x-goog-request-params"] ||= request_params_header

                options.apply_defaults timeout:      @config.rpcs.create_monitored_project.timeout,
                                       metadata:     metadata,
                                       retry_policy: @config.rpcs.create_monitored_project.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @metrics_scopes_stub.call_rpc :create_monitored_project, request, options: options do |response, operation|
                  response = ::Gapic::Operation.new response, @operations_client, options: options
                  yield response, operation if block_given?
                  return response
                end
              rescue ::GRPC::BadStatus => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Deletes a `MonitoredProject` from the specified `Metrics Scope`.
              #
              # @overload delete_monitored_project(request, options = nil)
              #   Pass arguments to `delete_monitored_project` via a request object, either of type
              #   {::Google::Cloud::Monitoring::MetricsScope::V1::DeleteMonitoredProjectRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Monitoring::MetricsScope::V1::DeleteMonitoredProjectRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              #
              # @overload delete_monitored_project(name: nil)
              #   Pass arguments to `delete_monitored_project` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param name [::String]
              #     Required. The resource name of the `MonitoredProject`.
              #     Example:
              #     `locations/global/metricsScopes/{SCOPING_PROJECT_ID_OR_NUMBER}/projects/{MONITORED_PROJECT_ID_OR_NUMBER}`
              #
              #     Authorization requires the following [Google
              #     IAM](https://cloud.google.com/iam) permissions on both the `Metrics Scope`
              #     and on the `MonitoredProject`: `monitoring.metricsScopes.link`
              #
              # @yield [response, operation] Access the result along with the RPC operation
              # @yieldparam response [::Gapic::Operation]
              # @yieldparam operation [::GRPC::ActiveCall::Operation]
              #
              # @return [::Gapic::Operation]
              #
              # @raise [::Google::Cloud::Error] if the RPC is aborted.
              #
              # @example Basic example
              #   require "google/cloud/monitoring/metrics_scope/v1"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Monitoring::MetricsScope::V1::DeleteMonitoredProjectRequest.new
              #
              #   # Call the delete_monitored_project method.
              #   result = client.delete_monitored_project request
              #
              #   # The returned object is of type Gapic::Operation. You can use it to
              #   # check the status of an operation, cancel it, or wait for results.
              #   # Here is how to wait for a response.
              #   result.wait_until_done! timeout: 60
              #   if result.response?
              #     p result.response
              #   else
              #     puts "No response received."
              #   end
              #
              def delete_monitored_project request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Monitoring::MetricsScope::V1::DeleteMonitoredProjectRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                metadata = @config.rpcs.delete_monitored_project.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Monitoring::MetricsScope::V1::VERSION
                metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                header_params = {}
                if request.name
                  header_params["name"] = request.name
                end

                request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
                metadata[:"x-goog-request-params"] ||= request_params_header

                options.apply_defaults timeout:      @config.rpcs.delete_monitored_project.timeout,
                                       metadata:     metadata,
                                       retry_policy: @config.rpcs.delete_monitored_project.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @metrics_scopes_stub.call_rpc :delete_monitored_project, request, options: options do |response, operation|
                  response = ::Gapic::Operation.new response, @operations_client, options: options
                  yield response, operation if block_given?
                  return response
                end
              rescue ::GRPC::BadStatus => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Configuration class for the MetricsScopes API.
              #
              # This class represents the configuration for MetricsScopes,
              # providing control over timeouts, retry behavior, logging, transport
              # parameters, and other low-level controls. Certain parameters can also be
              # applied individually to specific RPCs. See
              # {::Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Client::Configuration::Rpcs}
              # for a list of RPCs that can be configured independently.
              #
              # Configuration can be applied globally to all clients, or to a single client
              # on construction.
              #
              # @example
              #
              #   # Modify the global config, setting the timeout for
              #   # get_metrics_scope to 20 seconds,
              #   # and all remaining timeouts to 10 seconds.
              #   ::Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Client.configure do |config|
              #     config.timeout = 10.0
              #     config.rpcs.get_metrics_scope.timeout = 20.0
              #   end
              #
              #   # Apply the above configuration only to a new client.
              #   client = ::Google::Cloud::Monitoring::MetricsScope::V1::MetricsScopes::Client.new do |config|
              #     config.timeout = 10.0
              #     config.rpcs.get_metrics_scope.timeout = 20.0
              #   end
              #
              # @!attribute [rw] endpoint
              #   The hostname or hostname:port of the service endpoint.
              #   Defaults to `"monitoring.googleapis.com"`.
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

                config_attr :endpoint,      "monitoring.googleapis.com", ::String
                config_attr :credentials,   nil do |value|
                  allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
                  allowed += [::GRPC::Core::Channel, ::GRPC::Core::ChannelCredentials] if defined? ::GRPC
                  allowed.any? { |klass| klass === value }
                end
                config_attr :scope,         nil, ::String, ::Array, nil
                config_attr :lib_name,      nil, ::String, nil
                config_attr :lib_version,   nil, ::String, nil
                config_attr(:channel_args,  {"grpc.service_config_disable_resolution"=>1}, ::Hash, nil)
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
                # Configuration RPC class for the MetricsScopes API.
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
                  # RPC-specific configuration for `get_metrics_scope`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :get_metrics_scope
                  ##
                  # RPC-specific configuration for `list_metrics_scopes_by_monitored_project`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :list_metrics_scopes_by_monitored_project
                  ##
                  # RPC-specific configuration for `create_monitored_project`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :create_monitored_project
                  ##
                  # RPC-specific configuration for `delete_monitored_project`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :delete_monitored_project

                  # @private
                  def initialize parent_rpcs = nil
                    get_metrics_scope_config = parent_rpcs.get_metrics_scope if parent_rpcs.respond_to? :get_metrics_scope
                    @get_metrics_scope = ::Gapic::Config::Method.new get_metrics_scope_config
                    list_metrics_scopes_by_monitored_project_config = parent_rpcs.list_metrics_scopes_by_monitored_project if parent_rpcs.respond_to? :list_metrics_scopes_by_monitored_project
                    @list_metrics_scopes_by_monitored_project = ::Gapic::Config::Method.new list_metrics_scopes_by_monitored_project_config
                    create_monitored_project_config = parent_rpcs.create_monitored_project if parent_rpcs.respond_to? :create_monitored_project
                    @create_monitored_project = ::Gapic::Config::Method.new create_monitored_project_config
                    delete_monitored_project_config = parent_rpcs.delete_monitored_project if parent_rpcs.respond_to? :delete_monitored_project
                    @delete_monitored_project = ::Gapic::Config::Method.new delete_monitored_project_config

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
end

