// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChallengeResultModel _$ChallengeResultModelFromJson(
  Map<String, dynamic> json,
) => _ChallengeResultModel(
  score: (json['score'] as num).toDouble(),
  average_score: (json['average_score'] as num).toDouble(),
  challenge_emotions:
      (json['challenge_emotions'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
  emotions:
      (json['emotions'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
);

Map<String, dynamic> _$ChallengeResultModelToJson(
  _ChallengeResultModel instance,
) => <String, dynamic>{
  'score': instance.score,
  'average_score': instance.average_score,
  'challenge_emotions': instance.challenge_emotions,
  'emotions': instance.emotions,
};
