# frozen_string_literal: true

# Copyright 2020 Google LLC
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


module Grafeas
  module V1
    # An artifact that can be deployed in some runtime.
    # @!attribute [rw] resource_uri
    #   @return [::Array<::String>]
    #     Required. Resource URI for the artifact being deployed.
    class DeploymentNote
      include ::Google::Protobuf::MessageExts
      extend ::Google::Protobuf::MessageExts::ClassMethods
    end

    # The period during which some deployable was active in a runtime.
    # @!attribute [rw] user_email
    #   @return [::String]
    #     Identity of the user that triggered this deployment.
    # @!attribute [rw] deploy_time
    #   @return [::Google::Protobuf::Timestamp]
    #     Required. Beginning of the lifetime of this deployment.
    # @!attribute [rw] undeploy_time
    #   @return [::Google::Protobuf::Timestamp]
    #     End of the lifetime of this deployment.
    # @!attribute [rw] config
    #   @return [::String]
    #     Configuration used to create this deployment.
    # @!attribute [rw] address
    #   @return [::String]
    #     Address of the runtime element hosting this deployment.
    # @!attribute [rw] resource_uri
    #   @return [::Array<::String>]
    #     Output only. Resource URI for the artifact being deployed taken from
    #     the deployable field with the same name.
    # @!attribute [rw] platform
    #   @return [::Grafeas::V1::DeploymentOccurrence::Platform]
    #     Platform hosting this deployment.
    class DeploymentOccurrence
      include ::Google::Protobuf::MessageExts
      extend ::Google::Protobuf::MessageExts::ClassMethods

      # Types of platforms.
      module Platform

        # Unknown.
        PLATFORM_UNSPECIFIED = 0

        # Google Container Engine.
        GKE = 1

        # Google App Engine: Flexible Environment.
        FLEX = 2

        # Custom user-defined platform.
        CUSTOM = 3
      end
    end
  end
end

