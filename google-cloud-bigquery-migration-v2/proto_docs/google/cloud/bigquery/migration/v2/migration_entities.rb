# frozen_string_literal: true

# Copyright 2022 Google LLC
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
    module Bigquery
      module Migration
        module V2
          # A migration workflow which specifies what needs to be done for an EDW
          # migration.
          # @!attribute [r] name
          #   @return [::String]
          #     Output only. Immutable. The unique identifier for the migration workflow.
          #     The ID is server-generated.
          #
          #     Example: `projects/123/locations/us/workflows/345`
          # @!attribute [rw] display_name
          #   @return [::String]
          #     The display name of the workflow. This can be set to give a workflow
          #     a descriptive name. There is no guarantee or enforcement of uniqueness.
          # @!attribute [rw] tasks
          #   @return [::Google::Protobuf::Map{::String => ::Google::Cloud::Bigquery::Migration::V2::MigrationTask}]
          #     The tasks in a workflow in a named map. The name (i.e. key) has no
          #     meaning and is merely a convenient way to address a specific task
          #     in a workflow.
          # @!attribute [r] state
          #   @return [::Google::Cloud::Bigquery::Migration::V2::MigrationWorkflow::State]
          #     Output only. That status of the workflow.
          # @!attribute [rw] create_time
          #   @return [::Google::Protobuf::Timestamp]
          #     Time when the workflow was created.
          # @!attribute [rw] last_update_time
          #   @return [::Google::Protobuf::Timestamp]
          #     Time when the workflow was last updated.
          class MigrationWorkflow
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # @!attribute [rw] key
            #   @return [::String]
            # @!attribute [rw] value
            #   @return [::Google::Cloud::Bigquery::Migration::V2::MigrationTask]
            class TasksEntry
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # Possible migration workflow states.
            module State
              # Workflow state is unspecified.
              STATE_UNSPECIFIED = 0

              # Workflow is in draft status, i.e. tasks are not yet eligible for
              # execution.
              DRAFT = 1

              # Workflow is running (i.e. tasks are eligible for execution).
              RUNNING = 2

              # Workflow is paused. Tasks currently in progress may continue, but no
              # further tasks will be scheduled.
              PAUSED = 3

              # Workflow is complete. There should not be any task in a non-terminal
              # state, but if they are (e.g. forced termination), they will not be
              # scheduled.
              COMPLETED = 4
            end
          end

          # A single task for a migration which has details about the configuration of
          # the task.
          # @!attribute [rw] translation_config_details
          #   @return [::Google::Cloud::Bigquery::Migration::V2::TranslationConfigDetails]
          #     Task configuration for Batch SQL Translation.
          # @!attribute [r] id
          #   @return [::String]
          #     Output only. Immutable. The unique identifier for the migration task. The
          #     ID is server-generated.
          # @!attribute [rw] type
          #   @return [::String]
          #     The type of the task. This must be one of the supported task types:
          #     Translation_Teradata2BQ, Translation_Redshift2BQ, Translation_Bteq2BQ,
          #     Translation_Oracle2BQ, Translation_HiveQL2BQ, Translation_SparkSQL2BQ,
          #     Translation_Snowflake2BQ, Translation_Netezza2BQ,
          #     Translation_AzureSynapse2BQ, Translation_Vertica2BQ,
          #     Translation_SQLServer2BQ, Translation_Presto2BQ, Translation_MySQL2BQ,
          #     Translation_Postgresql2BQ.
          # @!attribute [r] state
          #   @return [::Google::Cloud::Bigquery::Migration::V2::MigrationTask::State]
          #     Output only. The current state of the task.
          # @!attribute [r] processing_error
          #   @return [::Google::Rpc::ErrorInfo]
          #     Output only. An explanation that may be populated when the task is in
          #     FAILED state.
          # @!attribute [rw] create_time
          #   @return [::Google::Protobuf::Timestamp]
          #     Time when the task was created.
          # @!attribute [rw] last_update_time
          #   @return [::Google::Protobuf::Timestamp]
          #     Time when the task was last updated.
          class MigrationTask
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Possible states of a migration task.
            module State
              # The state is unspecified.
              STATE_UNSPECIFIED = 0

              # The task is waiting for orchestration.
              PENDING = 1

              # The task is assigned to an orchestrator.
              ORCHESTRATING = 2

              # The task is running, i.e. its subtasks are ready for execution.
              RUNNING = 3

              # Tha task is paused. Assigned subtasks can continue, but no new subtasks
              # will be scheduled.
              PAUSED = 4

              # The task finished successfully.
              SUCCEEDED = 5

              # The task finished unsuccessfully.
              FAILED = 6
            end
          end

          # A subtask for a migration which carries details about the configuration of
          # the subtask. The content of the details should not matter to the end user,
          # but is a contract between the subtask creator and subtask worker.
          # @!attribute [r] name
          #   @return [::String]
          #     Output only. Immutable. The resource name for the migration subtask. The ID
          #     is server-generated.
          #
          #     Example: `projects/123/locations/us/workflows/345/subtasks/678`
          # @!attribute [rw] task_id
          #   @return [::String]
          #     The unique ID of the task to which this subtask belongs.
          # @!attribute [rw] type
          #   @return [::String]
          #     The type of the Subtask. The migration service does not check whether this
          #     is a known type. It is up to the task creator (i.e. orchestrator or worker)
          #     to ensure it only creates subtasks for which there are compatible workers
          #     polling for Subtasks.
          # @!attribute [r] state
          #   @return [::Google::Cloud::Bigquery::Migration::V2::MigrationSubtask::State]
          #     Output only. The current state of the subtask.
          # @!attribute [r] processing_error
          #   @return [::Google::Rpc::ErrorInfo]
          #     Output only. An explanation that may be populated when the task is in
          #     FAILED state.
          # @!attribute [r] resource_error_details
          #   @return [::Array<::Google::Cloud::Bigquery::Migration::V2::ResourceErrorDetail>]
          #     Output only. Provides details to errors and issues encountered while
          #     processing the subtask. Presence of error details does not mean that the
          #     subtask failed.
          # @!attribute [rw] resource_error_count
          #   @return [::Integer]
          #     The number or resources with errors. Note: This is not the total
          #     number of errors as each resource can have more than one error.
          #     This is used to indicate truncation by having a `resource_error_count`
          #     that is higher than the size of `resource_error_details`.
          # @!attribute [rw] create_time
          #   @return [::Google::Protobuf::Timestamp]
          #     Time when the subtask was created.
          # @!attribute [rw] last_update_time
          #   @return [::Google::Protobuf::Timestamp]
          #     Time when the subtask was last updated.
          # @!attribute [rw] metrics
          #   @return [::Array<::Google::Cloud::Bigquery::Migration::V2::TimeSeries>]
          #     The metrics for the subtask.
          class MigrationSubtask
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Possible states of a migration subtask.
            module State
              # The state is unspecified.
              STATE_UNSPECIFIED = 0

              # The subtask is ready, i.e. it is ready for execution.
              ACTIVE = 1

              # The subtask is running, i.e. it is assigned to a worker for execution.
              RUNNING = 2

              # The subtask finished successfully.
              SUCCEEDED = 3

              # The subtask finished unsuccessfully.
              FAILED = 4

              # The subtask is paused, i.e., it will not be scheduled. If it was already
              # assigned,it might still finish but no new lease renewals will be granted.
              PAUSED = 5

              # The subtask is pending a dependency. It will be scheduled once its
              # dependencies are done.
              PENDING_DEPENDENCY = 6
            end
          end
        end
      end
    end
  end
end
