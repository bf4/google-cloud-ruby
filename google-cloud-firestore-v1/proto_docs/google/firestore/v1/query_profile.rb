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
    module Firestore
      module V1
        # Plan for the query.
        # @!attribute [rw] plan_info
        #   @return [::Google::Protobuf::Struct]
        #     Planning phase information for the query. It will include:
        #
        #     {
        #       "indexes_used": [
        #         \\{"query_scope": "Collection", "properties": "(foo ASC, __name__ ASC)"},
        #         \\{"query_scope": "Collection", "properties": "(bar ASC, __name__ ASC)"}
        #       ]
        #     }
        class QueryPlan
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Planning and execution statistics for the query.
        # @!attribute [rw] query_plan
        #   @return [::Google::Cloud::Firestore::V1::QueryPlan]
        #     Plan for the query.
        # @!attribute [rw] query_stats
        #   @return [::Google::Protobuf::Struct]
        #     Aggregated statistics from the execution of the query.
        #
        #     This will only be present when the request specifies `PROFILE` mode.
        #     For example, a query will return the statistics including:
        #
        #     {
        #       "results_returned": "20",
        #       "documents_scanned": "20",
        #       "indexes_entries_scanned": "10050",
        #       "total_execution_time": "100.7 msecs"
        #     }
        class ResultSetStats
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # The mode in which the query request must be processed.
        module QueryMode
          # The default mode. Only the query results are returned.
          NORMAL = 0

          # This mode returns only the query plan, without any results or execution
          # statistics information.
          PLAN = 1

          # This mode returns both the query plan and the execution statistics along
          # with the results.
          PROFILE = 2
        end
      end
    end
  end
end
