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

require "google/cloud/errors"
require "google/cloud/language/v2/language_service_pb"
require "google/cloud/language/v2/language_service/rest/service_stub"

module Google
  module Cloud
    module Language
      module V2
        module LanguageService
          module Rest
            ##
            # REST client for the LanguageService service.
            #
            # Provides text analysis operations such as sentiment analysis and entity
            # recognition.
            #
            class Client
              # @private
              DEFAULT_ENDPOINT_TEMPLATE = "language.$UNIVERSE_DOMAIN$"

              # @private
              attr_reader :language_service_stub

              ##
              # Configure the LanguageService Client class.
              #
              # See {::Google::Cloud::Language::V2::LanguageService::Rest::Client::Configuration}
              # for a description of the configuration fields.
              #
              # @example
              #
              #   # Modify the configuration for all LanguageService clients
              #   ::Google::Cloud::Language::V2::LanguageService::Rest::Client.configure do |config|
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
                  namespace = ["Google", "Cloud", "Language", "V2"]
                  parent_config = while namespace.any?
                                    parent_name = namespace.join "::"
                                    parent_const = const_get parent_name
                                    break parent_const.configure if parent_const.respond_to? :configure
                                    namespace.pop
                                  end
                  default_config = Client::Configuration.new parent_config

                  default_config.rpcs.analyze_sentiment.timeout = 600.0
                  default_config.rpcs.analyze_sentiment.retry_policy = {
                    initial_delay: 0.1, max_delay: 60.0, multiplier: 1.3, retry_codes: [4, 14]
                  }

                  default_config.rpcs.analyze_entities.timeout = 600.0
                  default_config.rpcs.analyze_entities.retry_policy = {
                    initial_delay: 0.1, max_delay: 60.0, multiplier: 1.3, retry_codes: [4, 14]
                  }

                  default_config.rpcs.classify_text.timeout = 600.0
                  default_config.rpcs.classify_text.retry_policy = {
                    initial_delay: 0.1, max_delay: 60.0, multiplier: 1.3, retry_codes: [4, 14]
                  }

                  default_config.rpcs.moderate_text.timeout = 600.0
                  default_config.rpcs.moderate_text.retry_policy = {
                    initial_delay: 0.1, max_delay: 60.0, multiplier: 1.3, retry_codes: [4, 14]
                  }

                  default_config.rpcs.annotate_text.timeout = 600.0
                  default_config.rpcs.annotate_text.retry_policy = {
                    initial_delay: 0.1, max_delay: 60.0, multiplier: 1.3, retry_codes: [4, 14]
                  }

                  default_config
                end
                yield @configure if block_given?
                @configure
              end

              ##
              # Configure the LanguageService Client instance.
              #
              # The configuration is set to the derived mode, meaning that values can be changed,
              # but structural changes (adding new fields, etc.) are not allowed. Structural changes
              # should be made on {Client.configure}.
              #
              # See {::Google::Cloud::Language::V2::LanguageService::Rest::Client::Configuration}
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
              # The effective universe domain
              #
              # @return [String]
              #
              def universe_domain
                @language_service_stub.universe_domain
              end

              ##
              # Create a new LanguageService REST client object.
              #
              # @example
              #
              #   # Create a client using the default configuration
              #   client = ::Google::Cloud::Language::V2::LanguageService::Rest::Client.new
              #
              #   # Create a client using a custom configuration
              #   client = ::Google::Cloud::Language::V2::LanguageService::Rest::Client.new do |config|
              #     config.timeout = 10.0
              #   end
              #
              # @yield [config] Configure the LanguageService client.
              # @yieldparam config [Client::Configuration]
              #
              def initialize
                # Create the configuration object
                @config = Configuration.new Client.configure

                # Yield the configuration if needed
                yield @config if block_given?

                # Create credentials
                credentials = @config.credentials
                # Use self-signed JWT if the endpoint is unchanged from default,
                # but only if the default endpoint does not have a region prefix.
                enable_self_signed_jwt = @config.endpoint.nil? ||
                                         (@config.endpoint == Configuration::DEFAULT_ENDPOINT &&
                                         !@config.endpoint.split(".").first.include?("-"))
                credentials ||= Credentials.default scope: @config.scope,
                                                    enable_self_signed_jwt: enable_self_signed_jwt
                if credentials.is_a?(::String) || credentials.is_a?(::Hash)
                  credentials = Credentials.new credentials, scope: @config.scope
                end

                @quota_project_id = @config.quota_project
                @quota_project_id ||= credentials.quota_project_id if credentials.respond_to? :quota_project_id

                @language_service_stub = ::Google::Cloud::Language::V2::LanguageService::Rest::ServiceStub.new(
                  endpoint: @config.endpoint,
                  endpoint_template: DEFAULT_ENDPOINT_TEMPLATE,
                  universe_domain: @config.universe_domain,
                  credentials: credentials
                )
              end

              # Service calls

              ##
              # Analyzes the sentiment of the provided text.
              #
              # @overload analyze_sentiment(request, options = nil)
              #   Pass arguments to `analyze_sentiment` via a request object, either of type
              #   {::Google::Cloud::Language::V2::AnalyzeSentimentRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Language::V2::AnalyzeSentimentRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #
              # @overload analyze_sentiment(document: nil, encoding_type: nil)
              #   Pass arguments to `analyze_sentiment` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param document [::Google::Cloud::Language::V2::Document, ::Hash]
              #     Required. Input document.
              #   @param encoding_type [::Google::Cloud::Language::V2::EncodingType]
              #     The encoding type used by the API to calculate sentence offsets.
              # @yield [result, operation] Access the result along with the TransportOperation object
              # @yieldparam result [::Google::Cloud::Language::V2::AnalyzeSentimentResponse]
              # @yieldparam operation [::Gapic::Rest::TransportOperation]
              #
              # @return [::Google::Cloud::Language::V2::AnalyzeSentimentResponse]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              #
              # @example Basic example
              #   require "google/cloud/language/v2"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Language::V2::LanguageService::Rest::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Language::V2::AnalyzeSentimentRequest.new
              #
              #   # Call the analyze_sentiment method.
              #   result = client.analyze_sentiment request
              #
              #   # The returned object is of type Google::Cloud::Language::V2::AnalyzeSentimentResponse.
              #   p result
              #
              def analyze_sentiment request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Language::V2::AnalyzeSentimentRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = @config.rpcs.analyze_sentiment.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Language::V2::VERSION,
                  transports_version_send: [:rest]

                call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                options.apply_defaults timeout:      @config.rpcs.analyze_sentiment.timeout,
                                       metadata:     call_metadata,
                                       retry_policy: @config.rpcs.analyze_sentiment.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @language_service_stub.analyze_sentiment request, options do |result, operation|
                  yield result, operation if block_given?
                  return result
                end
              rescue ::Gapic::Rest::Error => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Finds named entities (currently proper names and common nouns) in the text
              # along with entity types, probability, mentions for each entity, and
              # other properties.
              #
              # @overload analyze_entities(request, options = nil)
              #   Pass arguments to `analyze_entities` via a request object, either of type
              #   {::Google::Cloud::Language::V2::AnalyzeEntitiesRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Language::V2::AnalyzeEntitiesRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #
              # @overload analyze_entities(document: nil, encoding_type: nil)
              #   Pass arguments to `analyze_entities` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param document [::Google::Cloud::Language::V2::Document, ::Hash]
              #     Required. Input document.
              #   @param encoding_type [::Google::Cloud::Language::V2::EncodingType]
              #     The encoding type used by the API to calculate offsets.
              # @yield [result, operation] Access the result along with the TransportOperation object
              # @yieldparam result [::Google::Cloud::Language::V2::AnalyzeEntitiesResponse]
              # @yieldparam operation [::Gapic::Rest::TransportOperation]
              #
              # @return [::Google::Cloud::Language::V2::AnalyzeEntitiesResponse]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              #
              # @example Basic example
              #   require "google/cloud/language/v2"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Language::V2::LanguageService::Rest::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Language::V2::AnalyzeEntitiesRequest.new
              #
              #   # Call the analyze_entities method.
              #   result = client.analyze_entities request
              #
              #   # The returned object is of type Google::Cloud::Language::V2::AnalyzeEntitiesResponse.
              #   p result
              #
              def analyze_entities request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Language::V2::AnalyzeEntitiesRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = @config.rpcs.analyze_entities.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Language::V2::VERSION,
                  transports_version_send: [:rest]

                call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                options.apply_defaults timeout:      @config.rpcs.analyze_entities.timeout,
                                       metadata:     call_metadata,
                                       retry_policy: @config.rpcs.analyze_entities.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @language_service_stub.analyze_entities request, options do |result, operation|
                  yield result, operation if block_given?
                  return result
                end
              rescue ::Gapic::Rest::Error => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Classifies a document into categories.
              #
              # @overload classify_text(request, options = nil)
              #   Pass arguments to `classify_text` via a request object, either of type
              #   {::Google::Cloud::Language::V2::ClassifyTextRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Language::V2::ClassifyTextRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #
              # @overload classify_text(document: nil)
              #   Pass arguments to `classify_text` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param document [::Google::Cloud::Language::V2::Document, ::Hash]
              #     Required. Input document.
              # @yield [result, operation] Access the result along with the TransportOperation object
              # @yieldparam result [::Google::Cloud::Language::V2::ClassifyTextResponse]
              # @yieldparam operation [::Gapic::Rest::TransportOperation]
              #
              # @return [::Google::Cloud::Language::V2::ClassifyTextResponse]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              #
              # @example Basic example
              #   require "google/cloud/language/v2"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Language::V2::LanguageService::Rest::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Language::V2::ClassifyTextRequest.new
              #
              #   # Call the classify_text method.
              #   result = client.classify_text request
              #
              #   # The returned object is of type Google::Cloud::Language::V2::ClassifyTextResponse.
              #   p result
              #
              def classify_text request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Language::V2::ClassifyTextRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = @config.rpcs.classify_text.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Language::V2::VERSION,
                  transports_version_send: [:rest]

                call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                options.apply_defaults timeout:      @config.rpcs.classify_text.timeout,
                                       metadata:     call_metadata,
                                       retry_policy: @config.rpcs.classify_text.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @language_service_stub.classify_text request, options do |result, operation|
                  yield result, operation if block_given?
                  return result
                end
              rescue ::Gapic::Rest::Error => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Moderates a document for harmful and sensitive categories.
              #
              # @overload moderate_text(request, options = nil)
              #   Pass arguments to `moderate_text` via a request object, either of type
              #   {::Google::Cloud::Language::V2::ModerateTextRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Language::V2::ModerateTextRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #
              # @overload moderate_text(document: nil)
              #   Pass arguments to `moderate_text` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param document [::Google::Cloud::Language::V2::Document, ::Hash]
              #     Required. Input document.
              # @yield [result, operation] Access the result along with the TransportOperation object
              # @yieldparam result [::Google::Cloud::Language::V2::ModerateTextResponse]
              # @yieldparam operation [::Gapic::Rest::TransportOperation]
              #
              # @return [::Google::Cloud::Language::V2::ModerateTextResponse]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              #
              # @example Basic example
              #   require "google/cloud/language/v2"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Language::V2::LanguageService::Rest::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Language::V2::ModerateTextRequest.new
              #
              #   # Call the moderate_text method.
              #   result = client.moderate_text request
              #
              #   # The returned object is of type Google::Cloud::Language::V2::ModerateTextResponse.
              #   p result
              #
              def moderate_text request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Language::V2::ModerateTextRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = @config.rpcs.moderate_text.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Language::V2::VERSION,
                  transports_version_send: [:rest]

                call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                options.apply_defaults timeout:      @config.rpcs.moderate_text.timeout,
                                       metadata:     call_metadata,
                                       retry_policy: @config.rpcs.moderate_text.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @language_service_stub.moderate_text request, options do |result, operation|
                  yield result, operation if block_given?
                  return result
                end
              rescue ::Gapic::Rest::Error => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # A convenience method that provides all features in one call.
              #
              # @overload annotate_text(request, options = nil)
              #   Pass arguments to `annotate_text` via a request object, either of type
              #   {::Google::Cloud::Language::V2::AnnotateTextRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Language::V2::AnnotateTextRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #
              # @overload annotate_text(document: nil, features: nil, encoding_type: nil)
              #   Pass arguments to `annotate_text` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param document [::Google::Cloud::Language::V2::Document, ::Hash]
              #     Required. Input document.
              #   @param features [::Google::Cloud::Language::V2::AnnotateTextRequest::Features, ::Hash]
              #     Required. The enabled features.
              #   @param encoding_type [::Google::Cloud::Language::V2::EncodingType]
              #     The encoding type used by the API to calculate offsets.
              # @yield [result, operation] Access the result along with the TransportOperation object
              # @yieldparam result [::Google::Cloud::Language::V2::AnnotateTextResponse]
              # @yieldparam operation [::Gapic::Rest::TransportOperation]
              #
              # @return [::Google::Cloud::Language::V2::AnnotateTextResponse]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              #
              # @example Basic example
              #   require "google/cloud/language/v2"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Language::V2::LanguageService::Rest::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Language::V2::AnnotateTextRequest.new
              #
              #   # Call the annotate_text method.
              #   result = client.annotate_text request
              #
              #   # The returned object is of type Google::Cloud::Language::V2::AnnotateTextResponse.
              #   p result
              #
              def annotate_text request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Language::V2::AnnotateTextRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = @config.rpcs.annotate_text.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Language::V2::VERSION,
                  transports_version_send: [:rest]

                call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                options.apply_defaults timeout:      @config.rpcs.annotate_text.timeout,
                                       metadata:     call_metadata,
                                       retry_policy: @config.rpcs.annotate_text.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @language_service_stub.annotate_text request, options do |result, operation|
                  yield result, operation if block_given?
                  return result
                end
              rescue ::Gapic::Rest::Error => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Configuration class for the LanguageService REST API.
              #
              # This class represents the configuration for LanguageService REST,
              # providing control over timeouts, retry behavior, logging, transport
              # parameters, and other low-level controls. Certain parameters can also be
              # applied individually to specific RPCs. See
              # {::Google::Cloud::Language::V2::LanguageService::Rest::Client::Configuration::Rpcs}
              # for a list of RPCs that can be configured independently.
              #
              # Configuration can be applied globally to all clients, or to a single client
              # on construction.
              #
              # @example
              #
              #   # Modify the global config, setting the timeout for
              #   # analyze_sentiment to 20 seconds,
              #   # and all remaining timeouts to 10 seconds.
              #   ::Google::Cloud::Language::V2::LanguageService::Rest::Client.configure do |config|
              #     config.timeout = 10.0
              #     config.rpcs.analyze_sentiment.timeout = 20.0
              #   end
              #
              #   # Apply the above configuration only to a new client.
              #   client = ::Google::Cloud::Language::V2::LanguageService::Rest::Client.new do |config|
              #     config.timeout = 10.0
              #     config.rpcs.analyze_sentiment.timeout = 20.0
              #   end
              #
              # @!attribute [rw] endpoint
              #   A custom service endpoint, as a hostname or hostname:port. The default is
              #   nil, indicating to use the default endpoint in the current universe domain.
              #   @return [::String,nil]
              # @!attribute [rw] credentials
              #   Credentials to send with calls. You may provide any of the following types:
              #    *  (`String`) The path to a service account key file in JSON format
              #    *  (`Hash`) A service account key as a Hash
              #    *  (`Google::Auth::Credentials`) A googleauth credentials object
              #       (see the [googleauth docs](https://rubydoc.info/gems/googleauth/Google/Auth/Credentials))
              #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
              #       (see the [signet docs](https://rubydoc.info/gems/signet/Signet/OAuth2/Client))
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
              # @!attribute [rw] timeout
              #   The call timeout in seconds.
              #   @return [::Numeric]
              # @!attribute [rw] metadata
              #   Additional headers to be sent with the call.
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
              # @!attribute [rw] universe_domain
              #   The universe domain within which to make requests. This determines the
              #   default endpoint URL. The default value of nil uses the environment
              #   universe (usually the default "googleapis.com" universe).
              #   @return [::String,nil]
              #
              class Configuration
                extend ::Gapic::Config

                # @private
                # The endpoint specific to the default "googleapis.com" universe. Deprecated.
                DEFAULT_ENDPOINT = "language.googleapis.com"

                config_attr :endpoint,      nil, ::String, nil
                config_attr :credentials,   nil do |value|
                  allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
                  allowed.any? { |klass| klass === value }
                end
                config_attr :scope,         nil, ::String, ::Array, nil
                config_attr :lib_name,      nil, ::String, nil
                config_attr :lib_version,   nil, ::String, nil
                config_attr :timeout,       nil, ::Numeric, nil
                config_attr :metadata,      nil, ::Hash, nil
                config_attr :retry_policy,  nil, ::Hash, ::Proc, nil
                config_attr :quota_project, nil, ::String, nil
                config_attr :universe_domain, nil, ::String, nil

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
                # Configuration RPC class for the LanguageService API.
                #
                # Includes fields providing the configuration for each RPC in this service.
                # Each configuration object is of type `Gapic::Config::Method` and includes
                # the following configuration fields:
                #
                #  *  `timeout` (*type:* `Numeric`) - The call timeout in seconds
                #  *  `metadata` (*type:* `Hash{Symbol=>String}`) - Additional headers
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
                  # RPC-specific configuration for `analyze_sentiment`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :analyze_sentiment
                  ##
                  # RPC-specific configuration for `analyze_entities`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :analyze_entities
                  ##
                  # RPC-specific configuration for `classify_text`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :classify_text
                  ##
                  # RPC-specific configuration for `moderate_text`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :moderate_text
                  ##
                  # RPC-specific configuration for `annotate_text`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :annotate_text

                  # @private
                  def initialize parent_rpcs = nil
                    analyze_sentiment_config = parent_rpcs.analyze_sentiment if parent_rpcs.respond_to? :analyze_sentiment
                    @analyze_sentiment = ::Gapic::Config::Method.new analyze_sentiment_config
                    analyze_entities_config = parent_rpcs.analyze_entities if parent_rpcs.respond_to? :analyze_entities
                    @analyze_entities = ::Gapic::Config::Method.new analyze_entities_config
                    classify_text_config = parent_rpcs.classify_text if parent_rpcs.respond_to? :classify_text
                    @classify_text = ::Gapic::Config::Method.new classify_text_config
                    moderate_text_config = parent_rpcs.moderate_text if parent_rpcs.respond_to? :moderate_text
                    @moderate_text = ::Gapic::Config::Method.new moderate_text_config
                    annotate_text_config = parent_rpcs.annotate_text if parent_rpcs.respond_to? :annotate_text
                    @annotate_text = ::Gapic::Config::Method.new annotate_text_config

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
