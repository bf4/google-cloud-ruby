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
    module SecurityCenter
      module V1p1beta1
        module SecurityCenter
          # Path helper methods for the SecurityCenter API.
          module Paths
            ##
            # Create a fully-qualified Finding resource string.
            #
            # @overload finding_path(organization:, source:, finding:)
            #   The resource will be in the following format:
            #
            #   `organizations/{organization}/sources/{source}/findings/{finding}`
            #
            #   @param organization [String]
            #   @param source [String]
            #   @param finding [String]
            #
            # @overload finding_path(folder:, source:, finding:)
            #   The resource will be in the following format:
            #
            #   `folders/{folder}/sources/{source}/findings/{finding}`
            #
            #   @param folder [String]
            #   @param source [String]
            #   @param finding [String]
            #
            # @overload finding_path(project:, source:, finding:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/sources/{source}/findings/{finding}`
            #
            #   @param project [String]
            #   @param source [String]
            #   @param finding [String]
            #
            # @return [::String]
            def finding_path **args
              resources = {
                "finding:organization:source" => (proc do |organization:, source:, finding:|
                  raise ::ArgumentError, "organization cannot contain /" if organization.to_s.include? "/"
                  raise ::ArgumentError, "source cannot contain /" if source.to_s.include? "/"

                  "organizations/#{organization}/sources/#{source}/findings/#{finding}"
                end),
                "finding:folder:source" => (proc do |folder:, source:, finding:|
                  raise ::ArgumentError, "folder cannot contain /" if folder.to_s.include? "/"
                  raise ::ArgumentError, "source cannot contain /" if source.to_s.include? "/"

                  "folders/#{folder}/sources/#{source}/findings/#{finding}"
                end),
                "finding:project:source" => (proc do |project:, source:, finding:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
                  raise ::ArgumentError, "source cannot contain /" if source.to_s.include? "/"

                  "projects/#{project}/sources/#{source}/findings/#{finding}"
                end)
              }

              resource = resources[args.keys.sort.join(":")]
              raise ::ArgumentError, "no resource found for values #{args.keys}" if resource.nil?
              resource.call(**args)
            end

            ##
            # Create a fully-qualified Folder resource string.
            #
            # The resource will be in the following format:
            #
            # `folders/{folder}`
            #
            # @param folder [String]
            #
            # @return [::String]
            def folder_path folder:
              "folders/#{folder}"
            end

            ##
            # Create a fully-qualified NotificationConfig resource string.
            #
            # The resource will be in the following format:
            #
            # `organizations/{organization}/notificationConfigs/{notification_config}`
            #
            # @param organization [String]
            # @param notification_config [String]
            #
            # @return [::String]
            def notification_config_path organization:, notification_config:
              raise ::ArgumentError, "organization cannot contain /" if organization.to_s.include? "/"

              "organizations/#{organization}/notificationConfigs/#{notification_config}"
            end

            ##
            # Create a fully-qualified Organization resource string.
            #
            # The resource will be in the following format:
            #
            # `organizations/{organization}`
            #
            # @param organization [String]
            #
            # @return [::String]
            def organization_path organization:
              "organizations/#{organization}"
            end

            ##
            # Create a fully-qualified OrganizationSettings resource string.
            #
            # The resource will be in the following format:
            #
            # `organizations/{organization}/organizationSettings`
            #
            # @param organization [String]
            #
            # @return [::String]
            def organization_settings_path organization:
              "organizations/#{organization}/organizationSettings"
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

            ##
            # Create a fully-qualified SecurityMarks resource string.
            #
            # @overload security_marks_path(organization:, asset:)
            #   The resource will be in the following format:
            #
            #   `organizations/{organization}/assets/{asset}/securityMarks`
            #
            #   @param organization [String]
            #   @param asset [String]
            #
            # @overload security_marks_path(organization:, source:, finding:)
            #   The resource will be in the following format:
            #
            #   `organizations/{organization}/sources/{source}/findings/{finding}/securityMarks`
            #
            #   @param organization [String]
            #   @param source [String]
            #   @param finding [String]
            #
            # @overload security_marks_path(folder:, asset:)
            #   The resource will be in the following format:
            #
            #   `folders/{folder}/assets/{asset}/securityMarks`
            #
            #   @param folder [String]
            #   @param asset [String]
            #
            # @overload security_marks_path(project:, asset:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/assets/{asset}/securityMarks`
            #
            #   @param project [String]
            #   @param asset [String]
            #
            # @overload security_marks_path(folder:, source:, finding:)
            #   The resource will be in the following format:
            #
            #   `folders/{folder}/sources/{source}/findings/{finding}/securityMarks`
            #
            #   @param folder [String]
            #   @param source [String]
            #   @param finding [String]
            #
            # @overload security_marks_path(project:, source:, finding:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/sources/{source}/findings/{finding}/securityMarks`
            #
            #   @param project [String]
            #   @param source [String]
            #   @param finding [String]
            #
            # @return [::String]
            def security_marks_path **args
              resources = {
                "asset:organization" => (proc do |organization:, asset:|
                  raise ::ArgumentError, "organization cannot contain /" if organization.to_s.include? "/"

                  "organizations/#{organization}/assets/#{asset}/securityMarks"
                end),
                "finding:organization:source" => (proc do |organization:, source:, finding:|
                  raise ::ArgumentError, "organization cannot contain /" if organization.to_s.include? "/"
                  raise ::ArgumentError, "source cannot contain /" if source.to_s.include? "/"

                  "organizations/#{organization}/sources/#{source}/findings/#{finding}/securityMarks"
                end),
                "asset:folder" => (proc do |folder:, asset:|
                  raise ::ArgumentError, "folder cannot contain /" if folder.to_s.include? "/"

                  "folders/#{folder}/assets/#{asset}/securityMarks"
                end),
                "asset:project" => (proc do |project:, asset:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

                  "projects/#{project}/assets/#{asset}/securityMarks"
                end),
                "finding:folder:source" => (proc do |folder:, source:, finding:|
                  raise ::ArgumentError, "folder cannot contain /" if folder.to_s.include? "/"
                  raise ::ArgumentError, "source cannot contain /" if source.to_s.include? "/"

                  "folders/#{folder}/sources/#{source}/findings/#{finding}/securityMarks"
                end),
                "finding:project:source" => (proc do |project:, source:, finding:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
                  raise ::ArgumentError, "source cannot contain /" if source.to_s.include? "/"

                  "projects/#{project}/sources/#{source}/findings/#{finding}/securityMarks"
                end)
              }

              resource = resources[args.keys.sort.join(":")]
              raise ::ArgumentError, "no resource found for values #{args.keys}" if resource.nil?
              resource.call(**args)
            end

            ##
            # Create a fully-qualified Source resource string.
            #
            # @overload source_path(organization:, source:)
            #   The resource will be in the following format:
            #
            #   `organizations/{organization}/sources/{source}`
            #
            #   @param organization [String]
            #   @param source [String]
            #
            # @overload source_path(folder:, source:)
            #   The resource will be in the following format:
            #
            #   `folders/{folder}/sources/{source}`
            #
            #   @param folder [String]
            #   @param source [String]
            #
            # @overload source_path(project:, source:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/sources/{source}`
            #
            #   @param project [String]
            #   @param source [String]
            #
            # @return [::String]
            def source_path **args
              resources = {
                "organization:source" => (proc do |organization:, source:|
                  raise ::ArgumentError, "organization cannot contain /" if organization.to_s.include? "/"

                  "organizations/#{organization}/sources/#{source}"
                end),
                "folder:source" => (proc do |folder:, source:|
                  raise ::ArgumentError, "folder cannot contain /" if folder.to_s.include? "/"

                  "folders/#{folder}/sources/#{source}"
                end),
                "project:source" => (proc do |project:, source:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

                  "projects/#{project}/sources/#{source}"
                end)
              }

              resource = resources[args.keys.sort.join(":")]
              raise ::ArgumentError, "no resource found for values #{args.keys}" if resource.nil?
              resource.call(**args)
            end

            ##
            # Create a fully-qualified Topic resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/topics/{topic}`
            #
            # @param project [String]
            # @param topic [String]
            #
            # @return [::String]
            def topic_path project:, topic:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

              "projects/#{project}/topics/#{topic}"
            end

            extend self
          end
        end
      end
    end
  end
end
