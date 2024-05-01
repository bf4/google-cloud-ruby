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
        # A collection of metrics calculated by comparing Model's predictions on all of
        # the test data against annotations from the test data.
        # @!attribute [r] name
        #   @return [::String]
        #     Output only. The resource name of the ModelEvaluation.
        # @!attribute [rw] display_name
        #   @return [::String]
        #     The display name of the ModelEvaluation.
        # @!attribute [rw] metrics_schema_uri
        #   @return [::String]
        #     Points to a YAML file stored on Google Cloud Storage describing the
        #     {::Google::Cloud::AIPlatform::V1::ModelEvaluation#metrics metrics} of this
        #     ModelEvaluation. The schema is defined as an OpenAPI 3.0.2 [Schema
        #     Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject).
        # @!attribute [rw] metrics
        #   @return [::Google::Protobuf::Value]
        #     Evaluation metrics of the Model. The schema of the metrics is stored in
        #     {::Google::Cloud::AIPlatform::V1::ModelEvaluation#metrics_schema_uri metrics_schema_uri}
        # @!attribute [r] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Timestamp when this ModelEvaluation was created.
        # @!attribute [rw] slice_dimensions
        #   @return [::Array<::String>]
        #     All possible
        #     {::Google::Cloud::AIPlatform::V1::ModelEvaluationSlice::Slice#dimension dimensions}
        #     of ModelEvaluationSlices. The dimensions can be used as the filter of the
        #     {::Google::Cloud::AIPlatform::V1::ModelService::Client#list_model_evaluation_slices ModelService.ListModelEvaluationSlices}
        #     request, in the form of `slice.dimension = <dimension>`.
        # @!attribute [rw] data_item_schema_uri
        #   @return [::String]
        #     Points to a YAML file stored on Google Cloud Storage describing
        #     [EvaluatedDataItemView.data_item_payload][] and
        #     {::Google::Cloud::AIPlatform::V1::EvaluatedAnnotation#data_item_payload EvaluatedAnnotation.data_item_payload}.
        #     The schema is defined as an OpenAPI 3.0.2 [Schema
        #     Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject).
        #
        #     This field is not populated if there are neither EvaluatedDataItemViews nor
        #     EvaluatedAnnotations under this ModelEvaluation.
        # @!attribute [rw] annotation_schema_uri
        #   @return [::String]
        #     Points to a YAML file stored on Google Cloud Storage describing
        #     [EvaluatedDataItemView.predictions][],
        #     [EvaluatedDataItemView.ground_truths][],
        #     {::Google::Cloud::AIPlatform::V1::EvaluatedAnnotation#predictions EvaluatedAnnotation.predictions},
        #     and
        #     {::Google::Cloud::AIPlatform::V1::EvaluatedAnnotation#ground_truths EvaluatedAnnotation.ground_truths}.
        #     The schema is defined as an OpenAPI 3.0.2 [Schema
        #     Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject).
        #
        #     This field is not populated if there are neither EvaluatedDataItemViews nor
        #     EvaluatedAnnotations under this ModelEvaluation.
        # @!attribute [rw] model_explanation
        #   @return [::Google::Cloud::AIPlatform::V1::ModelExplanation]
        #     Aggregated explanation metrics for the Model's prediction output over the
        #     data this ModelEvaluation uses. This field is populated only if the Model
        #     is evaluated with explanations, and only for AutoML tabular Models.
        # @!attribute [rw] explanation_specs
        #   @return [::Array<::Google::Cloud::AIPlatform::V1::ModelEvaluation::ModelEvaluationExplanationSpec>]
        #     Describes the values of
        #     {::Google::Cloud::AIPlatform::V1::ExplanationSpec ExplanationSpec} that are used
        #     for explaining the predicted values on the evaluated data.
        # @!attribute [rw] metadata
        #   @return [::Google::Protobuf::Value]
        #     The metadata of the ModelEvaluation.
        #     For the ModelEvaluation uploaded from Managed Pipeline, metadata contains a
        #     structured value with keys of "pipeline_job_id", "evaluation_dataset_type",
        #     "evaluation_dataset_path", "row_based_metrics_path".
        class ModelEvaluation
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # @!attribute [rw] explanation_type
          #   @return [::String]
          #     Explanation type.
          #
          #     For AutoML Image Classification models, possible values are:
          #
          #       * `image-integrated-gradients`
          #       * `image-xrai`
          # @!attribute [rw] explanation_spec
          #   @return [::Google::Cloud::AIPlatform::V1::ExplanationSpec]
          #     Explanation spec details.
          class ModelEvaluationExplanationSpec
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
