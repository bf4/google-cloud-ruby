# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/aiplatform/v1/model_service.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/aiplatform/v1/encryption_spec_pb'
require 'google/cloud/aiplatform/v1/evaluated_annotation_pb'
require 'google/cloud/aiplatform/v1/explanation_pb'
require 'google/cloud/aiplatform/v1/io_pb'
require 'google/cloud/aiplatform/v1/model_pb'
require 'google/cloud/aiplatform/v1/model_evaluation_pb'
require 'google/cloud/aiplatform/v1/model_evaluation_slice_pb'
require 'google/cloud/aiplatform/v1/operation_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/empty_pb'
require 'google/protobuf/field_mask_pb'


descriptor_data = "\n.google/cloud/aiplatform/v1/model_service.proto\x12\x1agoogle.cloud.aiplatform.v1\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a\x30google/cloud/aiplatform/v1/encryption_spec.proto\x1a\x35google/cloud/aiplatform/v1/evaluated_annotation.proto\x1a,google/cloud/aiplatform/v1/explanation.proto\x1a#google/cloud/aiplatform/v1/io.proto\x1a&google/cloud/aiplatform/v1/model.proto\x1a\x31google/cloud/aiplatform/v1/model_evaluation.proto\x1a\x37google/cloud/aiplatform/v1/model_evaluation_slice.proto\x1a*google/cloud/aiplatform/v1/operation.proto\x1a#google/longrunning/operations.proto\x1a\x1bgoogle/protobuf/empty.proto\x1a google/protobuf/field_mask.proto\"\xd6\x01\n\x12UploadModelRequest\x12\x39\n\x06parent\x18\x01 \x01(\tB)\xe0\x41\x02\xfa\x41#\n!locations.googleapis.com/Location\x12\x19\n\x0cparent_model\x18\x04 \x01(\tB\x03\xe0\x41\x01\x12\x15\n\x08model_id\x18\x05 \x01(\tB\x03\xe0\x41\x01\x12\x35\n\x05model\x18\x02 \x01(\x0b\x32!.google.cloud.aiplatform.v1.ModelB\x03\xe0\x41\x02\x12\x1c\n\x0fservice_account\x18\x06 \x01(\tB\x03\xe0\x41\x01\"n\n\x1cUploadModelOperationMetadata\x12N\n\x10generic_metadata\x18\x01 \x01(\x0b\x32\x34.google.cloud.aiplatform.v1.GenericOperationMetadata\"i\n\x13UploadModelResponse\x12\x33\n\x05model\x18\x01 \x01(\tB$\xfa\x41!\n\x1f\x61iplatform.googleapis.com/Model\x12\x1d\n\x10model_version_id\x18\x02 \x01(\tB\x03\xe0\x41\x03\"H\n\x0fGetModelRequest\x12\x35\n\x04name\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\n\x1f\x61iplatform.googleapis.com/Model\"\xc6\x01\n\x11ListModelsRequest\x12\x39\n\x06parent\x18\x01 \x01(\tB)\xe0\x41\x02\xfa\x41#\n!locations.googleapis.com/Location\x12\x0e\n\x06\x66ilter\x18\x02 \x01(\t\x12\x11\n\tpage_size\x18\x03 \x01(\x05\x12\x12\n\npage_token\x18\x04 \x01(\t\x12-\n\tread_mask\x18\x05 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12\x10\n\x08order_by\x18\x06 \x01(\t\"`\n\x12ListModelsResponse\x12\x31\n\x06models\x18\x01 \x03(\x0b\x32!.google.cloud.aiplatform.v1.Model\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\"\xc9\x01\n\x18ListModelVersionsRequest\x12\x35\n\x04name\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\n\x1f\x61iplatform.googleapis.com/Model\x12\x11\n\tpage_size\x18\x02 \x01(\x05\x12\x12\n\npage_token\x18\x03 \x01(\t\x12\x0e\n\x06\x66ilter\x18\x04 \x01(\t\x12-\n\tread_mask\x18\x05 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12\x10\n\x08order_by\x18\x06 \x01(\t\"g\n\x19ListModelVersionsResponse\x12\x31\n\x06models\x18\x01 \x03(\x0b\x32!.google.cloud.aiplatform.v1.Model\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\"\x81\x01\n\x12UpdateModelRequest\x12\x35\n\x05model\x18\x01 \x01(\x0b\x32!.google.cloud.aiplatform.v1.ModelB\x03\xe0\x41\x02\x12\x34\n\x0bupdate_mask\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.FieldMaskB\x03\xe0\x41\x02\"\x91\x01\n\x1fUpdateExplanationDatasetRequest\x12\x36\n\x05model\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\n\x1f\x61iplatform.googleapis.com/Model\x12\x36\n\x08\x65xamples\x18\x02 \x01(\x0b\x32$.google.cloud.aiplatform.v1.Examples\"{\n)UpdateExplanationDatasetOperationMetadata\x12N\n\x10generic_metadata\x18\x01 \x01(\x0b\x32\x34.google.cloud.aiplatform.v1.GenericOperationMetadata\"K\n\x12\x44\x65leteModelRequest\x12\x35\n\x04name\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\n\x1f\x61iplatform.googleapis.com/Model\"R\n\x19\x44\x65leteModelVersionRequest\x12\x35\n\x04name\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\n\x1f\x61iplatform.googleapis.com/Model\"q\n\x1aMergeVersionAliasesRequest\x12\x35\n\x04name\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\n\x1f\x61iplatform.googleapis.com/Model\x12\x1c\n\x0fversion_aliases\x18\x02 \x03(\tB\x03\xe0\x41\x02\"\xee\x02\n\x12\x45xportModelRequest\x12\x35\n\x04name\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\n\x1f\x61iplatform.googleapis.com/Model\x12W\n\routput_config\x18\x02 \x01(\x0b\x32;.google.cloud.aiplatform.v1.ExportModelRequest.OutputConfigB\x03\xe0\x41\x02\x1a\xc7\x01\n\x0cOutputConfig\x12\x18\n\x10\x65xport_format_id\x18\x01 \x01(\t\x12H\n\x14\x61rtifact_destination\x18\x03 \x01(\x0b\x32*.google.cloud.aiplatform.v1.GcsDestination\x12S\n\x11image_destination\x18\x04 \x01(\x0b\x32\x38.google.cloud.aiplatform.v1.ContainerRegistryDestination\"\"\n UpdateExplanationDatasetResponse\"\x9c\x02\n\x1c\x45xportModelOperationMetadata\x12N\n\x10generic_metadata\x18\x01 \x01(\x0b\x32\x34.google.cloud.aiplatform.v1.GenericOperationMetadata\x12]\n\x0boutput_info\x18\x02 \x01(\x0b\x32\x43.google.cloud.aiplatform.v1.ExportModelOperationMetadata.OutputInfoB\x03\xe0\x41\x03\x1aM\n\nOutputInfo\x12 \n\x13\x61rtifact_output_uri\x18\x02 \x01(\tB\x03\xe0\x41\x03\x12\x1d\n\x10image_output_uri\x18\x03 \x01(\tB\x03\xe0\x41\x03\"\x15\n\x13\x45xportModelResponse\"\xc0\x02\n\x10\x43opyModelRequest\x12\x17\n\x08model_id\x18\x04 \x01(\tB\x03\xe0\x41\x01H\x00\x12?\n\x0cparent_model\x18\x05 \x01(\tB\'\xe0\x41\x01\xfa\x41!\n\x1f\x61iplatform.googleapis.com/ModelH\x00\x12\x39\n\x06parent\x18\x01 \x01(\tB)\xe0\x41\x02\xfa\x41#\n!locations.googleapis.com/Location\x12=\n\x0csource_model\x18\x02 \x01(\tB\'\xe0\x41\x02\xfa\x41!\n\x1f\x61iplatform.googleapis.com/Model\x12\x43\n\x0f\x65ncryption_spec\x18\x03 \x01(\x0b\x32*.google.cloud.aiplatform.v1.EncryptionSpecB\x13\n\x11\x64\x65stination_model\"l\n\x1a\x43opyModelOperationMetadata\x12N\n\x10generic_metadata\x18\x01 \x01(\x0b\x32\x34.google.cloud.aiplatform.v1.GenericOperationMetadata\"g\n\x11\x43opyModelResponse\x12\x33\n\x05model\x18\x01 \x01(\tB$\xfa\x41!\n\x1f\x61iplatform.googleapis.com/Model\x12\x1d\n\x10model_version_id\x18\x02 \x01(\tB\x03\xe0\x41\x03\"\xa3\x01\n\x1cImportModelEvaluationRequest\x12\x37\n\x06parent\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\n\x1f\x61iplatform.googleapis.com/Model\x12J\n\x10model_evaluation\x18\x02 \x01(\x0b\x32+.google.cloud.aiplatform.v1.ModelEvaluationB\x03\xe0\x41\x02\"\xc4\x01\n\'BatchImportModelEvaluationSlicesRequest\x12\x41\n\x06parent\x18\x01 \x01(\tB1\xe0\x41\x02\xfa\x41+\n)aiplatform.googleapis.com/ModelEvaluation\x12V\n\x17model_evaluation_slices\x18\x02 \x03(\x0b\x32\x30.google.cloud.aiplatform.v1.ModelEvaluationSliceB\x03\xe0\x41\x02\"Y\n(BatchImportModelEvaluationSlicesResponse\x12-\n imported_model_evaluation_slices\x18\x01 \x03(\tB\x03\xe0\x41\x03\"\xc5\x01\n&BatchImportEvaluatedAnnotationsRequest\x12\x46\n\x06parent\x18\x01 \x01(\tB6\xe0\x41\x02\xfa\x41\x30\n.aiplatform.googleapis.com/ModelEvaluationSlice\x12S\n\x15\x65valuated_annotations\x18\x02 \x03(\x0b\x32/.google.cloud.aiplatform.v1.EvaluatedAnnotationB\x03\xe0\x41\x02\"\\\n\'BatchImportEvaluatedAnnotationsResponse\x12\x31\n$imported_evaluated_annotations_count\x18\x01 \x01(\x05\x42\x03\xe0\x41\x03\"\\\n\x19GetModelEvaluationRequest\x12?\n\x04name\x18\x01 \x01(\tB1\xe0\x41\x02\xfa\x41+\n)aiplatform.googleapis.com/ModelEvaluation\"\xbc\x01\n\x1bListModelEvaluationsRequest\x12\x37\n\x06parent\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\n\x1f\x61iplatform.googleapis.com/Model\x12\x0e\n\x06\x66ilter\x18\x02 \x01(\t\x12\x11\n\tpage_size\x18\x03 \x01(\x05\x12\x12\n\npage_token\x18\x04 \x01(\t\x12-\n\tread_mask\x18\x05 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\"\x7f\n\x1cListModelEvaluationsResponse\x12\x46\n\x11model_evaluations\x18\x01 \x03(\x0b\x32+.google.cloud.aiplatform.v1.ModelEvaluation\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\"f\n\x1eGetModelEvaluationSliceRequest\x12\x44\n\x04name\x18\x01 \x01(\tB6\xe0\x41\x02\xfa\x41\x30\n.aiplatform.googleapis.com/ModelEvaluationSlice\"\xcb\x01\n ListModelEvaluationSlicesRequest\x12\x41\n\x06parent\x18\x01 \x01(\tB1\xe0\x41\x02\xfa\x41+\n)aiplatform.googleapis.com/ModelEvaluation\x12\x0e\n\x06\x66ilter\x18\x02 \x01(\t\x12\x11\n\tpage_size\x18\x03 \x01(\x05\x12\x12\n\npage_token\x18\x04 \x01(\t\x12-\n\tread_mask\x18\x05 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\"\x8f\x01\n!ListModelEvaluationSlicesResponse\x12Q\n\x17model_evaluation_slices\x18\x01 \x03(\x0b\x32\x30.google.cloud.aiplatform.v1.ModelEvaluationSlice\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t2\x9d \n\x0cModelService\x12\xe0\x01\n\x0bUploadModel\x12..google.cloud.aiplatform.v1.UploadModelRequest\x1a\x1d.google.longrunning.Operation\"\x81\x01\x82\xd3\xe4\x93\x02\x36\"1/v1/{parent=projects/*/locations/*}/models:upload:\x01*\xda\x41\x0cparent,model\xca\x41\x33\n\x13UploadModelResponse\x12\x1cUploadModelOperationMetadata\x12\x95\x01\n\x08GetModel\x12+.google.cloud.aiplatform.v1.GetModelRequest\x1a!.google.cloud.aiplatform.v1.Model\"9\x82\xd3\xe4\x93\x02,\x12*/v1/{name=projects/*/locations/*/models/*}\xda\x41\x04name\x12\xa8\x01\n\nListModels\x12-.google.cloud.aiplatform.v1.ListModelsRequest\x1a..google.cloud.aiplatform.v1.ListModelsResponse\";\x82\xd3\xe4\x93\x02,\x12*/v1/{parent=projects/*/locations/*}/models\xda\x41\x06parent\x12\xc8\x01\n\x11ListModelVersions\x12\x34.google.cloud.aiplatform.v1.ListModelVersionsRequest\x1a\x35.google.cloud.aiplatform.v1.ListModelVersionsResponse\"F\x82\xd3\xe4\x93\x02\x39\x12\x37/v1/{name=projects/*/locations/*/models/*}:listVersions\xda\x41\x04name\x12\xb5\x01\n\x0bUpdateModel\x12..google.cloud.aiplatform.v1.UpdateModelRequest\x1a!.google.cloud.aiplatform.v1.Model\"S\x82\xd3\xe4\x93\x02\x39\x32\x30/v1/{model.name=projects/*/locations/*/models/*}:\x05model\xda\x41\x11model,update_mask\x12\xa0\x02\n\x18UpdateExplanationDataset\x12;.google.cloud.aiplatform.v1.UpdateExplanationDatasetRequest\x1a\x1d.google.longrunning.Operation\"\xa7\x01\x82\xd3\xe4\x93\x02I\"D/v1/{model=projects/*/locations/*/models/*}:updateExplanationDataset:\x01*\xda\x41\x05model\xca\x41M\n UpdateExplanationDatasetResponse\x12)UpdateExplanationDatasetOperationMetadata\x12\xca\x01\n\x0b\x44\x65leteModel\x12..google.cloud.aiplatform.v1.DeleteModelRequest\x1a\x1d.google.longrunning.Operation\"l\x82\xd3\xe4\x93\x02,**/v1/{name=projects/*/locations/*/models/*}\xda\x41\x04name\xca\x41\x30\n\x15google.protobuf.Empty\x12\x17\x44\x65leteOperationMetadata\x12\xe6\x01\n\x12\x44\x65leteModelVersion\x12\x35.google.cloud.aiplatform.v1.DeleteModelVersionRequest\x1a\x1d.google.longrunning.Operation\"z\x82\xd3\xe4\x93\x02:*8/v1/{name=projects/*/locations/*/models/*}:deleteVersion\xda\x41\x04name\xca\x41\x30\n\x15google.protobuf.Empty\x12\x17\x44\x65leteOperationMetadata\x12\xd2\x01\n\x13MergeVersionAliases\x12\x36.google.cloud.aiplatform.v1.MergeVersionAliasesRequest\x1a!.google.cloud.aiplatform.v1.Model\"`\x82\xd3\xe4\x93\x02\x43\">/v1/{name=projects/*/locations/*/models/*}:mergeVersionAliases:\x01*\xda\x41\x14name,version_aliases\x12\xe6\x01\n\x0b\x45xportModel\x12..google.cloud.aiplatform.v1.ExportModelRequest\x1a\x1d.google.longrunning.Operation\"\x87\x01\x82\xd3\xe4\x93\x02\x36\"1/v1/{name=projects/*/locations/*/models/*}:export:\x01*\xda\x41\x12name,output_config\xca\x41\x33\n\x13\x45xportModelResponse\x12\x1c\x45xportModelOperationMetadata\x12\xdd\x01\n\tCopyModel\x12,.google.cloud.aiplatform.v1.CopyModelRequest\x1a\x1d.google.longrunning.Operation\"\x82\x01\x82\xd3\xe4\x93\x02\x34\"//v1/{parent=projects/*/locations/*}/models:copy:\x01*\xda\x41\x13parent,source_model\xca\x41/\n\x11\x43opyModelResponse\x12\x1a\x43opyModelOperationMetadata\x12\xe4\x01\n\x15ImportModelEvaluation\x12\x38.google.cloud.aiplatform.v1.ImportModelEvaluationRequest\x1a+.google.cloud.aiplatform.v1.ModelEvaluation\"d\x82\xd3\xe4\x93\x02\x44\"?/v1/{parent=projects/*/locations/*/models/*}/evaluations:import:\x01*\xda\x41\x17parent,model_evaluation\x12\xa8\x02\n BatchImportModelEvaluationSlices\x12\x43.google.cloud.aiplatform.v1.BatchImportModelEvaluationSlicesRequest\x1a\x44.google.cloud.aiplatform.v1.BatchImportModelEvaluationSlicesResponse\"y\x82\xd3\xe4\x93\x02R\"M/v1/{parent=projects/*/locations/*/models/*/evaluations/*}/slices:batchImport:\x01*\xda\x41\x1eparent,model_evaluation_slices\x12\xa5\x02\n\x1f\x42\x61tchImportEvaluatedAnnotations\x12\x42.google.cloud.aiplatform.v1.BatchImportEvaluatedAnnotationsRequest\x1a\x43.google.cloud.aiplatform.v1.BatchImportEvaluatedAnnotationsResponse\"y\x82\xd3\xe4\x93\x02T\"O/v1/{parent=projects/*/locations/*/models/*/evaluations/*/slices/*}:batchImport:\x01*\xda\x41\x1cparent,evaluated_annotations\x12\xc1\x01\n\x12GetModelEvaluation\x12\x35.google.cloud.aiplatform.v1.GetModelEvaluationRequest\x1a+.google.cloud.aiplatform.v1.ModelEvaluation\"G\x82\xd3\xe4\x93\x02:\x12\x38/v1/{name=projects/*/locations/*/models/*/evaluations/*}\xda\x41\x04name\x12\xd4\x01\n\x14ListModelEvaluations\x12\x37.google.cloud.aiplatform.v1.ListModelEvaluationsRequest\x1a\x38.google.cloud.aiplatform.v1.ListModelEvaluationsResponse\"I\x82\xd3\xe4\x93\x02:\x12\x38/v1/{parent=projects/*/locations/*/models/*}/evaluations\xda\x41\x06parent\x12\xd9\x01\n\x17GetModelEvaluationSlice\x12:.google.cloud.aiplatform.v1.GetModelEvaluationSliceRequest\x1a\x30.google.cloud.aiplatform.v1.ModelEvaluationSlice\"P\x82\xd3\xe4\x93\x02\x43\x12\x41/v1/{name=projects/*/locations/*/models/*/evaluations/*/slices/*}\xda\x41\x04name\x12\xec\x01\n\x19ListModelEvaluationSlices\x12<.google.cloud.aiplatform.v1.ListModelEvaluationSlicesRequest\x1a=.google.cloud.aiplatform.v1.ListModelEvaluationSlicesResponse\"R\x82\xd3\xe4\x93\x02\x43\x12\x41/v1/{parent=projects/*/locations/*/models/*/evaluations/*}/slices\xda\x41\x06parent\x1aM\xca\x41\x19\x61iplatform.googleapis.com\xd2\x41.https://www.googleapis.com/auth/cloud-platformB\xcf\x01\n\x1e\x63om.google.cloud.aiplatform.v1B\x11ModelServiceProtoP\x01Z>cloud.google.com/go/aiplatform/apiv1/aiplatformpb;aiplatformpb\xaa\x02\x1aGoogle.Cloud.AIPlatform.V1\xca\x02\x1aGoogle\\Cloud\\AIPlatform\\V1\xea\x02\x1dGoogle::Cloud::AIPlatform::V1b\x06proto3"

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
    ["google.cloud.aiplatform.v1.Model", "google/cloud/aiplatform/v1/model.proto"],
    ["google.cloud.aiplatform.v1.GenericOperationMetadata", "google/cloud/aiplatform/v1/operation.proto"],
    ["google.protobuf.FieldMask", "google/protobuf/field_mask.proto"],
    ["google.cloud.aiplatform.v1.Examples", "google/cloud/aiplatform/v1/explanation.proto"],
    ["google.cloud.aiplatform.v1.GcsDestination", "google/cloud/aiplatform/v1/io.proto"],
    ["google.cloud.aiplatform.v1.EncryptionSpec", "google/cloud/aiplatform/v1/encryption_spec.proto"],
    ["google.cloud.aiplatform.v1.ModelEvaluation", "google/cloud/aiplatform/v1/model_evaluation.proto"],
    ["google.cloud.aiplatform.v1.ModelEvaluationSlice", "google/cloud/aiplatform/v1/model_evaluation_slice.proto"],
    ["google.cloud.aiplatform.v1.EvaluatedAnnotation", "google/cloud/aiplatform/v1/evaluated_annotation.proto"],
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
        UploadModelRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.UploadModelRequest").msgclass
        UploadModelOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.UploadModelOperationMetadata").msgclass
        UploadModelResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.UploadModelResponse").msgclass
        GetModelRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.GetModelRequest").msgclass
        ListModelsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListModelsRequest").msgclass
        ListModelsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListModelsResponse").msgclass
        ListModelVersionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListModelVersionsRequest").msgclass
        ListModelVersionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListModelVersionsResponse").msgclass
        UpdateModelRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.UpdateModelRequest").msgclass
        UpdateExplanationDatasetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.UpdateExplanationDatasetRequest").msgclass
        UpdateExplanationDatasetOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.UpdateExplanationDatasetOperationMetadata").msgclass
        DeleteModelRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.DeleteModelRequest").msgclass
        DeleteModelVersionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.DeleteModelVersionRequest").msgclass
        MergeVersionAliasesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.MergeVersionAliasesRequest").msgclass
        ExportModelRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ExportModelRequest").msgclass
        ExportModelRequest::OutputConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ExportModelRequest.OutputConfig").msgclass
        UpdateExplanationDatasetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.UpdateExplanationDatasetResponse").msgclass
        ExportModelOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ExportModelOperationMetadata").msgclass
        ExportModelOperationMetadata::OutputInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ExportModelOperationMetadata.OutputInfo").msgclass
        ExportModelResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ExportModelResponse").msgclass
        CopyModelRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.CopyModelRequest").msgclass
        CopyModelOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.CopyModelOperationMetadata").msgclass
        CopyModelResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.CopyModelResponse").msgclass
        ImportModelEvaluationRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ImportModelEvaluationRequest").msgclass
        BatchImportModelEvaluationSlicesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.BatchImportModelEvaluationSlicesRequest").msgclass
        BatchImportModelEvaluationSlicesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.BatchImportModelEvaluationSlicesResponse").msgclass
        BatchImportEvaluatedAnnotationsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.BatchImportEvaluatedAnnotationsRequest").msgclass
        BatchImportEvaluatedAnnotationsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.BatchImportEvaluatedAnnotationsResponse").msgclass
        GetModelEvaluationRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.GetModelEvaluationRequest").msgclass
        ListModelEvaluationsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListModelEvaluationsRequest").msgclass
        ListModelEvaluationsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListModelEvaluationsResponse").msgclass
        GetModelEvaluationSliceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.GetModelEvaluationSliceRequest").msgclass
        ListModelEvaluationSlicesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListModelEvaluationSlicesRequest").msgclass
        ListModelEvaluationSlicesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.aiplatform.v1.ListModelEvaluationSlicesResponse").msgclass
      end
    end
  end
end
