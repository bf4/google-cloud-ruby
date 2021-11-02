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


module Google
  module Cloud
    module Logging
      module V2
        module LoggingService
          # Path helper methods for the LoggingService API.
          module Paths
            ##
            # Create a fully-qualified BillingAccount resource string.
            #
            # The resource will be in the following format:
            #
            # `billingAccounts/{billing_account}`
            #
            # @param billing_account [String]
            #
            # @return [::String]
            def billing_account_path billing_account:
              "billingAccounts/#{billing_account}"
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
            # Create a fully-qualified Log resource string.
            #
            # @overload log_path(project:, log:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/logs/{log}`
            #
            #   @param project [String]
            #   @param log [String]
            #
            # @overload log_path(organization:, log:)
            #   The resource will be in the following format:
            #
            #   `organizations/{organization}/logs/{log}`
            #
            #   @param organization [String]
            #   @param log [String]
            #
            # @overload log_path(folder:, log:)
            #   The resource will be in the following format:
            #
            #   `folders/{folder}/logs/{log}`
            #
            #   @param folder [String]
            #   @param log [String]
            #
            # @overload log_path(billing_account:, log:)
            #   The resource will be in the following format:
            #
            #   `billingAccounts/{billing_account}/logs/{log}`
            #
            #   @param billing_account [String]
            #   @param log [String]
            #
            # @return [::String]
            def log_path **args
              resources = {
                "log:project" => (proc do |project:, log:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

                  "projects/#{project}/logs/#{log}"
                end),
                "log:organization" => (proc do |organization:, log:|
                  raise ::ArgumentError, "organization cannot contain /" if organization.to_s.include? "/"

                  "organizations/#{organization}/logs/#{log}"
                end),
                "folder:log" => (proc do |folder:, log:|
                  raise ::ArgumentError, "folder cannot contain /" if folder.to_s.include? "/"

                  "folders/#{folder}/logs/#{log}"
                end),
                "billing_account:log" => (proc do |billing_account:, log:|
                  raise ::ArgumentError, "billing_account cannot contain /" if billing_account.to_s.include? "/"

                  "billingAccounts/#{billing_account}/logs/#{log}"
                end)
              }

              resource = resources[args.keys.sort.join(":")]
              raise ::ArgumentError, "no resource found for values #{args.keys}" if resource.nil?
              resource.call(**args)
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
