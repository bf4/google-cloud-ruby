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

# [START securitycenter_v1p1beta1_generated_SecurityCenter_CreateSource_sync]
require "google/cloud/security_center/v1p1beta1"

##
# Snippet for the create_source call in the SecurityCenter service
#
# This is an auto-generated example demonstrating basic usage of
# Google::Cloud::SecurityCenter::V1p1beta1::SecurityCenter::Client#create_source.
# It may require modification in order to execute successfully.
#
def create_source
  # Create a client object. The client can be reused for multiple calls.
  client = Google::Cloud::SecurityCenter::V1p1beta1::SecurityCenter::Client.new

  # Create a request. To set request fields, pass in keyword arguments.
  request = Google::Cloud::SecurityCenter::V1p1beta1::CreateSourceRequest.new

  # Call the create_source method.
  result = client.create_source request

  # The returned object is of type Google::Cloud::SecurityCenter::V1p1beta1::Source.
  p result
end
# [END securitycenter_v1p1beta1_generated_SecurityCenter_CreateSource_sync]
