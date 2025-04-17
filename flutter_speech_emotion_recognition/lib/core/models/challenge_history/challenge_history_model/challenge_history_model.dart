import 'package:flutter/foundation.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/json_converters/base64_uint8list_converter.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_history_model.freezed.dart';
part 'challenge_history_model.g.dart';

@freezed
abstract class ChallengeHistoryModel with _$ChallengeHistoryModel {
  const factory ChallengeHistoryModel({
    required final int id,
    required final int user,
    required final int challenge,
    required final double score,
    required final List<double> emotions,
    @Base64Uint8ListConverter() required final Uint8List user_recording,
  }) = _ChallengeHistoryModel;

  factory ChallengeHistoryModel.fromJson(Map<String, Object?> json) =>
      _$ChallengeHistoryModelFromJson(json);
}
