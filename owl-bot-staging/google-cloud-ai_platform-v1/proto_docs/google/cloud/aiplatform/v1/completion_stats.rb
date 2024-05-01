# frozen_string_literal: true

# Copyright 2024 Google LLC
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


module Google
  module Cloud
    module AIPlatform
      module V1
        # Success and error statistics of processing multiple entities
        # (for example, DataItems or structured data rows) in batch.
        # @!attribute [r] successful_count
        #   @return [::Integer]
        #     Output only. The number of entities that had been processed successfully.
        # @!attribute [r] failed_count
        #   @return [::Integer]
        #     Output only. The number of entities for which any error was encountered.
        # @!attribute [r] incomplete_count
        #   @return [::Integer]
        #     Output only. In cases when enough errors are encountered a job, pipeline,
        #     or operation may be failed as a whole. Below is the number of entities for
        #     which the processing had not been finished (either in successful or failed
        #     state). Set to -1 if the number is unknown (for example, the operation
        #     failed before the total entity number could be collected).
        # @!attribute [r] successful_forecast_point_count
        #   @return [::Integer]
        #     Output only. The number of the successful forecast points that are
        #     generated by the forecasting model. This is ONLY used by the forecasting
        #     batch prediction.
        class CompletionStats
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end
