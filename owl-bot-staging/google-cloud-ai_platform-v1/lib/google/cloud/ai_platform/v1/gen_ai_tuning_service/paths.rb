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


module Google
  module Cloud
    module AIPlatform
      module V1
        module GenAiTuningService
          # Path helper methods for the GenAiTuningService API.
          module Paths
            ##
            # Create a fully-qualified Context resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/metadataStores/{metadata_store}/contexts/{context}`
            #
            # @param project [String]
            # @param location [String]
            # @param metadata_store [String]
            # @param context [String]
            #
            # @return [::String]
            def context_path project:, location:, metadata_store:, context:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"
              raise ::ArgumentError, "metadata_store cannot contain /" if metadata_store.to_s.include? "/"

              "projects/#{project}/locations/#{location}/metadataStores/#{metadata_store}/contexts/#{context}"
            end

            ##
            # Create a fully-qualified Endpoint resource string.
            #
            # @overload endpoint_path(project:, location:, endpoint:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/locations/{location}/endpoints/{endpoint}`
            #
            #   @param project [String]
            #   @param location [String]
            #   @param endpoint [String]
            #
            # @overload endpoint_path(project:, location:, publisher:, model:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/locations/{location}/publishers/{publisher}/models/{model}`
            #
            #   @param project [String]
            #   @param location [String]
            #   @param publisher [String]
            #   @param model [String]
            #
            # @return [::String]
            def endpoint_path **args
              resources = {
                "endpoint:location:project" => (proc do |project:, location:, endpoint:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
                  raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

                  "projects/#{project}/locations/#{location}/endpoints/#{endpoint}"
                end),
                "location:model:project:publisher" => (proc do |project:, location:, publisher:, model:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
                  raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"
                  raise ::ArgumentError, "publisher cannot contain /" if publisher.to_s.include? "/"

                  "projects/#{project}/locations/#{location}/publishers/#{publisher}/models/#{model}"
                end)
              }

              resource = resources[args.keys.sort.join(":")]
              raise ::ArgumentError, "no resource found for values #{args.keys}" if resource.nil?
              resource.call(**args)
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
            # Create a fully-qualified Model resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/models/{model}`
            #
            # @param project [String]
            # @param location [String]
            # @param model [String]
            #
            # @return [::String]
            def model_path project:, location:, model:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/models/#{model}"
            end

            ##
            # Create a fully-qualified TuningJob resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/tuningJobs/{tuning_job}`
            #
            # @param project [String]
            # @param location [String]
            # @param tuning_job [String]
            #
            # @return [::String]
            def tuning_job_path project:, location:, tuning_job:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/tuningJobs/#{tuning_job}"
            end

            extend self
          end
        end
      end
    end
  end
end
