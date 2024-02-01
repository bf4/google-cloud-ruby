# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/websecurityscanner/v1beta/scan_run_warning_trace.proto

require 'google/protobuf'


descriptor_data = "\nCgoogle/cloud/websecurityscanner/v1beta/scan_run_warning_trace.proto\x12&google.cloud.websecurityscanner.v1beta\"\xed\x01\n\x13ScanRunWarningTrace\x12N\n\x04\x63ode\x18\x01 \x01(\x0e\x32@.google.cloud.websecurityscanner.v1beta.ScanRunWarningTrace.Code\"\x85\x01\n\x04\x43ode\x12\x14\n\x10\x43ODE_UNSPECIFIED\x10\x00\x12\x1e\n\x1aINSUFFICIENT_CRAWL_RESULTS\x10\x01\x12\x1a\n\x16TOO_MANY_CRAWL_RESULTS\x10\x02\x12\x17\n\x13TOO_MANY_FUZZ_TASKS\x10\x03\x12\x12\n\x0e\x42LOCKED_BY_IAP\x10\x04\x42\xa2\x02\n*com.google.cloud.websecurityscanner.v1betaB\x18ScanRunWarningTraceProtoP\x01ZZcloud.google.com/go/websecurityscanner/apiv1beta/websecurityscannerpb;websecurityscannerpb\xaa\x02&Google.Cloud.WebSecurityScanner.V1Beta\xca\x02&Google\\Cloud\\WebSecurityScanner\\V1beta\xea\x02)Google::Cloud::WebSecurityScanner::V1betab\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module Google
  module Cloud
    module WebSecurityScanner
      module V1beta
        ScanRunWarningTrace = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.websecurityscanner.v1beta.ScanRunWarningTrace").msgclass
        ScanRunWarningTrace::Code = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.websecurityscanner.v1beta.ScanRunWarningTrace.Code").enummodule
      end
    end
  end
end
