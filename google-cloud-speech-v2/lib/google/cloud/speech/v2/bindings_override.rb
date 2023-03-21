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

require "gapic/config"

module Google
  module Cloud
    module Speech
      ##
      # @example Loading just the REST part of this package, including all its services, and instantiating a REST client
      #
      #     require "google/cloud/speech/v2/rest"
      #     client = ::Google::Cloud::Speech::V2::Speech::Rest::Client.new
      #
      module V2
        ##
        # @private
        # Initialize the mixin bindings configuration
        #
        def self.configure
          @configure ||= begin
            namespace = ["Google", "Cloud", "Speech"]
            parent_config = while namespace.any?
                              parent_name = namespace.join "::"
                              parent_const = const_get parent_name
                              break parent_const.configure if parent_const.respond_to? :configure
                              namespace.pop
                            end

            default_config = Configuration.new parent_config
            default_config.bindings_override["google.cloud.location.Locations.GetLocation"] = [
              Gapic::Rest::GrpcTranscoder::HttpBinding.create_with_validation(
                uri_method: :get,
                uri_template: "/v2/{name}",
                matches: [
                  ["name", %r{^projects/[^/]+/locations/[^/]+/?$}, false]
                ],
                body: nil
              )
            ]
            default_config.bindings_override["google.cloud.location.Locations.ListLocations"] = [

              Gapic::Rest::GrpcTranscoder::HttpBinding.create_with_validation(
                uri_method: :get,
                uri_template: "/v2/{name}/locations",
                matches: [
                  ["name", %r{^projects/[^/]+/?$}, false]
                ],
                body: nil
              )
            ]
            default_config
          end
          yield @configure if block_given?
          @configure
        end

        ##
        # @private
        # Configuration class for the google.cloud.speech.v2 package.
        #
        # This class contains common configuration for all services
        # of the google.cloud.speech.v2 package.
        #
        # This configuration is for internal use of the client library classes,
        # and it is not intended that the end-users will read or change it.
        #
        class Configuration
          extend ::Gapic::Config

          # @private
          # Overrides for http bindings for the RPC of the mixins for this package.
          # Services in this package should use these when creating clients for the mixin services.
          # @return [::Hash{::Symbol=>::Array<::Gapic::Rest::GrpcTranscoder::HttpBinding>}]
          config_attr :bindings_override, {}, ::Hash, nil

          # @private
          def initialize parent_config = nil
            @parent_config = parent_config unless parent_config.nil?

            yield self if block_given?
          end
        end
      end
    end
  end
end
