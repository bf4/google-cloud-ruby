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

# [START securitycenter_v1p1beta1_generated_SecurityCenter_GetNotificationConfig_sync]
require "google/cloud/security_center/v1p1beta1"

##
# Snippet for the get_notification_config call in the SecurityCenter service
#
# This is an auto-generated example demonstrating basic usage of
# Google::Cloud::SecurityCenter::V1p1beta1::SecurityCenter::Client#get_notification_config.
# It may require modification in order to execute successfully.
#
def get_notification_config
  # Create a client object. The client can be reused for multiple calls.
  client = Google::Cloud::SecurityCenter::V1p1beta1::SecurityCenter::Client.new

  # Create a request. To set request fields, pass in keyword arguments.
  request = Google::Cloud::SecurityCenter::V1p1beta1::GetNotificationConfigRequest.new

  # Call the get_notification_config method.
  result = client.get_notification_config request

  # The returned object is of type Google::Cloud::SecurityCenter::V1p1beta1::NotificationConfig.
  p result
end
# [END securitycenter_v1p1beta1_generated_SecurityCenter_GetNotificationConfig_sync]
