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


  # Create a bigtable client to run the benchmarking
  bigtable = Google::Cloud::Bigtable.new
  table = bigtable.table instance_id, table_name, perform_lookup: true

  @csv_writer = Concurrent::ThreadPoolExecutor.new max_threads: 5, max_queue: 0
  @mutex = Mutex.new

  read_row_benchmark table
end

def read_row_benchmark table
  csv_file = if ENV["GOOGLE_CLOUD_BIGTABLE_BENCHMARKING"] == "dev"
               "bigtable_bechmarking_read_row_#{qps.to_s}_dev.csv"
             else
               "bigtable_bechmarking_read_row_#{qps.to_s}.csv"
             end
  output_to_csv csv_file, ["Request No.", "RPC call", "Start time(ms)", "End Time(ms)", "Elapsed time(ms)"]
  iter = 1
  loop do
    begin
      start_time = Time.now
      table.read_row SecureRandom.hex(4).to_s
      end_time = Time.now
      output_to_csv csv_file, [iter, "read_row", start_time.strftime('%s%L'), end_time.strftime('%s%L'), ((end_time - start_time) * 1000).round(3)]
    rescue StandardError => e
      puts e
    ensure
      iter += 1
      sleep 1 / qps
    end
  end
  puts "Successfully ran read_row benchmarking. Please find your output log at #{csv_file}", :bold, :cyan
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
