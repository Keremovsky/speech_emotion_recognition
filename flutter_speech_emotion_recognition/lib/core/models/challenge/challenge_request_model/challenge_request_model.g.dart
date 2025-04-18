// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChallengeRequestModel _$ChallengeRequestModelFromJson(
  Map<String, dynamic> json,
) => _ChallengeRequestModel(
  recording: const Base64Uint8ListConverter().fromJson(
    json['recording'] as String,
  ),
);

Map<String, dynamic> _$ChallengeRequestModelToJson(
  _ChallengeRequestModel instance,
) => <String, dynamic>{
  'recording': const Base64Uint8ListConverter().toJson(instance.recording),
};
