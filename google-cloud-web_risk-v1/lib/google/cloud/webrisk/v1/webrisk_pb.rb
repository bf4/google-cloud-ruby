# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/webrisk/v1/webrisk.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/timestamp_pb'


descriptor_data = "\n%google/cloud/webrisk/v1/webrisk.proto\x12\x17google.cloud.webrisk.v1\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a#google/longrunning/operations.proto\x1a\x1fgoogle/protobuf/timestamp.proto\"\xe5\x02\n\x1c\x43omputeThreatListDiffRequest\x12>\n\x0bthreat_type\x18\x01 \x01(\x0e\x32#.google.cloud.webrisk.v1.ThreatTypeB\x04\xe2\x41\x01\x02\x12\x15\n\rversion_token\x18\x02 \x01(\x0c\x12\\\n\x0b\x63onstraints\x18\x03 \x01(\x0b\x32\x41.google.cloud.webrisk.v1.ComputeThreatListDiffRequest.ConstraintsB\x04\xe2\x41\x01\x02\x1a\x8f\x01\n\x0b\x43onstraints\x12\x18\n\x10max_diff_entries\x18\x01 \x01(\x05\x12\x1c\n\x14max_database_entries\x18\x02 \x01(\x05\x12H\n\x16supported_compressions\x18\x03 \x03(\x0e\x32(.google.cloud.webrisk.v1.CompressionType\"\x86\x04\n\x1d\x43omputeThreatListDiffResponse\x12Z\n\rresponse_type\x18\x04 \x01(\x0e\x32\x43.google.cloud.webrisk.v1.ComputeThreatListDiffResponse.ResponseType\x12@\n\tadditions\x18\x05 \x01(\x0b\x32-.google.cloud.webrisk.v1.ThreatEntryAdditions\x12>\n\x08removals\x18\x06 \x01(\x0b\x32,.google.cloud.webrisk.v1.ThreatEntryRemovals\x12\x19\n\x11new_version_token\x18\x07 \x01(\x0c\x12Q\n\x08\x63hecksum\x18\x08 \x01(\x0b\x32?.google.cloud.webrisk.v1.ComputeThreatListDiffResponse.Checksum\x12\x39\n\x15recommended_next_diff\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x1a\x1a\n\x08\x43hecksum\x12\x0e\n\x06sha256\x18\x01 \x01(\x0c\"B\n\x0cResponseType\x12\x1d\n\x19RESPONSE_TYPE_UNSPECIFIED\x10\x00\x12\x08\n\x04\x44IFF\x10\x01\x12\t\n\x05RESET\x10\x02\"g\n\x11SearchUrisRequest\x12\x11\n\x03uri\x18\x01 \x01(\tB\x04\xe2\x41\x01\x02\x12?\n\x0cthreat_types\x18\x02 \x03(\x0e\x32#.google.cloud.webrisk.v1.ThreatTypeB\x04\xe2\x41\x01\x02\"\xd4\x01\n\x12SearchUrisResponse\x12\x45\n\x06threat\x18\x01 \x01(\x0b\x32\x35.google.cloud.webrisk.v1.SearchUrisResponse.ThreatUri\x1aw\n\tThreatUri\x12\x39\n\x0cthreat_types\x18\x01 \x03(\x0e\x32#.google.cloud.webrisk.v1.ThreatType\x12/\n\x0b\x65xpire_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\"k\n\x13SearchHashesRequest\x12\x13\n\x0bhash_prefix\x18\x01 \x01(\x0c\x12?\n\x0cthreat_types\x18\x02 \x03(\x0e\x32#.google.cloud.webrisk.v1.ThreatTypeB\x04\xe2\x41\x01\x02\"\xa4\x02\n\x14SearchHashesResponse\x12I\n\x07threats\x18\x01 \x03(\x0b\x32\x38.google.cloud.webrisk.v1.SearchHashesResponse.ThreatHash\x12\x38\n\x14negative_expire_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x1a\x86\x01\n\nThreatHash\x12\x39\n\x0cthreat_types\x18\x01 \x03(\x0e\x32#.google.cloud.webrisk.v1.ThreatType\x12\x0c\n\x04hash\x18\x02 \x01(\x0c\x12/\n\x0b\x65xpire_time\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\"\x8f\x01\n\x14ThreatEntryAdditions\x12\x36\n\nraw_hashes\x18\x01 \x03(\x0b\x32\".google.cloud.webrisk.v1.RawHashes\x12?\n\x0brice_hashes\x18\x02 \x01(\x0b\x32*.google.cloud.webrisk.v1.RiceDeltaEncoding\"\x91\x01\n\x13ThreatEntryRemovals\x12\x38\n\x0braw_indices\x18\x01 \x01(\x0b\x32#.google.cloud.webrisk.v1.RawIndices\x12@\n\x0crice_indices\x18\x02 \x01(\x0b\x32*.google.cloud.webrisk.v1.RiceDeltaEncoding\"\x1d\n\nRawIndices\x12\x0f\n\x07indices\x18\x01 \x03(\x05\"4\n\tRawHashes\x12\x13\n\x0bprefix_size\x18\x01 \x01(\x05\x12\x12\n\nraw_hashes\x18\x02 \x01(\x0c\"k\n\x11RiceDeltaEncoding\x12\x13\n\x0b\x66irst_value\x18\x01 \x01(\x03\x12\x16\n\x0erice_parameter\x18\x02 \x01(\x05\x12\x13\n\x0b\x65ntry_count\x18\x03 \x01(\x05\x12\x14\n\x0c\x65ncoded_data\x18\x04 \x01(\x0c\"`\n\nSubmission\x12\x11\n\x03uri\x18\x01 \x01(\tB\x04\xe2\x41\x01\x02\x12?\n\x0cthreat_types\x18\x02 \x03(\x0e\x32#.google.cloud.webrisk.v1.ThreatTypeB\x04\xe2\x41\x01\x03\"\xa5\x06\n\nThreatInfo\x12\x41\n\nabuse_type\x18\x01 \x01(\x0e\x32-.google.cloud.webrisk.v1.ThreatInfo.AbuseType\x12I\n\x11threat_confidence\x18\x02 \x01(\x0b\x32..google.cloud.webrisk.v1.ThreatInfo.Confidence\x12U\n\x14threat_justification\x18\x03 \x01(\x0b\x32\x37.google.cloud.webrisk.v1.ThreatInfo.ThreatJustification\x1a\xcb\x01\n\nConfidence\x12\x0f\n\x05score\x18\x01 \x01(\x02H\x00\x12O\n\x05level\x18\x02 \x01(\x0e\x32>.google.cloud.webrisk.v1.ThreatInfo.Confidence.ConfidenceLevelH\x00\"R\n\x0f\x43onfidenceLevel\x12 \n\x1c\x43ONFIDENCE_LEVEL_UNSPECIFIED\x10\x00\x12\x07\n\x03LOW\x10\x01\x12\n\n\x06MEDIUM\x10\x02\x12\x08\n\x04HIGH\x10\x03\x42\x07\n\x05value\x1a\xfe\x01\n\x13ThreatJustification\x12Z\n\x06labels\x18\x01 \x03(\x0e\x32J.google.cloud.webrisk.v1.ThreatInfo.ThreatJustification.JustificationLabel\x12\x10\n\x08\x63omments\x18\x02 \x03(\t\"y\n\x12JustificationLabel\x12#\n\x1fJUSTIFICATION_LABEL_UNSPECIFIED\x10\x00\x12\x17\n\x13MANUAL_VERIFICATION\x10\x01\x12\x0f\n\x0bUSER_REPORT\x10\x02\x12\x14\n\x10\x41UTOMATED_REPORT\x10\x03\"c\n\tAbuseType\x12\x1a\n\x16\x41\x42USE_TYPE_UNSPECIFIED\x10\x00\x12\x0b\n\x07MALWARE\x10\x01\x12\x16\n\x12SOCIAL_ENGINEERING\x10\x02\x12\x15\n\x11UNWANTED_SOFTWARE\x10\x03\"\xc0\x01\n\x0fThreatDiscovery\x12\x43\n\x08platform\x18\x01 \x01(\x0e\x32\x31.google.cloud.webrisk.v1.ThreatDiscovery.Platform\x12\x14\n\x0cregion_codes\x18\x02 \x03(\t\"R\n\x08Platform\x12\x18\n\x14PLATFORM_UNSPECIFIED\x10\x00\x12\x0b\n\x07\x41NDROID\x10\x01\x12\x07\n\x03IOS\x10\x02\x12\t\n\x05MACOS\x10\x03\x12\x0b\n\x07WINDOWS\x10\x04\"\x9e\x01\n\x17\x43reateSubmissionRequest\x12\x44\n\x06parent\x18\x01 \x01(\tB4\xe2\x41\x01\x02\xfa\x41-\n+cloudresourcemanager.googleapis.com/Project\x12=\n\nsubmission\x18\x02 \x01(\x0b\x32#.google.cloud.webrisk.v1.SubmissionB\x04\xe2\x41\x01\x02\"\x95\x02\n\x10SubmitUriRequest\x12\x44\n\x06parent\x18\x01 \x01(\tB4\xe2\x41\x01\x02\xfa\x41-\n+cloudresourcemanager.googleapis.com/Project\x12=\n\nsubmission\x18\x02 \x01(\x0b\x32#.google.cloud.webrisk.v1.SubmissionB\x04\xe2\x41\x01\x02\x12\x38\n\x0bthreat_info\x18\x03 \x01(\x0b\x32#.google.cloud.webrisk.v1.ThreatInfo\x12\x42\n\x10threat_discovery\x18\x04 \x01(\x0b\x32(.google.cloud.webrisk.v1.ThreatDiscovery\"\x99\x02\n\x11SubmitUriMetadata\x12?\n\x05state\x18\x01 \x01(\x0e\x32\x30.google.cloud.webrisk.v1.SubmitUriMetadata.State\x12/\n\x0b\x63reate_time\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12/\n\x0bupdate_time\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\"a\n\x05State\x12\x15\n\x11STATE_UNSPECIFIED\x10\x00\x12\x0b\n\x07RUNNING\x10\x01\x12\r\n\tSUCCEEDED\x10\x02\x12\r\n\tCANCELLED\x10\x03\x12\n\n\x06\x46\x41ILED\x10\x04\x12\n\n\x06\x43LOSED\x10\x05*\x8f\x01\n\nThreatType\x12\x1b\n\x17THREAT_TYPE_UNSPECIFIED\x10\x00\x12\x0b\n\x07MALWARE\x10\x01\x12\x16\n\x12SOCIAL_ENGINEERING\x10\x02\x12\x15\n\x11UNWANTED_SOFTWARE\x10\x03\x12(\n$SOCIAL_ENGINEERING_EXTENDED_COVERAGE\x10\x04*F\n\x0f\x43ompressionType\x12 \n\x1c\x43OMPRESSION_TYPE_UNSPECIFIED\x10\x00\x12\x07\n\x03RAW\x10\x01\x12\x08\n\x04RICE\x10\x02\x32\xcd\x07\n\x0eWebRiskService\x12\xd3\x01\n\x15\x43omputeThreatListDiff\x12\x35.google.cloud.webrisk.v1.ComputeThreatListDiffRequest\x1a\x36.google.cloud.webrisk.v1.ComputeThreatListDiffResponse\"K\xda\x41%threat_type,version_token,constraints\x82\xd3\xe4\x93\x02\x1d\x12\x1b/v1/threatLists:computeDiff\x12\x91\x01\n\nSearchUris\x12*.google.cloud.webrisk.v1.SearchUrisRequest\x1a+.google.cloud.webrisk.v1.SearchUrisResponse\"*\xda\x41\x10uri,threat_types\x82\xd3\xe4\x93\x02\x11\x12\x0f/v1/uris:search\x12\xa1\x01\n\x0cSearchHashes\x12,.google.cloud.webrisk.v1.SearchHashesRequest\x1a-.google.cloud.webrisk.v1.SearchHashesResponse\"4\xda\x41\x18hash_prefix,threat_types\x82\xd3\xe4\x93\x02\x13\x12\x11/v1/hashes:search\x12\xb6\x01\n\x10\x43reateSubmission\x12\x30.google.cloud.webrisk.v1.CreateSubmissionRequest\x1a#.google.cloud.webrisk.v1.Submission\"K\xda\x41\x11parent,submission\x82\xd3\xe4\x93\x02\x31\"#/v1/{parent=projects/*}/submissions:\nsubmission\x12\xa7\x01\n\tSubmitUri\x12).google.cloud.webrisk.v1.SubmitUriRequest\x1a\x1d.google.longrunning.Operation\"P\xca\x41\x1f\n\nSubmission\x12\x11SubmitUriMetadata\x82\xd3\xe4\x93\x02(\"#/v1/{parent=projects/*}/uris:submit:\x01*\x1aJ\xca\x41\x16webrisk.googleapis.com\xd2\x41.https://www.googleapis.com/auth/cloud-platformB\xb6\x01\n\x15\x63om.google.webrisk.v1B\x0cWebRiskProtoP\x01Z5cloud.google.com/go/webrisk/apiv1/webriskpb;webriskpb\xa2\x02\x04GCWR\xaa\x02\x17Google.Cloud.WebRisk.V1\xca\x02\x17Google\\Cloud\\WebRisk\\V1\xea\x02\x1aGoogle::Cloud::WebRisk::V1b\x06proto3"

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
    ["google.protobuf.Timestamp", "google/protobuf/timestamp.proto"],
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
    module WebRisk
      module V1
        ComputeThreatListDiffRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ComputeThreatListDiffRequest").msgclass
        ComputeThreatListDiffRequest::Constraints = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ComputeThreatListDiffRequest.Constraints").msgclass
        ComputeThreatListDiffResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ComputeThreatListDiffResponse").msgclass
        ComputeThreatListDiffResponse::Checksum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ComputeThreatListDiffResponse.Checksum").msgclass
        ComputeThreatListDiffResponse::ResponseType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ComputeThreatListDiffResponse.ResponseType").enummodule
        SearchUrisRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.SearchUrisRequest").msgclass
        SearchUrisResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.SearchUrisResponse").msgclass
        SearchUrisResponse::ThreatUri = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.SearchUrisResponse.ThreatUri").msgclass
        SearchHashesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.SearchHashesRequest").msgclass
        SearchHashesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.SearchHashesResponse").msgclass
        SearchHashesResponse::ThreatHash = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.SearchHashesResponse.ThreatHash").msgclass
        ThreatEntryAdditions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ThreatEntryAdditions").msgclass
        ThreatEntryRemovals = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ThreatEntryRemovals").msgclass
        RawIndices = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.RawIndices").msgclass
        RawHashes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.RawHashes").msgclass
        RiceDeltaEncoding = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.RiceDeltaEncoding").msgclass
        Submission = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.Submission").msgclass
        ThreatInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ThreatInfo").msgclass
        ThreatInfo::Confidence = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ThreatInfo.Confidence").msgclass
        ThreatInfo::Confidence::ConfidenceLevel = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ThreatInfo.Confidence.ConfidenceLevel").enummodule
        ThreatInfo::ThreatJustification = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ThreatInfo.ThreatJustification").msgclass
        ThreatInfo::ThreatJustification::JustificationLabel = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ThreatInfo.ThreatJustification.JustificationLabel").enummodule
        ThreatInfo::AbuseType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ThreatInfo.AbuseType").enummodule
        ThreatDiscovery = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ThreatDiscovery").msgclass
        ThreatDiscovery::Platform = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ThreatDiscovery.Platform").enummodule
        CreateSubmissionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.CreateSubmissionRequest").msgclass
        SubmitUriRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.SubmitUriRequest").msgclass
        SubmitUriMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.SubmitUriMetadata").msgclass
        SubmitUriMetadata::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.SubmitUriMetadata.State").enummodule
        ThreatType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.ThreatType").enummodule
        CompressionType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.webrisk.v1.CompressionType").enummodule
      end
    end
  end
end
