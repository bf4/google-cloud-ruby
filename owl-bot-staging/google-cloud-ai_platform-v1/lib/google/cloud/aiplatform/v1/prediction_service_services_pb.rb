# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/aiplatform/v1/prediction_service.proto for package 'Google.Cloud.AIPlatform.V1'
# Original file comments:
# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'grpc'
require 'google/cloud/aiplatform/v1/prediction_service_pb'

module Google
  module Cloud
    module AIPlatform
      module V1
        module PredictionService
          # A service for online predictions and explanations.
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.cloud.aiplatform.v1.PredictionService'

            # Perform an online prediction.
            rpc :Predict, ::Google::Cloud::AIPlatform::V1::PredictRequest, ::Google::Cloud::AIPlatform::V1::PredictResponse
            # Perform an online prediction with an arbitrary HTTP payload.
            #
            # The response includes the following HTTP headers:
            #
            # * `X-Vertex-AI-Endpoint-Id`: ID of the
            # [Endpoint][google.cloud.aiplatform.v1.Endpoint] that served this
            # prediction.
            #
            # * `X-Vertex-AI-Deployed-Model-Id`: ID of the Endpoint's
            # [DeployedModel][google.cloud.aiplatform.v1.DeployedModel] that served this
            # prediction.
            rpc :RawPredict, ::Google::Cloud::AIPlatform::V1::RawPredictRequest, ::Google::Api::HttpBody
            # Perform a streaming online prediction with an arbitrary HTTP payload.
            rpc :StreamRawPredict, ::Google::Cloud::AIPlatform::V1::StreamRawPredictRequest, stream(::Google::Api::HttpBody)
            # Perform an unary online prediction request to a gRPC model server for
            # Vertex first-party products and frameworks.
            rpc :DirectPredict, ::Google::Cloud::AIPlatform::V1::DirectPredictRequest, ::Google::Cloud::AIPlatform::V1::DirectPredictResponse
            # Perform an unary online prediction request to a gRPC model server for
            # custom containers.
            rpc :DirectRawPredict, ::Google::Cloud::AIPlatform::V1::DirectRawPredictRequest, ::Google::Cloud::AIPlatform::V1::DirectRawPredictResponse
            # Perform a streaming online prediction request to a gRPC model server for
            # Vertex first-party products and frameworks.
            rpc :StreamDirectPredict, stream(::Google::Cloud::AIPlatform::V1::StreamDirectPredictRequest), stream(::Google::Cloud::AIPlatform::V1::StreamDirectPredictResponse)
            # Perform a streaming online prediction request to a gRPC model server for
            # custom containers.
            rpc :StreamDirectRawPredict, stream(::Google::Cloud::AIPlatform::V1::StreamDirectRawPredictRequest), stream(::Google::Cloud::AIPlatform::V1::StreamDirectRawPredictResponse)
            # Perform a streaming online prediction request for Vertex first-party
            # products and frameworks.
            rpc :StreamingPredict, stream(::Google::Cloud::AIPlatform::V1::StreamingPredictRequest), stream(::Google::Cloud::AIPlatform::V1::StreamingPredictResponse)
            # Perform a server-side streaming online prediction request for Vertex
            # LLM streaming.
            rpc :ServerStreamingPredict, ::Google::Cloud::AIPlatform::V1::StreamingPredictRequest, stream(::Google::Cloud::AIPlatform::V1::StreamingPredictResponse)
            # Perform a streaming online prediction request through gRPC.
            rpc :StreamingRawPredict, stream(::Google::Cloud::AIPlatform::V1::StreamingRawPredictRequest), stream(::Google::Cloud::AIPlatform::V1::StreamingRawPredictResponse)
            # Perform an online explanation.
            #
            # If
            # [deployed_model_id][google.cloud.aiplatform.v1.ExplainRequest.deployed_model_id]
            # is specified, the corresponding DeployModel must have
            # [explanation_spec][google.cloud.aiplatform.v1.DeployedModel.explanation_spec]
            # populated. If
            # [deployed_model_id][google.cloud.aiplatform.v1.ExplainRequest.deployed_model_id]
            # is not specified, all DeployedModels must have
            # [explanation_spec][google.cloud.aiplatform.v1.DeployedModel.explanation_spec]
            # populated.
            rpc :Explain, ::Google::Cloud::AIPlatform::V1::ExplainRequest, ::Google::Cloud::AIPlatform::V1::ExplainResponse
            # Generate content with multimodal inputs.
            rpc :GenerateContent, ::Google::Cloud::AIPlatform::V1::GenerateContentRequest, ::Google::Cloud::AIPlatform::V1::GenerateContentResponse
            # Generate content with multimodal inputs with streaming support.
            rpc :StreamGenerateContent, ::Google::Cloud::AIPlatform::V1::GenerateContentRequest, stream(::Google::Cloud::AIPlatform::V1::GenerateContentResponse)
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
