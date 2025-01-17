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
        # Represents a TuningJob that runs with Google owned models.
        # @!attribute [rw] base_model
        #   @return [::String]
        #     Model name for tuning, e.g., "gemini-1.0-pro-002".
        # @!attribute [rw] supervised_tuning_spec
        #   @return [::Google::Cloud::AIPlatform::V1::SupervisedTuningSpec]
        #     Tuning Spec for Supervised Fine Tuning.
        # @!attribute [r] name
        #   @return [::String]
        #     Output only. Identifier. Resource name of a TuningJob. Format:
        #     `projects/{project}/locations/{location}/tuningJobs/{tuning_job}`
        # @!attribute [rw] tuned_model_display_name
        #   @return [::String]
        #     Optional. The display name of the
        #     {::Google::Cloud::AIPlatform::V1::Model TunedModel}. The name can be up to
        #     128 characters long and can consist of any UTF-8 characters.
        # @!attribute [rw] description
        #   @return [::String]
        #     Optional. The description of the
        #     {::Google::Cloud::AIPlatform::V1::TuningJob TuningJob}.
        # @!attribute [r] state
        #   @return [::Google::Cloud::AIPlatform::V1::JobState]
        #     Output only. The detailed state of the job.
        # @!attribute [r] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Time when the
        #     {::Google::Cloud::AIPlatform::V1::TuningJob TuningJob} was created.
        # @!attribute [r] start_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Time when the
        #     {::Google::Cloud::AIPlatform::V1::TuningJob TuningJob} for the first time
        #     entered the `JOB_STATE_RUNNING` state.
        # @!attribute [r] end_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Time when the TuningJob entered any of the following
        #     {::Google::Cloud::AIPlatform::V1::JobState JobStates}: `JOB_STATE_SUCCEEDED`,
        #     `JOB_STATE_FAILED`, `JOB_STATE_CANCELLED`, `JOB_STATE_EXPIRED`.
        # @!attribute [r] update_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Time when the
        #     {::Google::Cloud::AIPlatform::V1::TuningJob TuningJob} was most recently
        #     updated.
        # @!attribute [r] error
        #   @return [::Google::Rpc::Status]
        #     Output only. Only populated when job's state is `JOB_STATE_FAILED` or
        #     `JOB_STATE_CANCELLED`.
        # @!attribute [rw] labels
        #   @return [::Google::Protobuf::Map{::String => ::String}]
        #     Optional. The labels with user-defined metadata to organize
        #     {::Google::Cloud::AIPlatform::V1::TuningJob TuningJob} and generated resources
        #     such as {::Google::Cloud::AIPlatform::V1::Model Model} and
        #     {::Google::Cloud::AIPlatform::V1::Endpoint Endpoint}.
        #
        #     Label keys and values can be no longer than 64 characters
        #     (Unicode codepoints), can only contain lowercase letters, numeric
        #     characters, underscores and dashes. International characters are allowed.
        #
        #     See https://goo.gl/xmQnxf for more information and examples of labels.
        # @!attribute [r] experiment
        #   @return [::String]
        #     Output only. The Experiment associated with this
        #     {::Google::Cloud::AIPlatform::V1::TuningJob TuningJob}.
        # @!attribute [r] tuned_model
        #   @return [::Google::Cloud::AIPlatform::V1::TunedModel]
        #     Output only. The tuned model resources assiociated with this
        #     {::Google::Cloud::AIPlatform::V1::TuningJob TuningJob}.
        # @!attribute [r] tuning_data_stats
        #   @return [::Google::Cloud::AIPlatform::V1::TuningDataStats]
        #     Output only. The tuning data statistics associated with this
        #     {::Google::Cloud::AIPlatform::V1::TuningJob TuningJob}.
        class TuningJob
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # @!attribute [rw] key
          #   @return [::String]
          # @!attribute [rw] value
          #   @return [::String]
          class LabelsEntry
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # The Model Registry Model and Online Prediction Endpoint assiociated with
        # this {::Google::Cloud::AIPlatform::V1::TuningJob TuningJob}.
        # @!attribute [r] model
        #   @return [::String]
        #     Output only. The resource name of the TunedModel. Format:
        #     `projects/{project}/locations/{location}/models/{model}`.
        # @!attribute [r] endpoint
        #   @return [::String]
        #     Output only. A resource name of an Endpoint. Format:
        #     `projects/{project}/locations/{location}/endpoints/{endpoint}`.
        class TunedModel
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Dataset distribution for Supervised Tuning.
        # @!attribute [r] sum
        #   @return [::Integer]
        #     Output only. Sum of a given population of values.
        # @!attribute [r] min
        #   @return [::Float]
        #     Output only. The minimum of the population values.
        # @!attribute [r] max
        #   @return [::Float]
        #     Output only. The maximum of the population values.
        # @!attribute [r] mean
        #   @return [::Float]
        #     Output only. The arithmetic mean of the values in the population.
        # @!attribute [r] median
        #   @return [::Float]
        #     Output only. The median of the values in the population.
        # @!attribute [r] p5
        #   @return [::Float]
        #     Output only. The 5th percentile of the values in the population.
        # @!attribute [r] p95
        #   @return [::Float]
        #     Output only. The 95th percentile of the values in the population.
        # @!attribute [r] buckets
        #   @return [::Array<::Google::Cloud::AIPlatform::V1::SupervisedTuningDatasetDistribution::DatasetBucket>]
        #     Output only. Defines the histogram bucket.
        class SupervisedTuningDatasetDistribution
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Dataset bucket used to create a histogram for the distribution given a
          # population of values.
          # @!attribute [r] count
          #   @return [::Float]
          #     Output only. Number of values in the bucket.
          # @!attribute [r] left
          #   @return [::Float]
          #     Output only. Left bound of the bucket.
          # @!attribute [r] right
          #   @return [::Float]
          #     Output only. Right bound of the bucket.
          class DatasetBucket
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # Tuning data statistics for Supervised Tuning.
        # @!attribute [r] tuning_dataset_example_count
        #   @return [::Integer]
        #     Output only. Number of examples in the tuning dataset.
        # @!attribute [r] total_tuning_character_count
        #   @return [::Integer]
        #     Output only. Number of tuning characters in the tuning dataset.
        # @!attribute [r] total_billable_character_count
        #   @return [::Integer]
        #     Output only. Number of billable characters in the tuning dataset.
        # @!attribute [r] tuning_step_count
        #   @return [::Integer]
        #     Output only. Number of tuning steps for this Tuning Job.
        # @!attribute [r] user_input_token_distribution
        #   @return [::Google::Cloud::AIPlatform::V1::SupervisedTuningDatasetDistribution]
        #     Output only. Dataset distributions for the user input tokens.
        # @!attribute [r] user_output_token_distribution
        #   @return [::Google::Cloud::AIPlatform::V1::SupervisedTuningDatasetDistribution]
        #     Output only. Dataset distributions for the user output tokens.
        # @!attribute [r] user_message_per_example_distribution
        #   @return [::Google::Cloud::AIPlatform::V1::SupervisedTuningDatasetDistribution]
        #     Output only. Dataset distributions for the messages per example.
        # @!attribute [r] user_dataset_examples
        #   @return [::Array<::Google::Cloud::AIPlatform::V1::Content>]
        #     Output only. Sample user messages in the training dataset uri.
        class SupervisedTuningDataStats
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # The tuning data statistic values for
        # {::Google::Cloud::AIPlatform::V1::TuningJob TuningJob}.
        # @!attribute [rw] supervised_tuning_data_stats
        #   @return [::Google::Cloud::AIPlatform::V1::SupervisedTuningDataStats]
        #     The SFT Tuning data stats.
        class TuningDataStats
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Hyperparameters for SFT.
        # @!attribute [rw] epoch_count
        #   @return [::Integer]
        #     Optional. Number of training epoches for this tuning job.
        # @!attribute [rw] learning_rate_multiplier
        #   @return [::Float]
        #     Optional. Learning rate multiplier for tuning.
        # @!attribute [rw] adapter_size
        #   @return [::Google::Cloud::AIPlatform::V1::SupervisedHyperParameters::AdapterSize]
        #     Optional. Adapter size for tuning.
        class SupervisedHyperParameters
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Supported adapter sizes for tuning.
          module AdapterSize
            # Adapter size is unspecified.
            ADAPTER_SIZE_UNSPECIFIED = 0

            # Adapter size 1.
            ADAPTER_SIZE_ONE = 1

            # Adapter size 4.
            ADAPTER_SIZE_FOUR = 2

            # Adapter size 8.
            ADAPTER_SIZE_EIGHT = 3

            # Adapter size 16.
            ADAPTER_SIZE_SIXTEEN = 4
          end
        end

        # Tuning Spec for Supervised Tuning.
        # @!attribute [rw] training_dataset_uri
        #   @return [::String]
        #     Required. Cloud Storage path to file containing training dataset for
        #     tuning.
        # @!attribute [rw] validation_dataset_uri
        #   @return [::String]
        #     Optional. Cloud Storage path to file containing validation dataset for
        #     tuning.
        # @!attribute [rw] hyper_parameters
        #   @return [::Google::Cloud::AIPlatform::V1::SupervisedHyperParameters]
        #     Optional. Hyperparameters for SFT.
        class SupervisedTuningSpec
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end
