import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'value_failure_model.freezed.dart';

@freezed
sealed class ValueFailureModel with _$ValueFailureModel {
  const factory ValueFailureModel.invalidInput(String message) = _InvalidInput;
}