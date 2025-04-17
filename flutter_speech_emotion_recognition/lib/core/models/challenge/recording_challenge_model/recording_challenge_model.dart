import 'package:flutter/foundation.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/json_converters/base64_uint8list_converter.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recording_challenge_model.freezed.dart';
part 'recording_challenge_model.g.dart';

@freezed
abstract class RecordingChallengeModel with _$RecordingChallengeModel {
  const factory RecordingChallengeModel({
    @Base64Uint8ListConverter() required final Uint8List recording,
  }) = _RecordingChallengeModel;

  factory RecordingChallengeModel.fromJson(Map<String, Object?> json) =>
      _$RecordingChallengeModelFromJson(json);
}
