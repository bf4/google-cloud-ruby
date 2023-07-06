# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/gkebackup/v1/backup_plan.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/gkebackup/v1/common_pb'
require 'google/protobuf/timestamp_pb'


descriptor_data = "\n+google/cloud/gkebackup/v1/backup_plan.proto\x12\x19google.cloud.gkebackup.v1\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a&google/cloud/gkebackup/v1/common.proto\x1a\x1fgoogle/protobuf/timestamp.proto\"\xb0\x0b\n\nBackupPlan\x12\x11\n\x04name\x18\x01 \x01(\tB\x03\xe0\x41\x03\x12\x10\n\x03uid\x18\x02 \x01(\tB\x03\xe0\x41\x03\x12\x34\n\x0b\x63reate_time\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x03\x12\x34\n\x0bupdate_time\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x03\x12\x13\n\x0b\x64\x65scription\x18\x05 \x01(\t\x12<\n\x07\x63luster\x18\x06 \x01(\tB+\xe0\x41\x05\xe0\x41\x02\xfa\x41\"\n container.googleapis.com/Cluster\x12O\n\x10retention_policy\x18\x07 \x01(\x0b\x32\x35.google.cloud.gkebackup.v1.BackupPlan.RetentionPolicy\x12\x41\n\x06labels\x18\x08 \x03(\x0b\x32\x31.google.cloud.gkebackup.v1.BackupPlan.LabelsEntry\x12G\n\x0f\x62\x61\x63kup_schedule\x18\t \x01(\x0b\x32..google.cloud.gkebackup.v1.BackupPlan.Schedule\x12\x11\n\x04\x65tag\x18\n \x01(\tB\x03\xe0\x41\x03\x12\x13\n\x0b\x64\x65\x61\x63tivated\x18\x0b \x01(\x08\x12I\n\rbackup_config\x18\x0c \x01(\x0b\x32\x32.google.cloud.gkebackup.v1.BackupPlan.BackupConfig\x12 \n\x13protected_pod_count\x18\r \x01(\x05\x42\x03\xe0\x41\x03\x12?\n\x05state\x18\x0e \x01(\x0e\x32+.google.cloud.gkebackup.v1.BackupPlan.StateB\x03\xe0\x41\x03\x12\x19\n\x0cstate_reason\x18\x0f \x01(\tB\x03\xe0\x41\x03\x1a^\n\x0fRetentionPolicy\x12\x1f\n\x17\x62\x61\x63kup_delete_lock_days\x18\x01 \x01(\x05\x12\x1a\n\x12\x62\x61\x63kup_retain_days\x18\x02 \x01(\x05\x12\x0e\n\x06locked\x18\x03 \x01(\x08\x1a\x31\n\x08Schedule\x12\x15\n\rcron_schedule\x18\x01 \x01(\t\x12\x0e\n\x06paused\x18\x02 \x01(\x08\x1a\xc3\x02\n\x0c\x42\x61\x63kupConfig\x12\x18\n\x0e\x61ll_namespaces\x18\x01 \x01(\x08H\x00\x12\x44\n\x13selected_namespaces\x18\x02 \x01(\x0b\x32%.google.cloud.gkebackup.v1.NamespacesH\x00\x12K\n\x15selected_applications\x18\x03 \x01(\x0b\x32*.google.cloud.gkebackup.v1.NamespacedNamesH\x00\x12\x1b\n\x13include_volume_data\x18\x04 \x01(\x08\x12\x17\n\x0finclude_secrets\x18\x05 \x01(\x08\x12@\n\x0e\x65ncryption_key\x18\x06 \x01(\x0b\x32(.google.cloud.gkebackup.v1.EncryptionKeyB\x0e\n\x0c\x62\x61\x63kup_scope\x1a-\n\x0bLabelsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"{\n\x05State\x12\x15\n\x11STATE_UNSPECIFIED\x10\x00\x12\x13\n\x0f\x43LUSTER_PENDING\x10\x01\x12\x10\n\x0cPROVISIONING\x10\x02\x12\t\n\x05READY\x10\x03\x12\n\n\x06\x46\x41ILED\x10\x04\x12\x0f\n\x0b\x44\x45\x41\x43TIVATED\x10\x05\x12\x0c\n\x08\x44\x45LETING\x10\x06:k\xea\x41h\n#gkebackup.googleapis.com/BackupPlan\x12\x41projects/{project}/locations/{location}/backupPlans/{backup_plan}B\xc6\x01\n\x1d\x63om.google.cloud.gkebackup.v1B\x0f\x42\x61\x63kupPlanProtoP\x01Z;cloud.google.com/go/gkebackup/apiv1/gkebackuppb;gkebackuppb\xaa\x02\x19Google.Cloud.GkeBackup.V1\xca\x02\x19Google\\Cloud\\GkeBackup\\V1\xea\x02\x1cGoogle::Cloud::GkeBackup::V1b\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError => e
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
    ["google.protobuf.Timestamp", "google/protobuf/timestamp.proto"],
    ["google.cloud.gkebackup.v1.Namespaces", "google/cloud/gkebackup/v1/common.proto"],
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
    module GkeBackup
      module V1
        BackupPlan = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gkebackup.v1.BackupPlan").msgclass
        BackupPlan::RetentionPolicy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gkebackup.v1.BackupPlan.RetentionPolicy").msgclass
        BackupPlan::Schedule = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gkebackup.v1.BackupPlan.Schedule").msgclass
        BackupPlan::BackupConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gkebackup.v1.BackupPlan.BackupConfig").msgclass
        BackupPlan::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gkebackup.v1.BackupPlan.State").enummodule
      end
    end
  end
end
