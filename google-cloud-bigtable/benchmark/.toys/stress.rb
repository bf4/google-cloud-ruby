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

desc "Run stress test"

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


include :terminal, styled: true
include :bundler
include :fileutils

def run
  require "google/cloud/bigtable"
  require "securerandom"
  require "concurrent"
  require 'csv'


  @table_count = 5

  tables = (1..@table_count).map do
    bigtable = Google::Cloud::Bigtable.new
    table = bigtable.table instance_id, table_name, perform_lookup: true
    table.read_row SecureRandom.hex(4).to_s
    table
  end

  puts "Starting stress testing"

  timings_individual_single_100 = []
  timings_individual_multiple_100 = []
  timings_individual_single_500 = []
  timings_individual_multiple_500 = []
  total_timings = []
  (1..100).each do |i|
    timing_individual_single_100, total_timing_single_100 = read_row_stress_test tables
    timing_individual_multiple_100, total_timing_multiple_100 = read_row_stress_test tables, spread_requests: true
    timing_individual_single_500, total_timing_single_500 = read_row_stress_test tables, threads: 500
    timing_individual_multiple_500, total_timing_multiple_500 = read_row_stress_test tables, threads: 500, spread_requests: true
    timings_individual_single_100 << timing_individual_single_100
    timings_individual_multiple_100 << timing_individual_multiple_100
    timings_individual_single_500 << timing_individual_single_500
    timings_individual_multiple_500 << timing_individual_multiple_500
    total_timings << [total_timing_single_100, total_timing_multiple_100, total_timing_single_500, total_timing_multiple_500]
  end

  t = Time.now.to_s

  CSV.open "#{t}_100_single.csv", "w" do |csv|
    timings_individual_single_100.transpose.each do |arr|
      csv << arr
    end
  end

  CSV.open "#{t}_100_multiple.csv", "w" do |csv|
    timings_individual_multiple_100.transpose.each do |arr|
      csv << arr
    end
  end

  CSV.open "#{t}_500_single.csv", "w" do |csv|
    timings_individual_single_500.transpose.each do |arr|
      csv << arr
    end
  end

  CSV.open "#{t}_500_multiple.csv", "w" do |csv|
    timings_individual_multiple_500.transpose.each do |arr|
      csv << arr
    end
  end

  CSV.open "#{t}_total_timings.csv", "w" do |csv|
    total_timings.each do |arr|
      csv << arr
    end
  end

end

def read_row_stress_test tables, threads: 100, spread_requests: false
  requests = 5000
  array_timings = Array.new requests - 1
  bigtable_reader = Concurrent::ThreadPoolExecutor.new max_threads: threads, max_queue: 0
  futures = []
  @start_time = Time.now
  (1..requests).each do |i|
    future = Concurrent::Promises.future_on bigtable_reader do
      table = if spread_requests
                tables[i % @table_count]
              else
                tables[0]
              end
      t = []
      t << Time.now.to_f
      table.read_row SecureRandom.hex(4).to_s
      t << Time.now.to_f
      array_timings[i - 1] = ((t[1] - t[0]) * 1000)
    end
    futures << future
  end
  futures.each do |future|
    future.wait!
  end
  @end_time = Time.now
  elapsed_time = @end_time - @start_time
  puts "Successfully ran stress test in #{@end_time - @start_time} with threads - #{threads} and spread_requests - #{spread_requests}"
  bigtable_reader.kill
  return array_timings, elapsed_time
end