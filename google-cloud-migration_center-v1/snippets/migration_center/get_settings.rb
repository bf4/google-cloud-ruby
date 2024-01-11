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

# [START migrationcenter_v1_generated_MigrationCenter_GetSettings_sync]
require "google/cloud/migration_center/v1"

##
# Snippet for the get_settings call in the MigrationCenter service
#
# This snippet has been automatically generated and should be regarded as a code
# template only. It will require modifications to work:
# - It may require correct/in-range values for request initialization.
# - It may require specifying regional endpoints when creating the service
# client as shown in https://cloud.google.com/ruby/docs/reference.
#
# This is an auto-generated example demonstrating basic usage of
# Google::Cloud::MigrationCenter::V1::MigrationCenter::Client#get_settings.
#
def get_settings
  # Create a client object. The client can be reused for multiple calls.
  client = Google::Cloud::MigrationCenter::V1::MigrationCenter::Client.new

  # Create a request. To set request fields, pass in keyword arguments.
  request = Google::Cloud::MigrationCenter::V1::GetSettingsRequest.new

  # Call the get_settings method.
  result = client.get_settings request

  # The returned object is of type Google::Cloud::MigrationCenter::V1::Settings.
  p result
end
# [END migrationcenter_v1_generated_MigrationCenter_GetSettings_sync]
