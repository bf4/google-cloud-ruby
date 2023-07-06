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

  @mutex = Mutex.new
  @table_count = 10
  # tables = []

  tables = (1..@table_count).map do
    bigtable = Google::Cloud::Bigtable.new
    bigtable.table(instance_id, table_name, perform_lookup: true)
  end

  # puts `netstat -p | grep "#{$$.to_s}" | awk '{printf("%s ",$4)}'`

  array_1 = read_row_benchmark tables
  array_2 = read_row_benchmark tables, spread_requests: true
  # array_0 = read_row_benchmark tables, concurrent: false

  t = Time.now.to_s

  # $stdout.reopen("#{t}_sequential.txt","a")
  # array_0.each do |arr|
  #   puts "#{arr[2]}"
  # end

  $stdout.reopen("#{t}_concurrent_single.txt","a")
  array_1.each do |arr|
    puts "#{arr[2]}"
  end

  $stdout.reopen("#{t}_concurrent_multiple.txt","a")
  array_2.each do |arr|
    puts "#{arr[2]}"
  end

end

def read_row_benchmark tables, concurrent: true, spread_requests: false
  requests = 1000
  array_timings = Array.new(requests-1)

  threads = if concurrent
              4999
            else
              1
            end
  bigtable_reader = Concurrent::ThreadPoolExecutor.new max_threads: threads, max_queue: 0
  futures = []
  @start_time = Time.now
  (1..requests).each do |i|
    future = Concurrent::Promises.future_on bigtable_reader do
      if spread_requests
        table = tables[i%@table_count]
      else
        table = tables[0]
      end
      t = []
      t << Time.now.to_f
      table.read_row SecureRandom.hex(4).to_s
      t << Time.now.to_f
      t << (t[1] - t[0])*1000
      array_timings[i-1] = t
    end
    futures << future
  end
  futures.each do |future|
    future.wait!
  end
  @end_time = Time.now
  puts "Successfully ran stress test in #{@end_time - @start_time} with concurrent - #{concurrent} and spread_requests - #{spread_requests}"
  bigtable_reader.kill
  array_timings
end