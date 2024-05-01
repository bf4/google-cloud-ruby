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
        # An instance of a machine learning PipelineJob.
        # @!attribute [r] name
        #   @return [::String]
        #     Output only. The resource name of the PipelineJob.
        # @!attribute [rw] display_name
        #   @return [::String]
        #     The display name of the Pipeline.
        #     The name can be up to 128 characters long and can consist of any UTF-8
        #     characters.
        # @!attribute [r] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Pipeline creation time.
        # @!attribute [r] start_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Pipeline start time.
        # @!attribute [r] end_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Pipeline end time.
        # @!attribute [r] update_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Timestamp when this PipelineJob was most recently updated.
        # @!attribute [rw] pipeline_spec
        #   @return [::Google::Protobuf::Struct]
        #     The spec of the pipeline.
        # @!attribute [r] state
        #   @return [::Google::Cloud::AIPlatform::V1::PipelineState]
        #     Output only. The detailed state of the job.
        # @!attribute [r] job_detail
        #   @return [::Google::Cloud::AIPlatform::V1::PipelineJobDetail]
        #     Output only. The details of pipeline run. Not available in the list view.
        # @!attribute [r] error
        #   @return [::Google::Rpc::Status]
        #     Output only. The error that occurred during pipeline execution.
        #     Only populated when the pipeline's state is FAILED or CANCELLED.
        # @!attribute [rw] labels
        #   @return [::Google::Protobuf::Map{::String => ::String}]
        #     The labels with user-defined metadata to organize PipelineJob.
        #
        #     Label keys and values can be no longer than 64 characters
        #     (Unicode codepoints), can only contain lowercase letters, numeric
        #     characters, underscores and dashes. International characters are allowed.
        #
        #     See https://goo.gl/xmQnxf for more information and examples of labels.
        #
        #     Note there is some reserved label key for Vertex AI Pipelines.
        #     - `vertex-ai-pipelines-run-billing-id`, user set value will get overrided.
        # @!attribute [rw] runtime_config
        #   @return [::Google::Cloud::AIPlatform::V1::PipelineJob::RuntimeConfig]
        #     Runtime config of the pipeline.
        # @!attribute [rw] encryption_spec
        #   @return [::Google::Cloud::AIPlatform::V1::EncryptionSpec]
        #     Customer-managed encryption key spec for a pipelineJob. If set, this
        #     PipelineJob and all of its sub-resources will be secured by this key.
        # @!attribute [rw] service_account
        #   @return [::String]
        #     The service account that the pipeline workload runs as.
        #     If not specified, the Compute Engine default service account in the project
        #     will be used.
        #     See
        #     https://cloud.google.com/compute/docs/access/service-accounts#default_service_account
        #
        #     Users starting the pipeline must have the `iam.serviceAccounts.actAs`
        #     permission on this service account.
        # @!attribute [rw] network
        #   @return [::String]
        #     The full name of the Compute Engine
        #     [network](/compute/docs/networks-and-firewalls#networks) to which the
        #     Pipeline Job's workload should be peered. For example,
        #     `projects/12345/global/networks/myVPC`.
        #     [Format](/compute/docs/reference/rest/v1/networks/insert)
        #     is of the form `projects/{project}/global/networks/{network}`.
        #     Where \\{project} is a project number, as in `12345`, and \\{network} is a
        #     network name.
        #
        #     Private services access must already be configured for the network.
        #     Pipeline job will apply the network configuration to the Google Cloud
        #     resources being launched, if applied, such as Vertex AI
        #     Training or Dataflow job. If left unspecified, the workload is not peered
        #     with any network.
        # @!attribute [rw] reserved_ip_ranges
        #   @return [::Array<::String>]
        #     A list of names for the reserved ip ranges under the VPC network
        #     that can be used for this Pipeline Job's workload.
        #
        #     If set, we will deploy the Pipeline Job's workload within the provided ip
        #     ranges. Otherwise, the job will be deployed to any ip ranges under the
        #     provided VPC network.
        #
        #     Example: ['vertex-ai-ip-range'].
        # @!attribute [rw] template_uri
        #   @return [::String]
        #     A template uri from where the
        #     {::Google::Cloud::AIPlatform::V1::PipelineJob#pipeline_spec PipelineJob.pipeline_spec},
        #     if empty, will be downloaded. Currently, only uri from Vertex Template
        #     Registry & Gallery is supported. Reference to
        #     https://cloud.google.com/vertex-ai/docs/pipelines/create-pipeline-template.
        # @!attribute [r] template_metadata
        #   @return [::Google::Cloud::AIPlatform::V1::PipelineTemplateMetadata]
        #     Output only. Pipeline template metadata. Will fill up fields if
        #     {::Google::Cloud::AIPlatform::V1::PipelineJob#template_uri PipelineJob.template_uri}
        #     is from supported template registry.
        # @!attribute [r] schedule_name
        #   @return [::String]
        #     Output only. The schedule resource name.
        #     Only returned if the Pipeline is created by Schedule API.
        class PipelineJob
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # The runtime config of a PipelineJob.
          # @!attribute [rw] parameters
          #   @deprecated This field is deprecated and may be removed in the next major version update.
          #   @return [::Google::Protobuf::Map{::String => ::Google::Cloud::AIPlatform::V1::Value}]
          #     Deprecated. Use
          #     {::Google::Cloud::AIPlatform::V1::PipelineJob::RuntimeConfig#parameter_values RuntimeConfig.parameter_values}
          #     instead. The runtime parameters of the PipelineJob. The parameters will
          #     be passed into
          #     {::Google::Cloud::AIPlatform::V1::PipelineJob#pipeline_spec PipelineJob.pipeline_spec}
          #     to replace the placeholders at runtime. This field is used by pipelines
          #     built using `PipelineJob.pipeline_spec.schema_version` 2.0.0 or lower,
          #     such as pipelines built using Kubeflow Pipelines SDK 1.8 or lower.
          # @!attribute [rw] gcs_output_directory
          #   @return [::String]
          #     Required. A path in a Cloud Storage bucket, which will be treated as the
          #     root output directory of the pipeline. It is used by the system to
          #     generate the paths of output artifacts. The artifact paths are generated
          #     with a sub-path pattern `{job_id}/{task_id}/{output_key}` under the
          #     specified output directory. The service account specified in this
          #     pipeline must have the `storage.objects.get` and `storage.objects.create`
          #     permissions for this bucket.
          # @!attribute [rw] parameter_values
          #   @return [::Google::Protobuf::Map{::String => ::Google::Protobuf::Value}]
          #     The runtime parameters of the PipelineJob. The parameters will be
          #     passed into
          #     {::Google::Cloud::AIPlatform::V1::PipelineJob#pipeline_spec PipelineJob.pipeline_spec}
          #     to replace the placeholders at runtime. This field is used by pipelines
          #     built using `PipelineJob.pipeline_spec.schema_version` 2.1.0, such as
          #     pipelines built using Kubeflow Pipelines SDK 1.9 or higher and the v2
          #     DSL.
          # @!attribute [rw] failure_policy
          #   @return [::Google::Cloud::AIPlatform::V1::PipelineFailurePolicy]
          #     Represents the failure policy of a pipeline. Currently, the default of a
          #     pipeline is that the pipeline will continue to run until no more tasks
          #     can be executed, also known as PIPELINE_FAILURE_POLICY_FAIL_SLOW.
          #     However, if a pipeline is set to PIPELINE_FAILURE_POLICY_FAIL_FAST, it
          #     will stop scheduling any new tasks when a task has failed. Any scheduled
          #     tasks will continue to completion.
          # @!attribute [rw] input_artifacts
          #   @return [::Google::Protobuf::Map{::String => ::Google::Cloud::AIPlatform::V1::PipelineJob::RuntimeConfig::InputArtifact}]
          #     The runtime artifacts of the PipelineJob. The key will be the input
          #     artifact name and the value would be one of the InputArtifact.
          class RuntimeConfig
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # The type of an input artifact.
            # @!attribute [rw] artifact_id
            #   @return [::String]
            #     Artifact resource id from MLMD. Which is the last portion of an
            #     artifact resource name:
            #     `projects/{project}/locations/{location}/metadataStores/default/artifacts/{artifact_id}`.
            #     The artifact must stay within the same project, location and default
            #     metadatastore as the pipeline.
            class InputArtifact
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # @!attribute [rw] key
            #   @return [::String]
            # @!attribute [rw] value
            #   @return [::Google::Cloud::AIPlatform::V1::Value]
            class ParametersEntry
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # @!attribute [rw] key
            #   @return [::String]
            # @!attribute [rw] value
            #   @return [::Google::Protobuf::Value]
            class ParameterValuesEntry
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # @!attribute [rw] key
            #   @return [::String]
            # @!attribute [rw] value
            #   @return [::Google::Cloud::AIPlatform::V1::PipelineJob::RuntimeConfig::InputArtifact]
            class InputArtifactsEntry
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end
          end

          # @!attribute [rw] key
          #   @return [::String]
          # @!attribute [rw] value
          #   @return [::String]
          class LabelsEntry
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # Pipeline template metadata if
        # {::Google::Cloud::AIPlatform::V1::PipelineJob#template_uri PipelineJob.template_uri}
        # is from supported template registry. Currently, the only supported registry
        # is Artifact Registry.
        # @!attribute [rw] version
        #   @return [::String]
        #     The version_name in artifact registry.
        #
        #     Will always be presented in output if the
        #     {::Google::Cloud::AIPlatform::V1::PipelineJob#template_uri PipelineJob.template_uri}
        #     is from supported template registry.
        #
        #     Format is "sha256:abcdef123456...".
        class PipelineTemplateMetadata
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # The runtime detail of PipelineJob.
        # @!attribute [r] pipeline_context
        #   @return [::Google::Cloud::AIPlatform::V1::Context]
        #     Output only. The context of the pipeline.
        # @!attribute [r] pipeline_run_context
        #   @return [::Google::Cloud::AIPlatform::V1::Context]
        #     Output only. The context of the current pipeline run.
        # @!attribute [r] task_details
        #   @return [::Array<::Google::Cloud::AIPlatform::V1::PipelineTaskDetail>]
        #     Output only. The runtime details of the tasks under the pipeline.
        class PipelineJobDetail
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # The runtime detail of a task execution.
        # @!attribute [r] task_id
        #   @return [::Integer]
        #     Output only. The system generated ID of the task.
        # @!attribute [r] parent_task_id
        #   @return [::Integer]
        #     Output only. The id of the parent task if the task is within a component
        #     scope. Empty if the task is at the root level.
        # @!attribute [r] task_name
        #   @return [::String]
        #     Output only. The user specified name of the task that is defined in
        #     {::Google::Cloud::AIPlatform::V1::PipelineJob#pipeline_spec pipeline_spec}.
        # @!attribute [r] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Task create time.
        # @!attribute [r] start_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Task start time.
        # @!attribute [r] end_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Task end time.
        # @!attribute [r] executor_detail
        #   @return [::Google::Cloud::AIPlatform::V1::PipelineTaskExecutorDetail]
        #     Output only. The detailed execution info.
        # @!attribute [r] state
        #   @return [::Google::Cloud::AIPlatform::V1::PipelineTaskDetail::State]
        #     Output only. State of the task.
        # @!attribute [r] execution
        #   @return [::Google::Cloud::AIPlatform::V1::Execution]
        #     Output only. The execution metadata of the task.
        # @!attribute [r] error
        #   @return [::Google::Rpc::Status]
        #     Output only. The error that occurred during task execution.
        #     Only populated when the task's state is FAILED or CANCELLED.
        # @!attribute [r] pipeline_task_status
        #   @return [::Array<::Google::Cloud::AIPlatform::V1::PipelineTaskDetail::PipelineTaskStatus>]
        #     Output only. A list of task status. This field keeps a record of task
        #     status evolving over time.
        # @!attribute [r] inputs
        #   @return [::Google::Protobuf::Map{::String => ::Google::Cloud::AIPlatform::V1::PipelineTaskDetail::ArtifactList}]
        #     Output only. The runtime input artifacts of the task.
        # @!attribute [r] outputs
        #   @return [::Google::Protobuf::Map{::String => ::Google::Cloud::AIPlatform::V1::PipelineTaskDetail::ArtifactList}]
        #     Output only. The runtime output artifacts of the task.
        class PipelineTaskDetail
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # A single record of the task status.
          # @!attribute [r] update_time
          #   @return [::Google::Protobuf::Timestamp]
          #     Output only. Update time of this status.
          # @!attribute [r] state
          #   @return [::Google::Cloud::AIPlatform::V1::PipelineTaskDetail::State]
          #     Output only. The state of the task.
          # @!attribute [r] error
          #   @return [::Google::Rpc::Status]
          #     Output only. The error that occurred during the state. May be set when
          #     the state is any of the non-final state (PENDING/RUNNING/CANCELLING) or
          #     FAILED state. If the state is FAILED, the error here is final and not
          #     going to be retried. If the state is a non-final state, the error
          #     indicates a system-error being retried.
          class PipelineTaskStatus
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # A list of artifact metadata.
          # @!attribute [r] artifacts
          #   @return [::Array<::Google::Cloud::AIPlatform::V1::Artifact>]
          #     Output only. A list of artifact metadata.
          class ArtifactList
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # @!attribute [rw] key
          #   @return [::String]
          # @!attribute [rw] value
          #   @return [::Google::Cloud::AIPlatform::V1::PipelineTaskDetail::ArtifactList]
          class InputsEntry
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # @!attribute [rw] key
          #   @return [::String]
          # @!attribute [rw] value
          #   @return [::Google::Cloud::AIPlatform::V1::PipelineTaskDetail::ArtifactList]
          class OutputsEntry
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Specifies state of TaskExecution
          module State
            # Unspecified.
            STATE_UNSPECIFIED = 0

            # Specifies pending state for the task.
            PENDING = 1

            # Specifies task is being executed.
            RUNNING = 2

            # Specifies task completed successfully.
            SUCCEEDED = 3

            # Specifies Task cancel is in pending state.
            CANCEL_PENDING = 4

            # Specifies task is being cancelled.
            CANCELLING = 5

            # Specifies task was cancelled.
            CANCELLED = 6

            # Specifies task failed.
            FAILED = 7

            # Specifies task was skipped due to cache hit.
            SKIPPED = 8

            # Specifies that the task was not triggered because the task's trigger
            # policy is not satisfied. The trigger policy is specified in the
            # `condition` field of
            # {::Google::Cloud::AIPlatform::V1::PipelineJob#pipeline_spec PipelineJob.pipeline_spec}.
            NOT_TRIGGERED = 9
          end
        end

        # The runtime detail of a pipeline executor.
        # @!attribute [r] container_detail
        #   @return [::Google::Cloud::AIPlatform::V1::PipelineTaskExecutorDetail::ContainerDetail]
        #     Output only. The detailed info for a container executor.
        # @!attribute [r] custom_job_detail
        #   @return [::Google::Cloud::AIPlatform::V1::PipelineTaskExecutorDetail::CustomJobDetail]
        #     Output only. The detailed info for a custom job executor.
        class PipelineTaskExecutorDetail
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # The detail of a container execution. It contains the job names of the
          # lifecycle of a container execution.
          # @!attribute [r] main_job
          #   @return [::String]
          #     Output only. The name of the
          #     {::Google::Cloud::AIPlatform::V1::CustomJob CustomJob} for the main container
          #     execution.
          # @!attribute [r] pre_caching_check_job
          #   @return [::String]
          #     Output only. The name of the
          #     {::Google::Cloud::AIPlatform::V1::CustomJob CustomJob} for the
          #     pre-caching-check container execution. This job will be available if the
          #     {::Google::Cloud::AIPlatform::V1::PipelineJob#pipeline_spec PipelineJob.pipeline_spec}
          #     specifies the `pre_caching_check` hook in the lifecycle events.
          # @!attribute [r] failed_main_jobs
          #   @return [::Array<::String>]
          #     Output only. The names of the previously failed
          #     {::Google::Cloud::AIPlatform::V1::CustomJob CustomJob} for the main container
          #     executions. The list includes the all attempts in chronological order.
          # @!attribute [r] failed_pre_caching_check_jobs
          #   @return [::Array<::String>]
          #     Output only. The names of the previously failed
          #     {::Google::Cloud::AIPlatform::V1::CustomJob CustomJob} for the
          #     pre-caching-check container executions. This job will be available if the
          #     {::Google::Cloud::AIPlatform::V1::PipelineJob#pipeline_spec PipelineJob.pipeline_spec}
          #     specifies the `pre_caching_check` hook in the lifecycle events. The list
          #     includes the all attempts in chronological order.
          class ContainerDetail
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # The detailed info for a custom job executor.
          # @!attribute [r] job
          #   @return [::String]
          #     Output only. The name of the
          #     {::Google::Cloud::AIPlatform::V1::CustomJob CustomJob}.
          # @!attribute [r] failed_jobs
          #   @return [::Array<::String>]
          #     Output only. The names of the previously failed
          #     {::Google::Cloud::AIPlatform::V1::CustomJob CustomJob}. The list includes the
          #     all attempts in chronological order.
          class CustomJobDetail
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
