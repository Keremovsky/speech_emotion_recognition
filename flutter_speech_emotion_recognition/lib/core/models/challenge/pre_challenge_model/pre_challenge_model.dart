import 'package:flutter_speech_emotion_recognition/core/utils/json_converters/level_int_to_string_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pre_challenge_model.freezed.dart';
part 'pre_challenge_model.g.dart';

@freezed
abstract class PreChallengeModel with _$PreChallengeModel {
  const factory PreChallengeModel({
    required final int id,
    required final String title,
    required final String description,
    required final String sentence,
    @LevelIntToStringConverter() required final String level,
  }) = _PreChallengeModel;

  factory PreChallengeModel.fromJson(Map<String, Object?> json) =>
      _$PreChallengeModelFromJson(json);
}
