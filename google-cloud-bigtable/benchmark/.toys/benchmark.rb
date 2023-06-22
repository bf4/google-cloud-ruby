# frozen_string_literal: true

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

desc "Run performance benchmarking"

flag :instance_id, "--instance_id=INSTANCE_ID" do |f|
  f.default "temp-diptanshu"
  f.accept String
  f.desc "Instance id of the bigtable"
end
flag :table_name, "--table_name=TABLE_NAME" do |f|
  f.default "test-1"
  f.accept String
  f.desc "Bigtable name"
end
flag :qps, "--qps=QPS" do |f|
  f.default 0.1
  f.accept Float
  f.desc "Query per second"
end

include :terminal, styled: true
include :bundler
include :fileutils

def run

  require "google/cloud/bigtable"
  require "securerandom"
  require "csv"
  require "concurrent"
  require "google/cloud/bigquery"

  # Create a bigtable client to run the benchmarking
  bigtable = Google::Cloud::Bigtable.new
  table = bigtable.table instance_id, table_name, perform_lookup: true

  @bigtable_reader = Concurrent::ThreadPoolExecutor.new max_threads: 5, max_queue: 0
  @bigquery_uploader = Concurrent::ThreadPoolExecutor.new max_threads: 5, max_queue: 0
  @mutex = Mutex.new

  read_row_benchmark table
end

def read_row_benchmark table
  table_name = "biguery-benchmarking-read-row"
  if ENV["GOOGLE_CLOUD_BIGTABLE_BENCHMARKING"] == "dev"
    table_name += "-dev"
  end
  bq_table = reset_bigquery_table table_name
  iter = 1
  @start_time = Time.now
  loop do
    Concurrent::Promises.future_on @bigtable_reader, iter do |iter|
      begin
        start_time = Time.now
        table.read_row SecureRandom.hex(4).to_s
        end_time = Time.now
        data = {
          "RequestNumber" => iter,
          "RPC" => "read_row",
          "StartTime" => ((start_time - @start_time)/60),
          "EndTime" => ((end_time - @start_time)/60),
          "ElapsedTime" => ((end_time - start_time) * 1000).round(3)
        }
        upload_to_bigquery bq_table, data
      rescue StandardError => e
        puts e
      end
    end
    iter += 1
    sleep 1 / qps
  end
  puts "Successfully ran read_row benchmarking. Please find your output log at #{csv_file}", :bold, :cyan
end

def upload_to_bigquery table, data
  Concurrent::Promises.future_on @bigquery_uploader, table, data do |table, data|
    @mutex.synchronize do
      begin
        table.reload!
        table.insert data
      rescue StandardError => e
        puts "Upload failed : #{e}"
        sleep 10
        retry
      end
    end
  end
end

def reset_bigquery_table table_name
  bigquery = Google::Cloud::Bigquery.new project_id: "diptanshu-lex"
  dataset = bigquery.dataset "Benchmarking_logs"
  table = dataset.table table_name
  table&.delete
  table = dataset.create_table table_name do |t|
    t.schema do |s|
      s.integer "RequestNumber"
      s.string "RPC"
      s.float "StartTime"
      s.float "EndTime"
      s.float "ElapsedTime"
    end
  end
  return table if table.exists?
  puts "not able to reset the table"
  exit
end


def output_to_csv csv_file, result
  Concurrent::Promises.future_on @csv_writer, csv_file, result do |csv_file, result|
    @mutex.synchronize do
      CSV.open csv_file, "ab" do |csv|
        csv << result
      end
    end
  end
end
