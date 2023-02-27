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
      module V1
        # Response of asset discovery run
        # @!attribute [rw] state
        #   @return [::Google::Cloud::SecurityCenter::V1::RunAssetDiscoveryResponse::State]
        #     The state of an asset discovery run.
        # @!attribute [rw] duration
        #   @return [::Google::Protobuf::Duration]
        #     The duration between asset discovery run start and end
        class RunAssetDiscoveryResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # The state of an asset discovery run.
          module State
            # Asset discovery run state was unspecified.
            STATE_UNSPECIFIED = 0

            # Asset discovery run completed successfully.
            COMPLETED = 1

            # Asset discovery run was cancelled with tasks still pending, as another
            # run for the same organization was started with a higher priority.
            SUPERSEDED = 2

            # Asset discovery run was killed and terminated.
            TERMINATED = 3
          end
        end
      end
    end
  end
end
