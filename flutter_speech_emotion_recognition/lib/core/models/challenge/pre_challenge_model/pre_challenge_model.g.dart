// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PreChallengeModel _$PreChallengeModelFromJson(Map<String, dynamic> json) =>
    _PreChallengeModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      sentence: json['sentence'] as String,
      level: const LevelIntToStringConverter().fromJson(
        (json['level'] as num).toInt(),
      ),
    );

Map<String, dynamic> _$PreChallengeModelToJson(_PreChallengeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'sentence': instance.sentence,
      'level': const LevelIntToStringConverter().toJson(instance.level),
    };
