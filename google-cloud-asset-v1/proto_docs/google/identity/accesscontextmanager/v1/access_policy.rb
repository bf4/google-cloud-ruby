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


module Google
  module Identity
    module AccessContextManager
      module V1
        # `AccessPolicy` is a container for `AccessLevels` (which define the necessary
        # attributes to use Google Cloud services) and `ServicePerimeters` (which
        # define regions of services able to freely pass data within a perimeter). An
        # access policy is globally visible within an organization, and the
        # restrictions it specifies apply to all projects within an organization.
        # @!attribute [rw] name
        #   @return [::String]
        #     Output only. Resource name of the `AccessPolicy`. Format:
        #     `accessPolicies/{policy_id}`
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The parent of this `AccessPolicy` in the Cloud Resource
        #     Hierarchy. Currently immutable once created. Format:
        #     `organizations/{organization_id}`
        # @!attribute [rw] title
        #   @return [::String]
        #     Required. Human readable title. Does not affect behavior.
        # @!attribute [rw] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Time the `AccessPolicy` was created in UTC.
        # @!attribute [rw] update_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Time the `AccessPolicy` was updated in UTC.
        # @!attribute [rw] etag
        #   @return [::String]
        #     Output only. An opaque identifier for the current version of the
        #     `AccessPolicy`. This will always be a strongly validated etag, meaning that
        #     two Access Polices will be identical if and only if their etags are
        #     identical. Clients should not expect this to be in any specific format.
        class AccessPolicy
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end
