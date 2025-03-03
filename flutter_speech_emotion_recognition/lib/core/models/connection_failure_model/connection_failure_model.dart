import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'connection_failure_model.freezed.dart';

@freezed
sealed class ConnectionFailureModel with _$ConnectionFailureModel {
  const factory ConnectionFailureModel.unknownError(String message) = _UnknownError;
  const factory ConnectionFailureModel.noConnection(String message) = _NoConnection;
  const factory ConnectionFailureModel.connectionTimedOut(String message) = _ConnectionTimedOut;
  const factory ConnectionFailureModel.responseError(String message) = _ResponseError;
}