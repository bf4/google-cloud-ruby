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

# [START securitycenter_v1p1beta1_generated_SecurityCenter_GroupAssets_sync]
require "google/cloud/security_center/v1p1beta1"

##
# Snippet for the group_assets call in the SecurityCenter service
#
# This is an auto-generated example demonstrating basic usage of
# Google::Cloud::SecurityCenter::V1p1beta1::SecurityCenter::Client#group_assets.
# It may require modification in order to execute successfully.
#
def group_assets
  # Create a client object. The client can be reused for multiple calls.
  client = Google::Cloud::SecurityCenter::V1p1beta1::SecurityCenter::Client.new

  # Create a request. To set request fields, pass in keyword arguments.
  request = Google::Cloud::SecurityCenter::V1p1beta1::GroupAssetsRequest.new

  # Call the group_assets method.
  result = client.group_assets request

  # The returned object is of type Gapic::PagedEnumerable. You can iterate
  # over elements, and API calls will be issued to fetch pages as needed.
  result.each do |item|
    # Each element is of type ::Google::Cloud::SecurityCenter::V1p1beta1::GroupResult.
    p item
  end
end
# [END securitycenter_v1p1beta1_generated_SecurityCenter_GroupAssets_sync]
