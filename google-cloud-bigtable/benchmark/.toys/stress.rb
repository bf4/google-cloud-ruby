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
  require "concurrent"

  # Create a bigtable client to run the benchmarking
  bigtable = Google::Cloud::Bigtable.new
  table = bigtable.table instance_id, table_name, perform_lookup: true

  @bigtable_reader = Concurrent::ThreadPoolExecutor.new max_threads: 4000, max_queue: 0
  read_row_benchmark table
end

def read_row_benchmark table
  $stdout.reopen("#{SecureRandom.hex(4)}.txt","a")
  @start_time = Time.now
  futures = []
  (1..10).each do
    future = Concurrent::Promises.future_on @bigtable_reader do
      start_time = Time.now
      table.read_row SecureRandom.hex(4).to_s
      end_time = Time.now
      data = {
        "RPC" => "read_row",
        "StartTime" => ((start_time - @start_time)/60),
        "EndTime" => ((end_time - @start_time)/60),
        "ElapsedTime" => ((end_time - start_time) * 1000).round(3)
      }
      pp data["ElapsedTime"]
    end
    futures << future
  end
  futures.each do |future|
    future.wait!
  end
  puts "Successfully ran read_row stress", :bold, :cyan
end