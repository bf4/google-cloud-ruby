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

include :terminal, styled: true
include :bundler
include :fileutils

def run

  require "google/cloud/bigtable"
  require "csv"
  require "concurrent"

  # Create a bigtable client to run the benchmarking

  @csv_writer = Concurrent::ThreadPoolExecutor.new max_threads: 5, max_queue: 0
  @bigquery_uploader = Concurrent::ThreadPoolExecutor.new max_threads: 5, max_queue: 0
  @mutex = Mutex.new
  @csv_name = "biguery-benchmarking-read-row.csv"

  read_row_benchmark
end

def read_row_benchmark
  bigtable = Google::Cloud::Bigtable.new
  @start_time = Time.now
  table = bigtable.table "temp-diptanshu", "test-3", perform_lookup: true
  sleep 100
  table_1 = bigtable.table "temp-instance-1", "test-4", perform_lookup: true

  iter = 1
  loop do
    begin
      start_time = Time.now
      table.read_row SecureRandom.hex(4).to_s
      end_time = Time.now
      data = [
        iter,
        "read_row",
        ((start_time - @start_time) / 60),
        ((end_time - @start_time) / 60),
        ((end_time - start_time) * 1000).round(3)
      ]
      start_time = Time.now
      table_1.read_row SecureRandom.hex(4).to_s
      end_time = Time.now
      data << ((end_time - start_time) * 1000).round(3)
      output_to_csv data
      pp data
    rescue StandardError => e
      pp e
    ensure
      iter += 1
      sleep 10
    end
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
      s.bignumeric "StartTime"
      s.bignumeric "EndTime"
      s.float "ElapsedTime"
    end
  end
  return table if table.exists?
  puts "not able to reset the table"
  exit
end


def output_to_csv result
  Concurrent::Promises.future_on @csv_writer, result do |result|
    @mutex.synchronize do
      CSV.open "biguery-benchmarking-read-row.csv", "ab" do |csv|
        csv << result
      end
    end
  end
end
