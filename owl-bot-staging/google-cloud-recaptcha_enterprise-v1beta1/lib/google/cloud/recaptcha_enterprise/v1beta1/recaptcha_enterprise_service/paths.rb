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
    module RecaptchaEnterprise
      module V1beta1
        module RecaptchaEnterpriseService
          # Path helper methods for the RecaptchaEnterpriseService API.
          module Paths
            ##
            # Create a fully-qualified Assessment resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/assessments/{assessment}`
            #
            # @param project [String]
            # @param assessment [String]
            #
            # @return [::String]
            def assessment_path project:, assessment:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

              "projects/#{project}/assessments/#{assessment}"
            end

            ##
            # Create a fully-qualified Key resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/keys/{key}`
            #
            # @param project [String]
            # @param key [String]
            #
            # @return [::String]
            def key_path project:, key:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

              "projects/#{project}/keys/#{key}"
            end

            ##
            # Create a fully-qualified Project resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}`
            #
            # @param project [String]
            #
            # @return [::String]
            def project_path project:
              "projects/#{project}"
            end

            extend self
          end
        end
      end
    end
  end
end
