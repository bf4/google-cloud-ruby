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
    module Metastore
      module V1
        module DataprocMetastore
          # Path helper methods for the DataprocMetastore API.
          module Paths
            ##
            # Create a fully-qualified Backup resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/services/{service}/backups/{backup}`
            #
            # @param project [String]
            # @param location [String]
            # @param service [String]
            # @param backup [String]
            #
            # @return [::String]
            def backup_path project:, location:, service:, backup:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"
              raise ::ArgumentError, "service cannot contain /" if service.to_s.include? "/"

              "projects/#{project}/locations/#{location}/services/#{service}/backups/#{backup}"
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
            # Create a fully-qualified MetadataImport resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/services/{service}/metadataImports/{metadata_import}`
            #
            # @param project [String]
            # @param location [String]
            # @param service [String]
            # @param metadata_import [String]
            #
            # @return [::String]
            def metadata_import_path project:, location:, service:, metadata_import:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"
              raise ::ArgumentError, "service cannot contain /" if service.to_s.include? "/"

              "projects/#{project}/locations/#{location}/services/#{service}/metadataImports/#{metadata_import}"
            end

            ##
            # Create a fully-qualified Network resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/global/networks/{network}`
            #
            # @param project [String]
            # @param network [String]
            #
            # @return [::String]
            def network_path project:, network:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

              "projects/#{project}/global/networks/#{network}"
            end

            ##
            # Create a fully-qualified Service resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/services/{service}`
            #
            # @param project [String]
            # @param location [String]
            # @param service [String]
            #
            # @return [::String]
            def service_path project:, location:, service:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/services/#{service}"
            end

            ##
            # Create a fully-qualified Subnetwork resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/regions/{region}/subnetworks/{subnetwork}`
            #
            # @param project [String]
            # @param region [String]
            # @param subnetwork [String]
            #
            # @return [::String]
            def subnetwork_path project:, region:, subnetwork:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "region cannot contain /" if region.to_s.include? "/"

              "projects/#{project}/regions/#{region}/subnetworks/#{subnetwork}"
            end

            extend self
          end
        end
      end
    end
  end
end

