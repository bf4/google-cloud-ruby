# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/speech/v2/cloud_speech.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/duration_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/timestamp_pb'
require 'google/rpc/status_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/speech/v2/cloud_speech.proto", :syntax => :proto3) do
    add_message "google.cloud.speech.v2.CreateRecognizerRequest" do
      optional :recognizer, :message, 1, "google.cloud.speech.v2.Recognizer"
      optional :validate_only, :bool, 2
      optional :recognizer_id, :string, 3
      optional :parent, :string, 4
    end
    add_message "google.cloud.speech.v2.OperationMetadata" do
      optional :create_time, :message, 1, "google.protobuf.Timestamp"
      optional :update_time, :message, 2, "google.protobuf.Timestamp"
      optional :resource, :string, 3
      optional :method, :string, 4
      optional :kms_key_name, :string, 6
      optional :kms_key_version_name, :string, 7
      optional :progress_percent, :int32, 22
      oneof :request do
        optional :batch_recognize_request, :message, 8, "google.cloud.speech.v2.BatchRecognizeRequest"
        optional :create_recognizer_request, :message, 9, "google.cloud.speech.v2.CreateRecognizerRequest"
        optional :update_recognizer_request, :message, 10, "google.cloud.speech.v2.UpdateRecognizerRequest"
        optional :delete_recognizer_request, :message, 11, "google.cloud.speech.v2.DeleteRecognizerRequest"
        optional :undelete_recognizer_request, :message, 12, "google.cloud.speech.v2.UndeleteRecognizerRequest"
        optional :create_custom_class_request, :message, 13, "google.cloud.speech.v2.CreateCustomClassRequest"
        optional :update_custom_class_request, :message, 14, "google.cloud.speech.v2.UpdateCustomClassRequest"
        optional :delete_custom_class_request, :message, 15, "google.cloud.speech.v2.DeleteCustomClassRequest"
        optional :undelete_custom_class_request, :message, 16, "google.cloud.speech.v2.UndeleteCustomClassRequest"
        optional :create_phrase_set_request, :message, 17, "google.cloud.speech.v2.CreatePhraseSetRequest"
        optional :update_phrase_set_request, :message, 18, "google.cloud.speech.v2.UpdatePhraseSetRequest"
        optional :delete_phrase_set_request, :message, 19, "google.cloud.speech.v2.DeletePhraseSetRequest"
        optional :undelete_phrase_set_request, :message, 20, "google.cloud.speech.v2.UndeletePhraseSetRequest"
        optional :update_config_request, :message, 21, "google.cloud.speech.v2.UpdateConfigRequest"
      end
      oneof :metadata do
        optional :batch_recognize_metadata, :message, 23, "google.cloud.speech.v2.BatchRecognizeMetadata"
      end
    end
    add_message "google.cloud.speech.v2.ListRecognizersRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :show_deleted, :bool, 4
    end
    add_message "google.cloud.speech.v2.ListRecognizersResponse" do
      repeated :recognizers, :message, 1, "google.cloud.speech.v2.Recognizer"
      optional :next_page_token, :string, 2
    end
    add_message "google.cloud.speech.v2.GetRecognizerRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.speech.v2.UpdateRecognizerRequest" do
      optional :recognizer, :message, 1, "google.cloud.speech.v2.Recognizer"
      optional :update_mask, :message, 2, "google.protobuf.FieldMask"
      optional :validate_only, :bool, 4
    end
    add_message "google.cloud.speech.v2.DeleteRecognizerRequest" do
      optional :name, :string, 1
      optional :validate_only, :bool, 2
      optional :allow_missing, :bool, 4
      optional :etag, :string, 3
    end
    add_message "google.cloud.speech.v2.UndeleteRecognizerRequest" do
      optional :name, :string, 1
      optional :validate_only, :bool, 3
      optional :etag, :string, 4
    end
    add_message "google.cloud.speech.v2.Recognizer" do
      optional :name, :string, 1
      optional :uid, :string, 2
      optional :display_name, :string, 3
      optional :model, :string, 4
      repeated :language_codes, :string, 17
      optional :default_recognition_config, :message, 6, "google.cloud.speech.v2.RecognitionConfig"
      map :annotations, :string, :string, 7
      optional :state, :enum, 8, "google.cloud.speech.v2.Recognizer.State"
      optional :create_time, :message, 9, "google.protobuf.Timestamp"
      optional :update_time, :message, 10, "google.protobuf.Timestamp"
      optional :delete_time, :message, 11, "google.protobuf.Timestamp"
      optional :expire_time, :message, 14, "google.protobuf.Timestamp"
      optional :etag, :string, 12
      optional :reconciling, :bool, 13
      optional :kms_key_name, :string, 15
      optional :kms_key_version_name, :string, 16
    end
    add_enum "google.cloud.speech.v2.Recognizer.State" do
      value :STATE_UNSPECIFIED, 0
      value :ACTIVE, 2
      value :DELETED, 4
    end
    add_message "google.cloud.speech.v2.AutoDetectDecodingConfig" do
    end
    add_message "google.cloud.speech.v2.ExplicitDecodingConfig" do
      optional :encoding, :enum, 1, "google.cloud.speech.v2.ExplicitDecodingConfig.AudioEncoding"
      optional :sample_rate_hertz, :int32, 2
      optional :audio_channel_count, :int32, 3
    end
    add_enum "google.cloud.speech.v2.ExplicitDecodingConfig.AudioEncoding" do
      value :AUDIO_ENCODING_UNSPECIFIED, 0
      value :LINEAR16, 1
      value :MULAW, 2
      value :ALAW, 3
    end
    add_message "google.cloud.speech.v2.SpeakerDiarizationConfig" do
      optional :min_speaker_count, :int32, 2
      optional :max_speaker_count, :int32, 3
    end
    add_message "google.cloud.speech.v2.RecognitionFeatures" do
      optional :profanity_filter, :bool, 1
      optional :enable_word_time_offsets, :bool, 2
      optional :enable_word_confidence, :bool, 3
      optional :enable_automatic_punctuation, :bool, 4
      optional :enable_spoken_punctuation, :bool, 14
      optional :enable_spoken_emojis, :bool, 15
      optional :multi_channel_mode, :enum, 17, "google.cloud.speech.v2.RecognitionFeatures.MultiChannelMode"
      optional :diarization_config, :message, 9, "google.cloud.speech.v2.SpeakerDiarizationConfig"
      optional :max_alternatives, :int32, 16
    end
    add_enum "google.cloud.speech.v2.RecognitionFeatures.MultiChannelMode" do
      value :MULTI_CHANNEL_MODE_UNSPECIFIED, 0
      value :SEPARATE_RECOGNITION_PER_CHANNEL, 1
    end
    add_message "google.cloud.speech.v2.SpeechAdaptation" do
      repeated :phrase_sets, :message, 1, "google.cloud.speech.v2.SpeechAdaptation.AdaptationPhraseSet"
      repeated :custom_classes, :message, 2, "google.cloud.speech.v2.CustomClass"
    end
    add_message "google.cloud.speech.v2.SpeechAdaptation.AdaptationPhraseSet" do
      oneof :value do
        optional :phrase_set, :string, 1
        optional :inline_phrase_set, :message, 2, "google.cloud.speech.v2.PhraseSet"
      end
    end
    add_message "google.cloud.speech.v2.RecognitionConfig" do
      optional :features, :message, 2, "google.cloud.speech.v2.RecognitionFeatures"
      optional :adaptation, :message, 6, "google.cloud.speech.v2.SpeechAdaptation"
      oneof :decoding_config do
        optional :auto_decoding_config, :message, 7, "google.cloud.speech.v2.AutoDetectDecodingConfig"
        optional :explicit_decoding_config, :message, 8, "google.cloud.speech.v2.ExplicitDecodingConfig"
      end
    end
    add_message "google.cloud.speech.v2.RecognizeRequest" do
      optional :recognizer, :string, 3
      optional :config, :message, 1, "google.cloud.speech.v2.RecognitionConfig"
      optional :config_mask, :message, 8, "google.protobuf.FieldMask"
      oneof :audio_source do
        optional :content, :bytes, 5
        optional :uri, :string, 6
      end
    end
    add_message "google.cloud.speech.v2.RecognitionResponseMetadata" do
      optional :total_billed_duration, :message, 6, "google.protobuf.Duration"
    end
    add_message "google.cloud.speech.v2.SpeechRecognitionAlternative" do
      optional :transcript, :string, 1
      optional :confidence, :float, 2
      repeated :words, :message, 3, "google.cloud.speech.v2.WordInfo"
    end
    add_message "google.cloud.speech.v2.WordInfo" do
      optional :start_offset, :message, 1, "google.protobuf.Duration"
      optional :end_offset, :message, 2, "google.protobuf.Duration"
      optional :word, :string, 3
      optional :confidence, :float, 4
      optional :speaker_label, :string, 6
    end
    add_message "google.cloud.speech.v2.SpeechRecognitionResult" do
      repeated :alternatives, :message, 1, "google.cloud.speech.v2.SpeechRecognitionAlternative"
      optional :channel_tag, :int32, 2
      optional :result_end_offset, :message, 4, "google.protobuf.Duration"
      optional :language_code, :string, 5
    end
    add_message "google.cloud.speech.v2.RecognizeResponse" do
      repeated :results, :message, 3, "google.cloud.speech.v2.SpeechRecognitionResult"
      optional :metadata, :message, 2, "google.cloud.speech.v2.RecognitionResponseMetadata"
    end
    add_message "google.cloud.speech.v2.StreamingRecognitionFeatures" do
      optional :enable_voice_activity_events, :bool, 1
      optional :interim_results, :bool, 2
      optional :voice_activity_timeout, :message, 3, "google.cloud.speech.v2.StreamingRecognitionFeatures.VoiceActivityTimeout"
    end
    add_message "google.cloud.speech.v2.StreamingRecognitionFeatures.VoiceActivityTimeout" do
      optional :speech_start_timeout, :message, 1, "google.protobuf.Duration"
      optional :speech_end_timeout, :message, 2, "google.protobuf.Duration"
    end
    add_message "google.cloud.speech.v2.StreamingRecognitionConfig" do
      optional :config, :message, 1, "google.cloud.speech.v2.RecognitionConfig"
      optional :config_mask, :message, 3, "google.protobuf.FieldMask"
      optional :streaming_features, :message, 2, "google.cloud.speech.v2.StreamingRecognitionFeatures"
    end
    add_message "google.cloud.speech.v2.StreamingRecognizeRequest" do
      optional :recognizer, :string, 3
      oneof :streaming_request do
        optional :streaming_config, :message, 6, "google.cloud.speech.v2.StreamingRecognitionConfig"
        optional :audio, :bytes, 5
      end
    end
    add_message "google.cloud.speech.v2.BatchRecognizeRequest" do
      optional :recognizer, :string, 1
      optional :config, :message, 4, "google.cloud.speech.v2.RecognitionConfig"
      optional :config_mask, :message, 5, "google.protobuf.FieldMask"
      repeated :files, :message, 3, "google.cloud.speech.v2.BatchRecognizeFileMetadata"
      optional :recognition_output_config, :message, 6, "google.cloud.speech.v2.RecognitionOutputConfig"
    end
    add_message "google.cloud.speech.v2.GcsOutputConfig" do
      optional :uri, :string, 1
    end
    add_message "google.cloud.speech.v2.InlineOutputConfig" do
    end
    add_message "google.cloud.speech.v2.RecognitionOutputConfig" do
      oneof :output do
        optional :gcs_output_config, :message, 1, "google.cloud.speech.v2.GcsOutputConfig"
        optional :inline_response_config, :message, 2, "google.cloud.speech.v2.InlineOutputConfig"
      end
    end
    add_message "google.cloud.speech.v2.BatchRecognizeResponse" do
      map :results, :string, :message, 1, "google.cloud.speech.v2.BatchRecognizeFileResult"
      optional :total_billed_duration, :message, 2, "google.protobuf.Duration"
    end
    add_message "google.cloud.speech.v2.BatchRecognizeResults" do
      repeated :results, :message, 1, "google.cloud.speech.v2.SpeechRecognitionResult"
      optional :metadata, :message, 2, "google.cloud.speech.v2.RecognitionResponseMetadata"
    end
    add_message "google.cloud.speech.v2.BatchRecognizeFileResult" do
      optional :uri, :string, 1
      optional :error, :message, 2, "google.rpc.Status"
      optional :metadata, :message, 3, "google.cloud.speech.v2.RecognitionResponseMetadata"
      optional :transcript, :message, 4, "google.cloud.speech.v2.BatchRecognizeResults"
    end
    add_message "google.cloud.speech.v2.BatchRecognizeTranscriptionMetadata" do
      optional :progress_percent, :int32, 1
      optional :error, :message, 2, "google.rpc.Status"
      optional :uri, :string, 3
    end
    add_message "google.cloud.speech.v2.BatchRecognizeMetadata" do
      map :transcription_metadata, :string, :message, 1, "google.cloud.speech.v2.BatchRecognizeTranscriptionMetadata"
    end
    add_message "google.cloud.speech.v2.BatchRecognizeFileMetadata" do
      optional :config, :message, 4, "google.cloud.speech.v2.RecognitionConfig"
      optional :config_mask, :message, 5, "google.protobuf.FieldMask"
      oneof :audio_source do
        optional :uri, :string, 1
      end
    end
    add_message "google.cloud.speech.v2.StreamingRecognitionResult" do
      repeated :alternatives, :message, 1, "google.cloud.speech.v2.SpeechRecognitionAlternative"
      optional :is_final, :bool, 2
      optional :stability, :float, 3
      optional :result_end_offset, :message, 4, "google.protobuf.Duration"
      optional :channel_tag, :int32, 5
      optional :language_code, :string, 6
    end
    add_message "google.cloud.speech.v2.StreamingRecognizeResponse" do
      repeated :results, :message, 6, "google.cloud.speech.v2.StreamingRecognitionResult"
      optional :speech_event_type, :enum, 3, "google.cloud.speech.v2.StreamingRecognizeResponse.SpeechEventType"
      optional :speech_event_offset, :message, 7, "google.protobuf.Duration"
      optional :metadata, :message, 5, "google.cloud.speech.v2.RecognitionResponseMetadata"
    end
    add_enum "google.cloud.speech.v2.StreamingRecognizeResponse.SpeechEventType" do
      value :SPEECH_EVENT_TYPE_UNSPECIFIED, 0
      value :END_OF_SINGLE_UTTERANCE, 1
      value :SPEECH_ACTIVITY_BEGIN, 2
      value :SPEECH_ACTIVITY_END, 3
    end
    add_message "google.cloud.speech.v2.Config" do
      optional :name, :string, 1
      optional :kms_key_name, :string, 2
      optional :update_time, :message, 3, "google.protobuf.Timestamp"
    end
    add_message "google.cloud.speech.v2.GetConfigRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.speech.v2.UpdateConfigRequest" do
      optional :config, :message, 1, "google.cloud.speech.v2.Config"
      optional :update_mask, :message, 2, "google.protobuf.FieldMask"
    end
    add_message "google.cloud.speech.v2.CustomClass" do
      optional :name, :string, 1
      optional :uid, :string, 2
      optional :display_name, :string, 4
      repeated :items, :message, 5, "google.cloud.speech.v2.CustomClass.ClassItem"
      optional :state, :enum, 15, "google.cloud.speech.v2.CustomClass.State"
      optional :create_time, :message, 6, "google.protobuf.Timestamp"
      optional :update_time, :message, 7, "google.protobuf.Timestamp"
      optional :delete_time, :message, 8, "google.protobuf.Timestamp"
      optional :expire_time, :message, 9, "google.protobuf.Timestamp"
      map :annotations, :string, :string, 10
      optional :etag, :string, 11
      optional :reconciling, :bool, 12
      optional :kms_key_name, :string, 13
      optional :kms_key_version_name, :string, 14
    end
    add_message "google.cloud.speech.v2.CustomClass.ClassItem" do
      optional :value, :string, 1
    end
    add_enum "google.cloud.speech.v2.CustomClass.State" do
      value :STATE_UNSPECIFIED, 0
      value :ACTIVE, 2
      value :DELETED, 4
    end
    add_message "google.cloud.speech.v2.PhraseSet" do
      optional :name, :string, 1
      optional :uid, :string, 2
      repeated :phrases, :message, 3, "google.cloud.speech.v2.PhraseSet.Phrase"
      optional :boost, :float, 4
      optional :display_name, :string, 5
      optional :state, :enum, 15, "google.cloud.speech.v2.PhraseSet.State"
      optional :create_time, :message, 6, "google.protobuf.Timestamp"
      optional :update_time, :message, 7, "google.protobuf.Timestamp"
      optional :delete_time, :message, 8, "google.protobuf.Timestamp"
      optional :expire_time, :message, 9, "google.protobuf.Timestamp"
      map :annotations, :string, :string, 10
      optional :etag, :string, 11
      optional :reconciling, :bool, 12
      optional :kms_key_name, :string, 13
      optional :kms_key_version_name, :string, 14
    end
    add_message "google.cloud.speech.v2.PhraseSet.Phrase" do
      optional :value, :string, 1
      optional :boost, :float, 2
    end
    add_enum "google.cloud.speech.v2.PhraseSet.State" do
      value :STATE_UNSPECIFIED, 0
      value :ACTIVE, 2
      value :DELETED, 4
    end
    add_message "google.cloud.speech.v2.CreateCustomClassRequest" do
      optional :custom_class, :message, 1, "google.cloud.speech.v2.CustomClass"
      optional :validate_only, :bool, 2
      optional :custom_class_id, :string, 3
      optional :parent, :string, 4
    end
    add_message "google.cloud.speech.v2.ListCustomClassesRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :show_deleted, :bool, 4
    end
    add_message "google.cloud.speech.v2.ListCustomClassesResponse" do
      repeated :custom_classes, :message, 1, "google.cloud.speech.v2.CustomClass"
      optional :next_page_token, :string, 2
    end
    add_message "google.cloud.speech.v2.GetCustomClassRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.speech.v2.UpdateCustomClassRequest" do
      optional :custom_class, :message, 1, "google.cloud.speech.v2.CustomClass"
      optional :update_mask, :message, 2, "google.protobuf.FieldMask"
      optional :validate_only, :bool, 4
    end
    add_message "google.cloud.speech.v2.DeleteCustomClassRequest" do
      optional :name, :string, 1
      optional :validate_only, :bool, 2
      optional :allow_missing, :bool, 4
      optional :etag, :string, 3
    end
    add_message "google.cloud.speech.v2.UndeleteCustomClassRequest" do
      optional :name, :string, 1
      optional :validate_only, :bool, 3
      optional :etag, :string, 4
    end
    add_message "google.cloud.speech.v2.CreatePhraseSetRequest" do
      optional :phrase_set, :message, 1, "google.cloud.speech.v2.PhraseSet"
      optional :validate_only, :bool, 2
      optional :phrase_set_id, :string, 3
      optional :parent, :string, 4
    end
    add_message "google.cloud.speech.v2.ListPhraseSetsRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :show_deleted, :bool, 4
    end
    add_message "google.cloud.speech.v2.ListPhraseSetsResponse" do
      repeated :phrase_sets, :message, 1, "google.cloud.speech.v2.PhraseSet"
      optional :next_page_token, :string, 2
    end
    add_message "google.cloud.speech.v2.GetPhraseSetRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.speech.v2.UpdatePhraseSetRequest" do
      optional :phrase_set, :message, 1, "google.cloud.speech.v2.PhraseSet"
      optional :update_mask, :message, 2, "google.protobuf.FieldMask"
      optional :validate_only, :bool, 4
    end
    add_message "google.cloud.speech.v2.DeletePhraseSetRequest" do
      optional :name, :string, 1
      optional :validate_only, :bool, 2
      optional :allow_missing, :bool, 4
      optional :etag, :string, 3
    end
    add_message "google.cloud.speech.v2.UndeletePhraseSetRequest" do
      optional :name, :string, 1
      optional :validate_only, :bool, 3
      optional :etag, :string, 4
    end
  end
end

module Google
  module Cloud
    module Speech
      module V2
        CreateRecognizerRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.CreateRecognizerRequest").msgclass
        OperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.OperationMetadata").msgclass
        ListRecognizersRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.ListRecognizersRequest").msgclass
        ListRecognizersResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.ListRecognizersResponse").msgclass
        GetRecognizerRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.GetRecognizerRequest").msgclass
        UpdateRecognizerRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.UpdateRecognizerRequest").msgclass
        DeleteRecognizerRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.DeleteRecognizerRequest").msgclass
        UndeleteRecognizerRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.UndeleteRecognizerRequest").msgclass
        Recognizer = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.Recognizer").msgclass
        Recognizer::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.Recognizer.State").enummodule
        AutoDetectDecodingConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.AutoDetectDecodingConfig").msgclass
        ExplicitDecodingConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.ExplicitDecodingConfig").msgclass
        ExplicitDecodingConfig::AudioEncoding = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.ExplicitDecodingConfig.AudioEncoding").enummodule
        SpeakerDiarizationConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.SpeakerDiarizationConfig").msgclass
        RecognitionFeatures = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.RecognitionFeatures").msgclass
        RecognitionFeatures::MultiChannelMode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.RecognitionFeatures.MultiChannelMode").enummodule
        SpeechAdaptation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.SpeechAdaptation").msgclass
        SpeechAdaptation::AdaptationPhraseSet = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.SpeechAdaptation.AdaptationPhraseSet").msgclass
        RecognitionConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.RecognitionConfig").msgclass
        RecognizeRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.RecognizeRequest").msgclass
        RecognitionResponseMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.RecognitionResponseMetadata").msgclass
        SpeechRecognitionAlternative = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.SpeechRecognitionAlternative").msgclass
        WordInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.WordInfo").msgclass
        SpeechRecognitionResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.SpeechRecognitionResult").msgclass
        RecognizeResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.RecognizeResponse").msgclass
        StreamingRecognitionFeatures = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.StreamingRecognitionFeatures").msgclass
        StreamingRecognitionFeatures::VoiceActivityTimeout = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.StreamingRecognitionFeatures.VoiceActivityTimeout").msgclass
        StreamingRecognitionConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.StreamingRecognitionConfig").msgclass
        StreamingRecognizeRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.StreamingRecognizeRequest").msgclass
        BatchRecognizeRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.BatchRecognizeRequest").msgclass
        GcsOutputConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.GcsOutputConfig").msgclass
        InlineOutputConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.InlineOutputConfig").msgclass
        RecognitionOutputConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.RecognitionOutputConfig").msgclass
        BatchRecognizeResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.BatchRecognizeResponse").msgclass
        BatchRecognizeResults = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.BatchRecognizeResults").msgclass
        BatchRecognizeFileResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.BatchRecognizeFileResult").msgclass
        BatchRecognizeTranscriptionMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.BatchRecognizeTranscriptionMetadata").msgclass
        BatchRecognizeMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.BatchRecognizeMetadata").msgclass
        BatchRecognizeFileMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.BatchRecognizeFileMetadata").msgclass
        StreamingRecognitionResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.StreamingRecognitionResult").msgclass
        StreamingRecognizeResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.StreamingRecognizeResponse").msgclass
        StreamingRecognizeResponse::SpeechEventType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.StreamingRecognizeResponse.SpeechEventType").enummodule
        Config = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.Config").msgclass
        GetConfigRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.GetConfigRequest").msgclass
        UpdateConfigRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.UpdateConfigRequest").msgclass
        CustomClass = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.CustomClass").msgclass
        CustomClass::ClassItem = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.CustomClass.ClassItem").msgclass
        CustomClass::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.CustomClass.State").enummodule
        PhraseSet = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.PhraseSet").msgclass
        PhraseSet::Phrase = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.PhraseSet.Phrase").msgclass
        PhraseSet::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.PhraseSet.State").enummodule
        CreateCustomClassRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.CreateCustomClassRequest").msgclass
        ListCustomClassesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.ListCustomClassesRequest").msgclass
        ListCustomClassesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.ListCustomClassesResponse").msgclass
        GetCustomClassRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.GetCustomClassRequest").msgclass
        UpdateCustomClassRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.UpdateCustomClassRequest").msgclass
        DeleteCustomClassRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.DeleteCustomClassRequest").msgclass
        UndeleteCustomClassRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.UndeleteCustomClassRequest").msgclass
        CreatePhraseSetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.CreatePhraseSetRequest").msgclass
        ListPhraseSetsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.ListPhraseSetsRequest").msgclass
        ListPhraseSetsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.ListPhraseSetsResponse").msgclass
        GetPhraseSetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.GetPhraseSetRequest").msgclass
        UpdatePhraseSetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.UpdatePhraseSetRequest").msgclass
        DeletePhraseSetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.DeletePhraseSetRequest").msgclass
        UndeletePhraseSetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v2.UndeletePhraseSetRequest").msgclass
      end
    end
  end
end
