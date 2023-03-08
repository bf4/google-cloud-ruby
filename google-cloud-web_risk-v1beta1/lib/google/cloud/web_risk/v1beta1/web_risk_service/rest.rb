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

require "gapic/rest"
require "gapic/config"
require "gapic/config/method"

require "google/cloud/web_risk/v1beta1/version"

require "google/cloud/web_risk/v1beta1/web_risk_service/credentials"
require "google/cloud/web_risk/v1beta1/web_risk_service/rest/client"

module Google
  module Cloud
    module WebRisk
      module V1beta1
        ##
        # Web Risk v1beta1 API defines an interface to detect malicious URLs on your
        # website and in client applications.
        #
        # To load this service and instantiate a REST client:
        #
        #     require "google/cloud/web_risk/v1beta1/web_risk_service/rest"
        #     client = ::Google::Cloud::WebRisk::V1beta1::WebRiskService::Rest::Client.new
        #
        module WebRiskService
          # Client for the REST transport
          module Rest
          end
        end
      end
    end
  end
end

helper_path = ::File.join __dir__, "rest", "helpers.rb"
require "google/cloud/web_risk/v1beta1/web_risk_service/rest/helpers" if ::File.file? helper_path