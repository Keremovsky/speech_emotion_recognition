// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChallengeModel _$ChallengeModelFromJson(Map<String, dynamic> json) =>
    _ChallengeModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      sentence: json['sentence'] as String,
      level: json['level'] as String,
      average: (json['average'] as num).toDouble(),
      emotions:
          (json['emotions'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList(),
      audioData: const Base64Uint8ListConverter().fromJson(
        json['audioData'] as String,
      ),
    );

Map<String, dynamic> _$ChallengeModelToJson(_ChallengeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'sentence': instance.sentence,
      'level': instance.level,
      'average': instance.average,
      'emotions': instance.emotions,
      'audioData': const Base64Uint8ListConverter().toJson(instance.audioData),
    };
