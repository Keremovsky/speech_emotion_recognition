// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_challenge_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PreChallengeHistoryModel _$PreChallengeHistoryModelFromJson(
  Map<String, dynamic> json,
) => _PreChallengeHistoryModel(
  id: (json['id'] as num).toInt(),
  challenge_title: json['challenge_title'] as String,
  score: (json['score'] as num).toDouble(),
);

Map<String, dynamic> _$PreChallengeHistoryModelToJson(
  _PreChallengeHistoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'challenge_title': instance.challenge_title,
  'score': instance.score,
};
