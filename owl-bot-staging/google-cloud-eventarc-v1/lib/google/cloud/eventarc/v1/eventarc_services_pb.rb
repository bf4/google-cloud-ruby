# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/eventarc/v1/eventarc.proto for package 'Google.Cloud.Eventarc.V1'
# Original file comments:
# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'grpc'
require 'google/cloud/eventarc/v1/eventarc_pb'

module Google
  module Cloud
    module Eventarc
      module V1
        module Eventarc
          # Eventarc allows users to subscribe to various events that are provided by
          # Google Cloud services and forward them to supported destinations.
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.cloud.eventarc.v1.Eventarc'

            # Get a single trigger.
            rpc :GetTrigger, ::Google::Cloud::Eventarc::V1::GetTriggerRequest, ::Google::Cloud::Eventarc::V1::Trigger
            # List triggers.
            rpc :ListTriggers, ::Google::Cloud::Eventarc::V1::ListTriggersRequest, ::Google::Cloud::Eventarc::V1::ListTriggersResponse
            # Create a new trigger in a particular project and location.
            rpc :CreateTrigger, ::Google::Cloud::Eventarc::V1::CreateTriggerRequest, ::Google::Longrunning::Operation
            # Update a single trigger.
            rpc :UpdateTrigger, ::Google::Cloud::Eventarc::V1::UpdateTriggerRequest, ::Google::Longrunning::Operation
            # Delete a single trigger.
            rpc :DeleteTrigger, ::Google::Cloud::Eventarc::V1::DeleteTriggerRequest, ::Google::Longrunning::Operation
            # Get a single Channel.
            rpc :GetChannel, ::Google::Cloud::Eventarc::V1::GetChannelRequest, ::Google::Cloud::Eventarc::V1::Channel
            # List channels.
            rpc :ListChannels, ::Google::Cloud::Eventarc::V1::ListChannelsRequest, ::Google::Cloud::Eventarc::V1::ListChannelsResponse
            # Create a new channel in a particular project and location.
            rpc :CreateChannel, ::Google::Cloud::Eventarc::V1::CreateChannelRequest, ::Google::Longrunning::Operation
            # Update a single channel.
            rpc :UpdateChannel, ::Google::Cloud::Eventarc::V1::UpdateChannelRequest, ::Google::Longrunning::Operation
            # Delete a single channel.
            rpc :DeleteChannel, ::Google::Cloud::Eventarc::V1::DeleteChannelRequest, ::Google::Longrunning::Operation
            # Get a single ChannelConnection.
            rpc :GetChannelConnection, ::Google::Cloud::Eventarc::V1::GetChannelConnectionRequest, ::Google::Cloud::Eventarc::V1::ChannelConnection
            # List channel connections.
            rpc :ListChannelConnections, ::Google::Cloud::Eventarc::V1::ListChannelConnectionsRequest, ::Google::Cloud::Eventarc::V1::ListChannelConnectionsResponse
            # Create a new ChannelConnection in a particular project and location.
            rpc :CreateChannelConnection, ::Google::Cloud::Eventarc::V1::CreateChannelConnectionRequest, ::Google::Longrunning::Operation
            # Delete a single ChannelConnection.
            rpc :DeleteChannelConnection, ::Google::Cloud::Eventarc::V1::DeleteChannelConnectionRequest, ::Google::Longrunning::Operation
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
