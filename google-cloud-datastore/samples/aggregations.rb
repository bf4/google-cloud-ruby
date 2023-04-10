# Copyright 2020 Google LLC
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

require "google/cloud/datastore"

# [START datastore_count_aggregation_query_with_filters]
def count_aggregation_query_with_filters
  datastore = Google::Cloud::Datastore.new

  query = datastore.query("Task")
                   .where("done", "=", false)

  aggregate_query = query.aggregate_query
                         .add_count
  
  aggregate_query_result = datastore.run_aggregation_query aggregate_query

  # puts aggregate_query_result.get
end
# [END datastore_count_aggregation_query_with_filters]

# [START datastore_count_aggregation_query_with_limit]
def count_aggregation_query_with_limit
  datastore = Google::Cloud::Datastore.new

  query = datastore.query("Task")
                   .limit(5)

  aggregate_query = query.aggregate_query
                         .add_count
  
  aggregate_query_result = datastore.run_aggregation_query aggregate_query

  puts aggregate_query_result.get
end
# [END datastore_count_aggregation_query_with_limit]

# [START datastore_count_aggregation_query_with_order_by]
def datastore_count_aggregation_query_with_order_by
  datastore = Google::Cloud::Datastore.new

  query = datastore.query("Task")
                   .order("priority", :desc)

  aggregate_query = query.aggregate_query
                         .add_count
  
  aggregate_query_result = datastore.run_aggregation_query aggregate_query

  puts aggregate_query_result.get
end
# [END datastore_count_aggregation_query_with_order_by]

# [START datastore_count_aggregation_query_in_transaction]
def datastore_count_aggregation_query_in_transaction
  datastore = Google::Cloud::Datastore.new

  query = datastore.query("Task")
                   .where("done", "=", false)

  datastore.read_only_transaction do |tx|
    aggregate_query = query.aggregate_query
                           .add_count
    aggregate_query_result = datastore.run_aggregation aggregate_query
    puts aggregate_query_result.get
  end
end
# [END datastore_count_aggregation_query_in_transaction]
