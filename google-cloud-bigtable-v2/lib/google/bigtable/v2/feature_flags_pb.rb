# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/bigtable/v2/feature_flags.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/bigtable/v2/feature_flags.proto", :syntax => :proto3) do
    add_message "google.bigtable.v2.FeatureFlags" do
      optional :mutate_rows_rate_limit, :bool, 3
    end
  end
end

module Google
  module Cloud
    module Bigtable
      module V2
        FeatureFlags = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.bigtable.v2.FeatureFlags").msgclass
      end
    end
  end
end