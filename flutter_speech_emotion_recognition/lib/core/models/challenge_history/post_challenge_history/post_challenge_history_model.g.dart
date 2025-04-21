// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_challenge_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostChallengeHistoryModel _$PostChallengeHistoryModelFromJson(
  Map<String, dynamic> json,
) => _PostChallengeHistoryModel(
  challenge_description: json['challenge_description'] as String,
  challenge_sentence: json['challenge_sentence'] as String,
  challenge_level: const LevelIntToStringConverter().fromJson(
    (json['challenge_level'] as num).toInt(),
  ),
  challenge_average: (json['challenge_average'] as num).toDouble(),
  challenge_emotions:
      (json['challenge_emotions'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
  emotions:
      (json['emotions'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
  score: (json['score'] as num).toDouble(),
  challenge_recording: const Base64Uint8ListConverter().fromJson(
    json['challenge_recording'] as String,
  ),
);

Map<String, dynamic> _$PostChallengeHistoryModelToJson(
  _PostChallengeHistoryModel instance,
) => <String, dynamic>{
  'challenge_description': instance.challenge_description,
  'challenge_sentence': instance.challenge_sentence,
  'challenge_level': const LevelIntToStringConverter().toJson(
    instance.challenge_level,
  ),
  'challenge_average': instance.challenge_average,
  'challenge_emotions': instance.challenge_emotions,
  'emotions': instance.emotions,
  'score': instance.score,
  'challenge_recording': const Base64Uint8ListConverter().toJson(
    instance.challenge_recording,
  ),
};
