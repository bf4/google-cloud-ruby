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

# [START documentai_v1beta3_generated_DocumentService_GetDatasetSchema_sync]
require "google/cloud/document_ai/v1beta3"

##
# Snippet for the get_dataset_schema call in the DocumentService service
#
# This is an auto-generated example demonstrating basic usage of
# Google::Cloud::DocumentAI::V1beta3::DocumentService::Client#get_dataset_schema.
# It may require modification in order to execute successfully.
#
def get_dataset_schema
  # Create a client object. The client can be reused for multiple calls.
  client = Google::Cloud::DocumentAI::V1beta3::DocumentService::Client.new

  # Create a request. To set request fields, pass in keyword arguments.
  request = Google::Cloud::DocumentAI::V1beta3::GetDatasetSchemaRequest.new

  # Call the get_dataset_schema method.
  result = client.get_dataset_schema request

  # The returned object is of type Google::Cloud::DocumentAI::V1beta3::DatasetSchema.
  p result
end
# [END documentai_v1beta3_generated_DocumentService_GetDatasetSchema_sync]
