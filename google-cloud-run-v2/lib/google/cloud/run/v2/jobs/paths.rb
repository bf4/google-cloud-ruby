# frozen_string_literal: true

# Copyright 2022 Google LLC
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
    module Run
      module V2
        module Jobs
          # Path helper methods for the Jobs API.
          module Paths
            ##
            # Create a fully-qualified Connector resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/connectors/{connector}`
            #
            # @param project [String]
            # @param location [String]
            # @param connector [String]
            #
            # @return [::String]
            def connector_path project:, location:, connector:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/connectors/#{connector}"
            end

            ##
            # Create a fully-qualified CryptoKey resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/keyRings/{key_ring}/cryptoKeys/{crypto_key}`
            #
            # @param project [String]
            # @param location [String]
            # @param key_ring [String]
            # @param crypto_key [String]
            #
            # @return [::String]
            def crypto_key_path project:, location:, key_ring:, crypto_key:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"
              raise ::ArgumentError, "key_ring cannot contain /" if key_ring.to_s.include? "/"

              "projects/#{project}/locations/#{location}/keyRings/#{key_ring}/cryptoKeys/#{crypto_key}"
            end

            ##
            # Create a fully-qualified Execution resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/jobs/{job}/executions/{execution}`
            #
            # @param project [String]
            # @param location [String]
            # @param job [String]
            # @param execution [String]
            #
            # @return [::String]
            def execution_path project:, location:, job:, execution:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"
              raise ::ArgumentError, "job cannot contain /" if job.to_s.include? "/"

              "projects/#{project}/locations/#{location}/jobs/#{job}/executions/#{execution}"
            end

            ##
            # Create a fully-qualified Job resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/jobs/{job}`
            #
            # @param project [String]
            # @param location [String]
            # @param job [String]
            #
            # @return [::String]
            def job_path project:, location:, job:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/jobs/#{job}"
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
            # Create a fully-qualified Secret resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/secrets/{secret}`
            #
            # @param project [String]
            # @param secret [String]
            #
            # @return [::String]
            def secret_path project:, secret:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

              "projects/#{project}/secrets/#{secret}"
            end

            ##
            # Create a fully-qualified SecretVersion resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/secrets/{secret}/versions/{version}`
            #
            # @param project [String]
            # @param secret [String]
            # @param version [String]
            #
            # @return [::String]
            def secret_version_path project:, secret:, version:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "secret cannot contain /" if secret.to_s.include? "/"

              "projects/#{project}/secrets/#{secret}/versions/#{version}"
            end

            extend self
          end
        end
      end
    end
  end
end