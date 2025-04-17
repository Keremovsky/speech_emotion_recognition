// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecordingChallengeModel _$RecordingChallengeModelFromJson(
  Map<String, dynamic> json,
) => _RecordingChallengeModel(
  recording: const Base64Uint8ListConverter().fromJson(
    json['recording'] as String,
  ),
);

Map<String, dynamic> _$RecordingChallengeModelToJson(
  _RecordingChallengeModel instance,
) => <String, dynamic>{
  'recording': const Base64Uint8ListConverter().toJson(instance.recording),
};
