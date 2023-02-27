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

# [START cloudresourcemanager_v3_generated_Projects_UndeleteProject_sync]
require "google/cloud/resource_manager/v3"

##
# Snippet for the undelete_project call in the Projects service
#
# This is an auto-generated example demonstrating basic usage of
# Google::Cloud::ResourceManager::V3::Projects::Client#undelete_project. It may
# require modification in order to execute successfully.
#
def undelete_project
  # Create a client object. The client can be reused for multiple calls.
  client = Google::Cloud::ResourceManager::V3::Projects::Client.new

  # Create a request. To set request fields, pass in keyword arguments.
  request = Google::Cloud::ResourceManager::V3::UndeleteProjectRequest.new

  # Call the undelete_project method.
  result = client.undelete_project request

  # The returned object is of type Gapic::Operation. You can use it to
  # check the status of an operation, cancel it, or wait for results.
  # Here is how to wait for a response.
  result.wait_until_done! timeout: 60
  if result.response?
    p result.response
  else
    puts "No response received."
  end
end
# [END cloudresourcemanager_v3_generated_Projects_UndeleteProject_sync]
