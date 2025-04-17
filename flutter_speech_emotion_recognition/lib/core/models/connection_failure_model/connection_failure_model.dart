import 'package:flutter_speech_emotion_recognition/core/models/base_failure_model/base_failure_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'connection_failure_model.freezed.dart';

@freezed
sealed class ConnectionFailureModel extends BaseFailureModel
    with _$ConnectionFailureModel {
  const ConnectionFailureModel._();
  const factory ConnectionFailureModel.unknownError(String message) = _UnknownError;
  const factory ConnectionFailureModel.noConnection(String message) = _NoConnection;
  const factory ConnectionFailureModel.connectionTimedOut(String message) =
      _ConnectionTimedOut;
  const factory ConnectionFailureModel.responseError(String message) =
      _ResponseError;
}
