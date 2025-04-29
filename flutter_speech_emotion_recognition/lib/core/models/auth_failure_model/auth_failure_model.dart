import 'package:flutter_speech_emotion_recognition/core/models/base_failure_model/base_failure_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth_failure_model.freezed.dart';

@freezed
sealed class AuthFailureModel extends BaseFailureModel with _$AuthFailureModel {
  const AuthFailureModel._();
  const factory AuthFailureModel.refreshTokenNull(String message) =
      _RefreshTokenNull;
  const factory AuthFailureModel.refreshTokenExpired(String message) =
      _RefreshTokenExpired;
  const factory AuthFailureModel.exitError(String message) = _ExitError;
}
