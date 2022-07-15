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
    module Dataplex
      module V1
        # The payload associated with Discovery data processing.
        # @!attribute [rw] message
        #   @return [::String]
        #     The log message.
        # @!attribute [rw] lake_id
        #   @return [::String]
        #     The id of the associated lake.
        # @!attribute [rw] zone_id
        #   @return [::String]
        #     The id of the associated zone.
        # @!attribute [rw] asset_id
        #   @return [::String]
        #     The id of the associated asset.
        # @!attribute [rw] data_location
        #   @return [::String]
        #     The data location associated with the event.
        # @!attribute [rw] type
        #   @return [::Google::Cloud::Dataplex::V1::DiscoveryEvent::EventType]
        #     The type of the event being logged.
        # @!attribute [rw] config
        #   @return [::Google::Cloud::Dataplex::V1::DiscoveryEvent::ConfigDetails]
        #     Details about discovery configuration in effect.
        # @!attribute [rw] entity
        #   @return [::Google::Cloud::Dataplex::V1::DiscoveryEvent::EntityDetails]
        #     Details about the entity associated with the event.
        # @!attribute [rw] partition
        #   @return [::Google::Cloud::Dataplex::V1::DiscoveryEvent::PartitionDetails]
        #     Details about the partition associated with the event.
        # @!attribute [rw] action
        #   @return [::Google::Cloud::Dataplex::V1::DiscoveryEvent::ActionDetails]
        #     Details about the action associated with the event.
        class DiscoveryEvent
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Details about configuration events.
          # @!attribute [rw] parameters
          #   @return [::Google::Protobuf::Map{::String => ::String}]
          #     A list of discovery configuration parameters in effect.
          #     The keys are the field paths within DiscoverySpec.
          #     Eg. includePatterns, excludePatterns, csvOptions.disableTypeInference,
          #     etc.
          class ConfigDetails
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # @!attribute [rw] key
            #   @return [::String]
            # @!attribute [rw] value
            #   @return [::String]
            class ParametersEntry
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end
          end

          # Details about the entity.
          # @!attribute [rw] entity
          #   @return [::String]
          #     The name of the entity resource.
          #     The name is the fully-qualified resource name.
          # @!attribute [rw] type
          #   @return [::Google::Cloud::Dataplex::V1::DiscoveryEvent::EntityType]
          #     The type of the entity resource.
          class EntityDetails
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Details about the partition.
          # @!attribute [rw] partition
          #   @return [::String]
          #     The name to the partition resource.
          #     The name is the fully-qualified resource name.
          # @!attribute [rw] entity
          #   @return [::String]
          #     The name to the containing entity resource.
          #     The name is the fully-qualified resource name.
          # @!attribute [rw] type
          #   @return [::Google::Cloud::Dataplex::V1::DiscoveryEvent::EntityType]
          #     The type of the containing entity resource.
          # @!attribute [rw] sampled_data_locations
          #   @return [::Array<::String>]
          #     The locations of the data items (e.g., a Cloud Storage objects) sampled
          #     for metadata inference.
          class PartitionDetails
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Details about the action.
          # @!attribute [rw] type
          #   @return [::String]
          #     The type of action.
          #     Eg. IncompatibleDataSchema, InvalidDataFormat
          class ActionDetails
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # The type of the event.
          module EventType
            # An unspecified event type.
            EVENT_TYPE_UNSPECIFIED = 0

            # An event representing discovery configuration in effect.
            CONFIG = 1

            # An event representing a metadata entity being created.
            ENTITY_CREATED = 2

            # An event representing a metadata entity being updated.
            ENTITY_UPDATED = 3

            # An event representing a metadata entity being deleted.
            ENTITY_DELETED = 4

            # An event representing a partition being created.
            PARTITION_CREATED = 5

            # An event representing a partition being updated.
            PARTITION_UPDATED = 6

            # An event representing a partition being deleted.
            PARTITION_DELETED = 7
          end

          # The type of the entity.
          module EntityType
            # An unspecified event type.
            ENTITY_TYPE_UNSPECIFIED = 0

            # Entities representing structured data.
            TABLE = 1

            # Entities representing unstructured data.
            FILESET = 2
          end
        end

        # The payload associated with Job logs that contains events describing jobs
        # that have run within a Lake.
        # @!attribute [rw] message
        #   @return [::String]
        #     The log message.
        # @!attribute [rw] job_id
        #   @return [::String]
        #     The unique id identifying the job.
        # @!attribute [rw] start_time
        #   @return [::Google::Protobuf::Timestamp]
        #     The time when the job started running.
        # @!attribute [rw] end_time
        #   @return [::Google::Protobuf::Timestamp]
        #     The time when the job ended running.
        # @!attribute [rw] state
        #   @return [::Google::Cloud::Dataplex::V1::JobEvent::State]
        #     The job state on completion.
        # @!attribute [rw] retries
        #   @return [::Integer]
        #     The number of retries.
        # @!attribute [rw] type
        #   @return [::Google::Cloud::Dataplex::V1::JobEvent::Type]
        #     The type of the job.
        # @!attribute [rw] service
        #   @return [::Google::Cloud::Dataplex::V1::JobEvent::Service]
        #     The service used to execute the job.
        # @!attribute [rw] service_job
        #   @return [::String]
        #     The reference to the job within the service.
        class JobEvent
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # The type of the job.
          module Type
            # Unspecified job type.
            TYPE_UNSPECIFIED = 0

            # Spark jobs.
            SPARK = 1

            # Notebook jobs.
            NOTEBOOK = 2
          end

          # The completion status of the job.
          module State
            # Unspecified job state.
            STATE_UNSPECIFIED = 0

            # Job successfully completed.
            SUCCEEDED = 1

            # Job was unsuccessful.
            FAILED = 2

            # Job was cancelled by the user.
            CANCELLED = 3

            # Job was cancelled or aborted via the service executing the job.
            ABORTED = 4
          end

          # The service used to execute the job.
          module Service
            # Unspecified service.
            SERVICE_UNSPECIFIED = 0

            # Cloud Dataproc.
            DATAPROC = 1
          end
        end

        # These messages contain information about sessions within an environment.
        # The monitored resource is 'Environment'.
        # @!attribute [rw] message
        #   @return [::String]
        #     The log message.
        # @!attribute [rw] user_id
        #   @return [::String]
        #     The information about the user that created the session.
        # @!attribute [rw] session_id
        #   @return [::String]
        #     Unique identifier for the session.
        # @!attribute [rw] type
        #   @return [::Google::Cloud::Dataplex::V1::SessionEvent::EventType]
        #     The type of the event.
        # @!attribute [rw] query
        #   @return [::Google::Cloud::Dataplex::V1::SessionEvent::QueryDetail]
        #     The execution details of the query.
        class SessionEvent
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Execution details of the query.
          # @!attribute [rw] query_id
          #   @return [::String]
          #     The unique Query id identifying the query.
          # @!attribute [rw] query_text
          #   @return [::String]
          #     The query text executed.
          # @!attribute [rw] engine
          #   @return [::Google::Cloud::Dataplex::V1::SessionEvent::QueryDetail::Engine]
          #     Query Execution engine.
          # @!attribute [rw] duration
          #   @return [::Google::Protobuf::Duration]
          #     Time taken for execution of the query.
          # @!attribute [rw] result_size_bytes
          #   @return [::Integer]
          #     The size of results the query produced.
          # @!attribute [rw] data_processed_bytes
          #   @return [::Integer]
          #     The data processed by the query.
          class QueryDetail
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Query Execution engine.
            module Engine
              # An unspecified Engine type.
              ENGINE_UNSPECIFIED = 0

              # Spark-sql engine is specified in Query.
              SPARK_SQL = 1

              # BigQuery engine is specified in Query.
              BIGQUERY = 2
            end
          end

          # The type of the event.
          module EventType
            # An unspecified event type.
            EVENT_TYPE_UNSPECIFIED = 0

            # Event for start of a session.
            START = 1

            # Event for stop of a session.
            STOP = 2

            # Query events in the session.
            QUERY = 3
          end
        end
      end
    end
  end
end
