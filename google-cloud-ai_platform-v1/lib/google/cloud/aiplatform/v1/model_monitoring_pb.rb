# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/aiplatform/v1/model_monitoring.proto

require 'google/protobuf'

require 'google/api/resource_pb'
require 'google/cloud/aiplatform/v1/io_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/aiplatform/v1/model_monitoring.proto", :syntax => :proto3) do
    add_message "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig" do
      optional :training_dataset, :message, 1, "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.TrainingDataset"
      optional :training_prediction_skew_detection_config, :message, 2, "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.TrainingPredictionSkewDetectionConfig"
      optional :prediction_drift_detection_config, :message, 3, "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.PredictionDriftDetectionConfig"
      optional :explanation_config, :message, 5, "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.ExplanationConfig"
    end
    add_message "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.TrainingDataset" do
      optional :data_format, :string, 2
      optional :target_field, :string, 6
      optional :logging_sampling_strategy, :message, 7, "google.cloud.aiplatform.v1.SamplingStrategy"
      oneof :data_source do
        optional :dataset, :string, 3
        optional :gcs_source, :message, 4, "google.cloud.aiplatform.v1.GcsSource"
        optional :bigquery_source, :message, 5, "google.cloud.aiplatform.v1.BigQuerySource"
      end
    end
    add_message "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.TrainingPredictionSkewDetectionConfig" do
      map :skew_thresholds, :string, :message, 1, "google.cloud.aiplatform.v1.ThresholdConfig"
      map :attribution_score_skew_thresholds, :string, :message, 2, "google.cloud.aiplatform.v1.ThresholdConfig"
    end
    add_message "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.PredictionDriftDetectionConfig" do
      map :drift_thresholds, :string, :message, 1, "google.cloud.aiplatform.v1.ThresholdConfig"
      map :attribution_score_drift_thresholds, :string, :message, 2, "google.cloud.aiplatform.v1.ThresholdConfig"
    end
    add_message "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.ExplanationConfig" do
      optional :enable_feature_attributes, :bool, 1
      optional :explanation_baseline, :message, 2, "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.ExplanationConfig.ExplanationBaseline"
    end
    add_message "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.ExplanationConfig.ExplanationBaseline" do
      optional :prediction_format, :enum, 1, "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.ExplanationConfig.ExplanationBaseline.PredictionFormat"
      oneof :destination do
        optional :gcs, :message, 2, "google.cloud.aiplatform.v1.GcsDestination"
        optional :bigquery, :message, 3, "google.cloud.aiplatform.v1.BigQueryDestination"
      end
    end
    add_enum "google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.ExplanationConfig.ExplanationBaseline.PredictionFormat" do
      value :PREDICTION_FORMAT_UNSPECIFIED, 0
      value :JSONL, 2
      value :BIGQUERY, 3
    end
    add_message "google.cloud.aiplatform.v1.ModelMonitoringAlertConfig" do
      optional :enable_logging, :bool, 2
      oneof :alert do
        optional :email_alert_config, :message, 1, "google.cloud.aiplatform.v1.ModelMonitoringAlertConfig.EmailAlertConfig"
      end
    end
    add_message "google.cloud.aiplatform.v1.ModelMonitoringAlertConfig.EmailAlertConfig" do
      repeated :user_emails, :string, 1
    end
    add_message "google.cloud.aiplatform.v1.ThresholdConfig" do
      oneof :threshold do
        optional :value, :double, 1
      end
    end
    add_message "google.cloud.aiplatform.v1.SamplingStrategy" do
      optional :random_sample_config, :message, 1, "google.cloud.aiplatform.v1.SamplingStrategy.RandomSampleConfig"
    end
    add_message "google.cloud.aiplatform.v1.SamplingStrategy.RandomSampleConfig" do
      optional :sample_rate, :double, 1
    end
  end
end

module Google
  module Cloud
    module AIPlatform
      module V1
        ModelMonitoringObjectiveConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig").msgclass
        ModelMonitoringObjectiveConfig::TrainingDataset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.TrainingDataset").msgclass
        ModelMonitoringObjectiveConfig::TrainingPredictionSkewDetectionConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.TrainingPredictionSkewDetectionConfig").msgclass
        ModelMonitoringObjectiveConfig::PredictionDriftDetectionConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.PredictionDriftDetectionConfig").msgclass
        ModelMonitoringObjectiveConfig::ExplanationConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.ExplanationConfig").msgclass
        ModelMonitoringObjectiveConfig::ExplanationConfig::ExplanationBaseline = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.ExplanationConfig.ExplanationBaseline").msgclass
        ModelMonitoringObjectiveConfig::ExplanationConfig::ExplanationBaseline::PredictionFormat = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ModelMonitoringObjectiveConfig.ExplanationConfig.ExplanationBaseline.PredictionFormat").enummodule
        ModelMonitoringAlertConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ModelMonitoringAlertConfig").msgclass
        ModelMonitoringAlertConfig::EmailAlertConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ModelMonitoringAlertConfig.EmailAlertConfig").msgclass
        ThresholdConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ThresholdConfig").msgclass
        SamplingStrategy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.SamplingStrategy").msgclass
        SamplingStrategy::RandomSampleConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.SamplingStrategy.RandomSampleConfig").msgclass
      end
    end
  end
end
