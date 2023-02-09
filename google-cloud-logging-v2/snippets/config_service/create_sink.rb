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

# [START logging_v2_generated_ConfigService_CreateSink_sync]
require "google/cloud/logging/v2"

##
# Snippet for the create_sink call in the ConfigService service
#
# This is an auto-generated example demonstrating basic usage of
# Google::Cloud::Logging::V2::ConfigService::Client#create_sink. It may require
# modification in order to execute successfully.
#
def create_sink
  # Create a client object. The client can be reused for multiple calls.
  client = Google::Cloud::Logging::V2::ConfigService::Client.new

  # Create a request. To set request fields, pass in keyword arguments.
  request = Google::Cloud::Logging::V2::CreateSinkRequest.new

  # Call the create_sink method.
  result = client.create_sink request

  # The returned object is of type Google::Cloud::Logging::V2::LogSink.
  p result
end
# [END logging_v2_generated_ConfigService_CreateSink_sync]
