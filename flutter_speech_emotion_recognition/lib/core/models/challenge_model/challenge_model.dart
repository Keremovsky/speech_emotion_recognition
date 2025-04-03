import 'package:flutter/foundation.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/json_converters/base64_uint8list_converter.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_model.freezed.dart';
part 'challenge_model.g.dart';

@freezed
abstract class ChallengeModel with _$ChallengeModel {
  const factory ChallengeModel({
    required final int id,
    required final String title,
    required final String description,
    required final String sentence,
    required final String level,
    required final double average,
    required final List<double> emotions,
    @Base64Uint8ListConverter() required final Uint8List audioData,
  }) = _ChallengeModel;

  factory ChallengeModel.fromJson(Map<String, Object?> json) =>
      _$ChallengeModelFromJson(json);
}
