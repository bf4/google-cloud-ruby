# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/aiplatform/v1/feature_online_store_admin_service.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/aiplatform/v1/feature_online_store_pb'
require 'google/cloud/aiplatform/v1/feature_view_pb'
require 'google/cloud/aiplatform/v1/feature_view_sync_pb'
require 'google/cloud/aiplatform/v1/operation_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/empty_pb'
require 'google/protobuf/field_mask_pb'


descriptor_data = "\nCgoogle/cloud/aiplatform/v1/feature_online_store_admin_service.proto\x12\x1agoogle.cloud.aiplatform.v1\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a\x35google/cloud/aiplatform/v1/feature_online_store.proto\x1a-google/cloud/aiplatform/v1/feature_view.proto\x1a\x32google/cloud/aiplatform/v1/feature_view_sync.proto\x1a*google/cloud/aiplatform/v1/operation.proto\x1a#google/longrunning/operations.proto\x1a\x1bgoogle/protobuf/empty.proto\x1a google/protobuf/field_mask.proto\"\xe0\x01\n\x1f\x43reateFeatureOnlineStoreRequest\x12\x44\n\x06parent\x18\x01 \x01(\tB4\xe0\x41\x02\xfa\x41.\x12,aiplatform.googleapis.com/FeatureOnlineStore\x12Q\n\x14\x66\x65\x61ture_online_store\x18\x02 \x01(\x0b\x32..google.cloud.aiplatform.v1.FeatureOnlineStoreB\x03\xe0\x41\x02\x12$\n\x17\x66\x65\x61ture_online_store_id\x18\x03 \x01(\tB\x03\xe0\x41\x02\"b\n\x1cGetFeatureOnlineStoreRequest\x12\x42\n\x04name\x18\x01 \x01(\tB4\xe0\x41\x02\xfa\x41.\n,aiplatform.googleapis.com/FeatureOnlineStore\"\xaf\x01\n\x1eListFeatureOnlineStoresRequest\x12\x44\n\x06parent\x18\x01 \x01(\tB4\xe0\x41\x02\xfa\x41.\x12,aiplatform.googleapis.com/FeatureOnlineStore\x12\x0e\n\x06\x66ilter\x18\x02 \x01(\t\x12\x11\n\tpage_size\x18\x03 \x01(\x05\x12\x12\n\npage_token\x18\x04 \x01(\t\x12\x10\n\x08order_by\x18\x05 \x01(\t\"\x89\x01\n\x1fListFeatureOnlineStoresResponse\x12M\n\x15\x66\x65\x61ture_online_stores\x18\x01 \x03(\x0b\x32..google.cloud.aiplatform.v1.FeatureOnlineStore\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\"\xa5\x01\n\x1fUpdateFeatureOnlineStoreRequest\x12Q\n\x14\x66\x65\x61ture_online_store\x18\x01 \x01(\x0b\x32..google.cloud.aiplatform.v1.FeatureOnlineStoreB\x03\xe0\x41\x02\x12/\n\x0bupdate_mask\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\"t\n\x1f\x44\x65leteFeatureOnlineStoreRequest\x12\x42\n\x04name\x18\x01 \x01(\tB4\xe0\x41\x02\xfa\x41.\n,aiplatform.googleapis.com/FeatureOnlineStore\x12\r\n\x05\x66orce\x18\x02 \x01(\x08\"\xe5\x01\n\x18\x43reateFeatureViewRequest\x12\x44\n\x06parent\x18\x01 \x01(\tB4\xe0\x41\x02\xfa\x41.\n,aiplatform.googleapis.com/FeatureOnlineStore\x12\x42\n\x0c\x66\x65\x61ture_view\x18\x02 \x01(\x0b\x32\'.google.cloud.aiplatform.v1.FeatureViewB\x03\xe0\x41\x02\x12\x1c\n\x0f\x66\x65\x61ture_view_id\x18\x03 \x01(\tB\x03\xe0\x41\x02\x12!\n\x14run_sync_immediately\x18\x04 \x01(\x08\x42\x03\xe0\x41\x05\"T\n\x15GetFeatureViewRequest\x12;\n\x04name\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\n%aiplatform.googleapis.com/FeatureView\"\xa1\x01\n\x17ListFeatureViewsRequest\x12=\n\x06parent\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\x12%aiplatform.googleapis.com/FeatureView\x12\x0e\n\x06\x66ilter\x18\x02 \x01(\t\x12\x11\n\tpage_size\x18\x03 \x01(\x05\x12\x12\n\npage_token\x18\x04 \x01(\t\x12\x10\n\x08order_by\x18\x05 \x01(\t\"s\n\x18ListFeatureViewsResponse\x12>\n\rfeature_views\x18\x01 \x03(\x0b\x32\'.google.cloud.aiplatform.v1.FeatureView\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\"\x8f\x01\n\x18UpdateFeatureViewRequest\x12\x42\n\x0c\x66\x65\x61ture_view\x18\x01 \x01(\x0b\x32\'.google.cloud.aiplatform.v1.FeatureViewB\x03\xe0\x41\x02\x12/\n\x0bupdate_mask\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\"W\n\x18\x44\x65leteFeatureViewRequest\x12;\n\x04name\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\n%aiplatform.googleapis.com/FeatureView\"{\n)CreateFeatureOnlineStoreOperationMetadata\x12N\n\x10generic_metadata\x18\x01 \x01(\x0b\x32\x34.google.cloud.aiplatform.v1.GenericOperationMetadata\"{\n)UpdateFeatureOnlineStoreOperationMetadata\x12N\n\x10generic_metadata\x18\x01 \x01(\x0b\x32\x34.google.cloud.aiplatform.v1.GenericOperationMetadata\"t\n\"CreateFeatureViewOperationMetadata\x12N\n\x10generic_metadata\x18\x01 \x01(\x0b\x32\x34.google.cloud.aiplatform.v1.GenericOperationMetadata\"t\n\"UpdateFeatureViewOperationMetadata\x12N\n\x10generic_metadata\x18\x01 \x01(\x0b\x32\x34.google.cloud.aiplatform.v1.GenericOperationMetadata\"]\n\x16SyncFeatureViewRequest\x12\x43\n\x0c\x66\x65\x61ture_view\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\n%aiplatform.googleapis.com/FeatureView\"4\n\x17SyncFeatureViewResponse\x12\x19\n\x11\x66\x65\x61ture_view_sync\x18\x01 \x01(\t\"\\\n\x19GetFeatureViewSyncRequest\x12?\n\x04name\x18\x01 \x01(\tB1\xe0\x41\x02\xfa\x41+\n)aiplatform.googleapis.com/FeatureViewSync\"\xa5\x01\n\x1bListFeatureViewSyncsRequest\x12=\n\x06parent\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\n%aiplatform.googleapis.com/FeatureView\x12\x0e\n\x06\x66ilter\x18\x02 \x01(\t\x12\x11\n\tpage_size\x18\x03 \x01(\x05\x12\x12\n\npage_token\x18\x04 \x01(\t\x12\x10\n\x08order_by\x18\x05 \x01(\t\"\x80\x01\n\x1cListFeatureViewSyncsResponse\x12G\n\x12\x66\x65\x61ture_view_syncs\x18\x01 \x03(\x0b\x32+.google.cloud.aiplatform.v1.FeatureViewSync\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t2\xd0\x1a\n\x1e\x46\x65\x61tureOnlineStoreAdminService\x12\xc6\x02\n\x18\x43reateFeatureOnlineStore\x12;.google.cloud.aiplatform.v1.CreateFeatureOnlineStoreRequest\x1a\x1d.google.longrunning.Operation\"\xcd\x01\xca\x41?\n\x12\x46\x65\x61tureOnlineStore\x12)CreateFeatureOnlineStoreOperationMetadata\xda\x41\x33parent,feature_online_store,feature_online_store_id\x82\xd3\xe4\x93\x02O\"7/v1/{parent=projects/*/locations/*}/featureOnlineStores:\x14\x66\x65\x61ture_online_store\x12\xc9\x01\n\x15GetFeatureOnlineStore\x12\x38.google.cloud.aiplatform.v1.GetFeatureOnlineStoreRequest\x1a..google.cloud.aiplatform.v1.FeatureOnlineStore\"F\xda\x41\x04name\x82\xd3\xe4\x93\x02\x39\x12\x37/v1/{name=projects/*/locations/*/featureOnlineStores/*}\x12\xdc\x01\n\x17ListFeatureOnlineStores\x12:.google.cloud.aiplatform.v1.ListFeatureOnlineStoresRequest\x1a;.google.cloud.aiplatform.v1.ListFeatureOnlineStoresResponse\"H\xda\x41\x06parent\x82\xd3\xe4\x93\x02\x39\x12\x37/v1/{parent=projects/*/locations/*}/featureOnlineStores\x12\xc8\x02\n\x18UpdateFeatureOnlineStore\x12;.google.cloud.aiplatform.v1.UpdateFeatureOnlineStoreRequest\x1a\x1d.google.longrunning.Operation\"\xcf\x01\xca\x41?\n\x12\x46\x65\x61tureOnlineStore\x12)UpdateFeatureOnlineStoreOperationMetadata\xda\x41 feature_online_store,update_mask\x82\xd3\xe4\x93\x02\x64\x32L/v1/{feature_online_store.name=projects/*/locations/*/featureOnlineStores/*}:\x14\x66\x65\x61ture_online_store\x12\xf7\x01\n\x18\x44\x65leteFeatureOnlineStore\x12;.google.cloud.aiplatform.v1.DeleteFeatureOnlineStoreRequest\x1a\x1d.google.longrunning.Operation\"\x7f\xca\x41\x30\n\x15google.protobuf.Empty\x12\x17\x44\x65leteOperationMetadata\xda\x41\nname,force\x82\xd3\xe4\x93\x02\x39*7/v1/{name=projects/*/locations/*/featureOnlineStores/*}\x12\xa1\x02\n\x11\x43reateFeatureView\x12\x34.google.cloud.aiplatform.v1.CreateFeatureViewRequest\x1a\x1d.google.longrunning.Operation\"\xb6\x01\xca\x41\x31\n\x0b\x46\x65\x61tureView\x12\"CreateFeatureViewOperationMetadata\xda\x41#parent,feature_view,feature_view_id\x82\xd3\xe4\x93\x02V\"F/v1/{parent=projects/*/locations/*/featureOnlineStores/*}/featureViews:\x0c\x66\x65\x61ture_view\x12\xc3\x01\n\x0eGetFeatureView\x12\x31.google.cloud.aiplatform.v1.GetFeatureViewRequest\x1a\'.google.cloud.aiplatform.v1.FeatureView\"U\xda\x41\x04name\x82\xd3\xe4\x93\x02H\x12\x46/v1/{name=projects/*/locations/*/featureOnlineStores/*/featureViews/*}\x12\xd6\x01\n\x10ListFeatureViews\x12\x33.google.cloud.aiplatform.v1.ListFeatureViewsRequest\x1a\x34.google.cloud.aiplatform.v1.ListFeatureViewsResponse\"W\xda\x41\x06parent\x82\xd3\xe4\x93\x02H\x12\x46/v1/{parent=projects/*/locations/*/featureOnlineStores/*}/featureViews\x12\xa3\x02\n\x11UpdateFeatureView\x12\x34.google.cloud.aiplatform.v1.UpdateFeatureViewRequest\x1a\x1d.google.longrunning.Operation\"\xb8\x01\xca\x41\x31\n\x0b\x46\x65\x61tureView\x12\"UpdateFeatureViewOperationMetadata\xda\x41\x18\x66\x65\x61ture_view,update_mask\x82\xd3\xe4\x93\x02\x63\x32S/v1/{feature_view.name=projects/*/locations/*/featureOnlineStores/*/featureViews/*}:\x0c\x66\x65\x61ture_view\x12\xf3\x01\n\x11\x44\x65leteFeatureView\x12\x34.google.cloud.aiplatform.v1.DeleteFeatureViewRequest\x1a\x1d.google.longrunning.Operation\"\x88\x01\xca\x41\x30\n\x15google.protobuf.Empty\x12\x17\x44\x65leteOperationMetadata\xda\x41\x04name\x82\xd3\xe4\x93\x02H*F/v1/{name=projects/*/locations/*/featureOnlineStores/*/featureViews/*}\x12\xe9\x01\n\x0fSyncFeatureView\x12\x32.google.cloud.aiplatform.v1.SyncFeatureViewRequest\x1a\x33.google.cloud.aiplatform.v1.SyncFeatureViewResponse\"m\xda\x41\x0c\x66\x65\x61ture_view\x82\xd3\xe4\x93\x02X\"S/v1/{feature_view=projects/*/locations/*/featureOnlineStores/*/featureViews/*}:sync:\x01*\x12\xe2\x01\n\x12GetFeatureViewSync\x12\x35.google.cloud.aiplatform.v1.GetFeatureViewSyncRequest\x1a+.google.cloud.aiplatform.v1.FeatureViewSync\"h\xda\x41\x04name\x82\xd3\xe4\x93\x02[\x12Y/v1/{name=projects/*/locations/*/featureOnlineStores/*/featureViews/*/featureViewSyncs/*}\x12\xf5\x01\n\x14ListFeatureViewSyncs\x12\x37.google.cloud.aiplatform.v1.ListFeatureViewSyncsRequest\x1a\x38.google.cloud.aiplatform.v1.ListFeatureViewSyncsResponse\"j\xda\x41\x06parent\x82\xd3\xe4\x93\x02[\x12Y/v1/{parent=projects/*/locations/*/featureOnlineStores/*/featureViews/*}/featureViewSyncs\x1aM\xca\x41\x19\x61iplatform.googleapis.com\xd2\x41.https://www.googleapis.com/auth/cloud-platformB\xe1\x01\n\x1e\x63om.google.cloud.aiplatform.v1B#FeatureOnlineStoreAdminServiceProtoP\x01Z>cloud.google.com/go/aiplatform/apiv1/aiplatformpb;aiplatformpb\xaa\x02\x1aGoogle.Cloud.AIPlatform.V1\xca\x02\x1aGoogle\\Cloud\\AIPlatform\\V1\xea\x02\x1dGoogle::Cloud::AIPlatform::V1b\x06proto3"

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
    ["google.cloud.aiplatform.v1.FeatureOnlineStore", "google/cloud/aiplatform/v1/feature_online_store.proto"],
    ["google.protobuf.FieldMask", "google/protobuf/field_mask.proto"],
    ["google.cloud.aiplatform.v1.FeatureView", "google/cloud/aiplatform/v1/feature_view.proto"],
    ["google.cloud.aiplatform.v1.GenericOperationMetadata", "google/cloud/aiplatform/v1/operation.proto"],
    ["google.cloud.aiplatform.v1.FeatureViewSync", "google/cloud/aiplatform/v1/feature_view_sync.proto"],
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
    module AIPlatform
      module V1
        CreateFeatureOnlineStoreRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.CreateFeatureOnlineStoreRequest").msgclass
        GetFeatureOnlineStoreRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.GetFeatureOnlineStoreRequest").msgclass
        ListFeatureOnlineStoresRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListFeatureOnlineStoresRequest").msgclass
        ListFeatureOnlineStoresResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListFeatureOnlineStoresResponse").msgclass
        UpdateFeatureOnlineStoreRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.UpdateFeatureOnlineStoreRequest").msgclass
        DeleteFeatureOnlineStoreRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.DeleteFeatureOnlineStoreRequest").msgclass
        CreateFeatureViewRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.CreateFeatureViewRequest").msgclass
        GetFeatureViewRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.GetFeatureViewRequest").msgclass
        ListFeatureViewsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListFeatureViewsRequest").msgclass
        ListFeatureViewsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListFeatureViewsResponse").msgclass
        UpdateFeatureViewRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.UpdateFeatureViewRequest").msgclass
        DeleteFeatureViewRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.DeleteFeatureViewRequest").msgclass
        CreateFeatureOnlineStoreOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.CreateFeatureOnlineStoreOperationMetadata").msgclass
        UpdateFeatureOnlineStoreOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.UpdateFeatureOnlineStoreOperationMetadata").msgclass
        CreateFeatureViewOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.CreateFeatureViewOperationMetadata").msgclass
        UpdateFeatureViewOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.UpdateFeatureViewOperationMetadata").msgclass
        SyncFeatureViewRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.SyncFeatureViewRequest").msgclass
        SyncFeatureViewResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.SyncFeatureViewResponse").msgclass
        GetFeatureViewSyncRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.GetFeatureViewSyncRequest").msgclass
        ListFeatureViewSyncsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListFeatureViewSyncsRequest").msgclass
        ListFeatureViewSyncsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListFeatureViewSyncsResponse").msgclass
      end
    end
  end
end
