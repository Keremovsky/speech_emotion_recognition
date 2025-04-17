import 'package:flutter_speech_emotion_recognition/core/models/base_failure_model/base_failure_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'type_failure_model.freezed.dart';

@freezed
sealed class TypeFailureModel extends BaseFailureModel with _$TypeFailureModel {
  const TypeFailureModel._();
  const factory TypeFailureModel.invalidType(String message) = _InvalidType;
}
