import 'package:flutter/foundation.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/json_converters/base64_uint8list_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_request_model.freezed.dart';
part 'challenge_request_model.g.dart';

@freezed
abstract class ChallengeRequestModel with _$ChallengeRequestModel {
  const factory ChallengeRequestModel({
    @Base64Uint8ListConverter() required final Uint8List recording,
  }) = _ChallengeRequestModel;

  factory ChallengeRequestModel.fromJson(Map<String, Object?> json) =>
      _$ChallengeRequestModelFromJson(json);
}
