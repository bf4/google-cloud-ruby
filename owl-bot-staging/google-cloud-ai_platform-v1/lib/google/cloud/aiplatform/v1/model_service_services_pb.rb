# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/aiplatform/v1/model_service.proto for package 'Google.Cloud.AIPlatform.V1'
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
require 'google/cloud/aiplatform/v1/model_service_pb'

module Google
  module Cloud
    module AIPlatform
      module V1
        module ModelService
          # A service for managing Vertex AI's machine learning Models.
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.cloud.aiplatform.v1.ModelService'

            # Uploads a Model artifact into Vertex AI.
            rpc :UploadModel, ::Google::Cloud::AIPlatform::V1::UploadModelRequest, ::Google::Longrunning::Operation
            # Gets a Model.
            rpc :GetModel, ::Google::Cloud::AIPlatform::V1::GetModelRequest, ::Google::Cloud::AIPlatform::V1::Model
            # Lists Models in a Location.
            rpc :ListModels, ::Google::Cloud::AIPlatform::V1::ListModelsRequest, ::Google::Cloud::AIPlatform::V1::ListModelsResponse
            # Lists versions of the specified model.
            rpc :ListModelVersions, ::Google::Cloud::AIPlatform::V1::ListModelVersionsRequest, ::Google::Cloud::AIPlatform::V1::ListModelVersionsResponse
            # Updates a Model.
            rpc :UpdateModel, ::Google::Cloud::AIPlatform::V1::UpdateModelRequest, ::Google::Cloud::AIPlatform::V1::Model
            # Incrementally update the dataset used for an examples model.
            rpc :UpdateExplanationDataset, ::Google::Cloud::AIPlatform::V1::UpdateExplanationDatasetRequest, ::Google::Longrunning::Operation
            # Deletes a Model.
            #
            # A model cannot be deleted if any
            # [Endpoint][google.cloud.aiplatform.v1.Endpoint] resource has a
            # [DeployedModel][google.cloud.aiplatform.v1.DeployedModel] based on the
            # model in its
            # [deployed_models][google.cloud.aiplatform.v1.Endpoint.deployed_models]
            # field.
            rpc :DeleteModel, ::Google::Cloud::AIPlatform::V1::DeleteModelRequest, ::Google::Longrunning::Operation
            # Deletes a Model version.
            #
            # Model version can only be deleted if there are no
            # [DeployedModels][google.cloud.aiplatform.v1.DeployedModel] created from it.
            # Deleting the only version in the Model is not allowed. Use
            # [DeleteModel][google.cloud.aiplatform.v1.ModelService.DeleteModel] for
            # deleting the Model instead.
            rpc :DeleteModelVersion, ::Google::Cloud::AIPlatform::V1::DeleteModelVersionRequest, ::Google::Longrunning::Operation
            # Merges a set of aliases for a Model version.
            rpc :MergeVersionAliases, ::Google::Cloud::AIPlatform::V1::MergeVersionAliasesRequest, ::Google::Cloud::AIPlatform::V1::Model
            # Exports a trained, exportable Model to a location specified by the
            # user. A Model is considered to be exportable if it has at least one
            # [supported export
            # format][google.cloud.aiplatform.v1.Model.supported_export_formats].
            rpc :ExportModel, ::Google::Cloud::AIPlatform::V1::ExportModelRequest, ::Google::Longrunning::Operation
            # Copies an already existing Vertex AI Model into the specified Location.
            # The source Model must exist in the same Project.
            # When copying custom Models, the users themselves are responsible for
            # [Model.metadata][google.cloud.aiplatform.v1.Model.metadata] content to be
            # region-agnostic, as well as making sure that any resources (e.g. files) it
            # depends on remain accessible.
            rpc :CopyModel, ::Google::Cloud::AIPlatform::V1::CopyModelRequest, ::Google::Longrunning::Operation
            # Imports an externally generated ModelEvaluation.
            rpc :ImportModelEvaluation, ::Google::Cloud::AIPlatform::V1::ImportModelEvaluationRequest, ::Google::Cloud::AIPlatform::V1::ModelEvaluation
            # Imports a list of externally generated ModelEvaluationSlice.
            rpc :BatchImportModelEvaluationSlices, ::Google::Cloud::AIPlatform::V1::BatchImportModelEvaluationSlicesRequest, ::Google::Cloud::AIPlatform::V1::BatchImportModelEvaluationSlicesResponse
            # Imports a list of externally generated EvaluatedAnnotations.
            rpc :BatchImportEvaluatedAnnotations, ::Google::Cloud::AIPlatform::V1::BatchImportEvaluatedAnnotationsRequest, ::Google::Cloud::AIPlatform::V1::BatchImportEvaluatedAnnotationsResponse
            # Gets a ModelEvaluation.
            rpc :GetModelEvaluation, ::Google::Cloud::AIPlatform::V1::GetModelEvaluationRequest, ::Google::Cloud::AIPlatform::V1::ModelEvaluation
            # Lists ModelEvaluations in a Model.
            rpc :ListModelEvaluations, ::Google::Cloud::AIPlatform::V1::ListModelEvaluationsRequest, ::Google::Cloud::AIPlatform::V1::ListModelEvaluationsResponse
            # Gets a ModelEvaluationSlice.
            rpc :GetModelEvaluationSlice, ::Google::Cloud::AIPlatform::V1::GetModelEvaluationSliceRequest, ::Google::Cloud::AIPlatform::V1::ModelEvaluationSlice
            # Lists ModelEvaluationSlices in a ModelEvaluation.
            rpc :ListModelEvaluationSlices, ::Google::Cloud::AIPlatform::V1::ListModelEvaluationSlicesRequest, ::Google::Cloud::AIPlatform::V1::ListModelEvaluationSlicesResponse
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
