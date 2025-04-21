import 'dart:typed_data';

import 'package:flutter_speech_emotion_recognition/core/utils/json_converters/base64_uint8list_converter.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/json_converters/level_int_to_string_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_challenge_history_model.freezed.dart';
part 'post_challenge_history_model.g.dart';

@freezed
abstract class PostChallengeHistoryModel with _$PostChallengeHistoryModel {
  const factory PostChallengeHistoryModel({
    required final String challenge_description,
    required final String challenge_sentence,
    @LevelIntToStringConverter() required final String challenge_level,
    required final double challenge_average,
    required final List<double> challenge_emotions,
    required final List<double> emotions,
    required final double score,
    @Base64Uint8ListConverter() required final Uint8List challenge_recording,
  }) = _PostChallengeHistoryModel;

  factory PostChallengeHistoryModel.fromJson(Map<String, Object?> json) =>
      _$PostChallengeHistoryModelFromJson(json);
}
