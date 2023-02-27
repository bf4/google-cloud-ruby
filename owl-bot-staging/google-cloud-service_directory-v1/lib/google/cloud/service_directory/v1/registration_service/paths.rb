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
  module Cloud
    module ServiceDirectory
      module V1
        module RegistrationService
          # Path helper methods for the RegistrationService API.
          module Paths
            ##
            # Create a fully-qualified Endpoint resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/namespaces/{namespace}/services/{service}/endpoints/{endpoint}`
            #
            # @param project [String]
            # @param location [String]
            # @param namespace [String]
            # @param service [String]
            # @param endpoint [String]
            #
            # @return [::String]
            def endpoint_path project:, location:, namespace:, service:, endpoint:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"
              raise ::ArgumentError, "namespace cannot contain /" if namespace.to_s.include? "/"
              raise ::ArgumentError, "service cannot contain /" if service.to_s.include? "/"

              "projects/#{project}/locations/#{location}/namespaces/#{namespace}/services/#{service}/endpoints/#{endpoint}"
            end

            ##
            # Create a fully-qualified Location resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}`
            #
            # @param project [String]
            # @param location [String]
            #
            # @return [::String]
            def location_path project:, location:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

              "projects/#{project}/locations/#{location}"
            end

            ##
            # Create a fully-qualified Namespace resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/namespaces/{namespace}`
            #
            # @param project [String]
            # @param location [String]
            # @param namespace [String]
            #
            # @return [::String]
            def namespace_path project:, location:, namespace:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/namespaces/#{namespace}"
            end

            ##
            # Create a fully-qualified Service resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/namespaces/{namespace}/services/{service}`
            #
            # @param project [String]
            # @param location [String]
            # @param namespace [String]
            # @param service [String]
            #
            # @return [::String]
            def service_path project:, location:, namespace:, service:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"
              raise ::ArgumentError, "namespace cannot contain /" if namespace.to_s.include? "/"

              "projects/#{project}/locations/#{location}/namespaces/#{namespace}/services/#{service}"
            end

            extend self
          end
        end
      end
    end
  end
end
