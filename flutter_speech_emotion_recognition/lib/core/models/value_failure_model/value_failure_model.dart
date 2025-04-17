import 'package:flutter_speech_emotion_recognition/core/models/base_failure_model/base_failure_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'value_failure_model.freezed.dart';

@freezed
sealed class ValueFailureModel extends BaseFailureModel with _$ValueFailureModel {
  const ValueFailureModel._();
  const factory ValueFailureModel.invalidInput(String message) = _InvalidInput;
}
