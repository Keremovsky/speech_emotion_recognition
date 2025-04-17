// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChallengeHistoryModel _$ChallengeHistoryModelFromJson(
  Map<String, dynamic> json,
) => _ChallengeHistoryModel(
  id: (json['id'] as num).toInt(),
  user: (json['user'] as num).toInt(),
  challenge: (json['challenge'] as num).toInt(),
  score: (json['score'] as num).toDouble(),
  emotions:
      (json['emotions'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
  user_recording: const Base64Uint8ListConverter().fromJson(
    json['user_recording'] as String,
  ),
);

Map<String, dynamic> _$ChallengeHistoryModelToJson(
  _ChallengeHistoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'challenge': instance.challenge,
  'score': instance.score,
  'emotions': instance.emotions,
  'user_recording': const Base64Uint8ListConverter().toJson(
    instance.user_recording,
  ),
};
