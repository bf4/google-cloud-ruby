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
        module Schema
          module Predict
            module Params
              # Prediction model parameters for Video Action Recognition.
              # @!attribute [rw] confidence_threshold
              #   @return [::Float]
              #     The Model only returns predictions with at least this confidence score.
              #     Default value is 0.0
              # @!attribute [rw] max_predictions
              #   @return [::Integer]
              #     The model only returns up to that many top, by confidence score,
              #     predictions per frame of the video. If this number is very high, the
              #     Model may return fewer predictions per frame. Default value is 50.
              class VideoActionRecognitionPredictionParams
                include ::Google::Protobuf::MessageExts
                extend ::Google::Protobuf::MessageExts::ClassMethods
              end
            end
          end
        end
      end
    end
  end
end
