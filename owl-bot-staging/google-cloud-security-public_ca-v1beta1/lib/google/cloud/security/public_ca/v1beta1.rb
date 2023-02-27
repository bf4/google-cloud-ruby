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

require "google/cloud/security/public_ca/v1beta1/public_certificate_authority_service"
require "google/cloud/security/public_ca/v1beta1/version"

module Google
  module Cloud
    module Security
      module PublicCA
        ##
        # API client module.
        #
        # @example Load this package, including all its services, and instantiate a gRPC client
        #
        #     require "google/cloud/security/public_ca/v1beta1"
        #     client = ::Google::Cloud::Security::PublicCA::V1beta1::PublicCertificateAuthorityService::Client.new
        #
        module V1beta1
        end
      end
    end
  end
end

helper_path = ::File.join __dir__, "v1beta1", "_helpers.rb"
require "google/cloud/security/public_ca/v1beta1/_helpers" if ::File.file? helper_path
