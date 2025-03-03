// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_failure_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConnectionFailureModel implements DiagnosticableTreeMixin {

 String get message;
/// Create a copy of ConnectionFailureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionFailureModelCopyWith<ConnectionFailureModel> get copyWith => _$ConnectionFailureModelCopyWithImpl<ConnectionFailureModel>(this as ConnectionFailureModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ConnectionFailureModel'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionFailureModel&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ConnectionFailureModel(message: $message)';
}


}

/// @nodoc
abstract mixin class $ConnectionFailureModelCopyWith<$Res>  {
  factory $ConnectionFailureModelCopyWith(ConnectionFailureModel value, $Res Function(ConnectionFailureModel) _then) = _$ConnectionFailureModelCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ConnectionFailureModelCopyWithImpl<$Res>
    implements $ConnectionFailureModelCopyWith<$Res> {
  _$ConnectionFailureModelCopyWithImpl(this._self, this._then);

  final ConnectionFailureModel _self;
  final $Res Function(ConnectionFailureModel) _then;

/// Create a copy of ConnectionFailureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _UnknownError with DiagnosticableTreeMixin implements ConnectionFailureModel {
  const _UnknownError(this.message);
  

@override final  String message;

/// Create a copy of ConnectionFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnknownErrorCopyWith<_UnknownError> get copyWith => __$UnknownErrorCopyWithImpl<_UnknownError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ConnectionFailureModel.unknownError'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnknownError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ConnectionFailureModel.unknownError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnknownErrorCopyWith<$Res> implements $ConnectionFailureModelCopyWith<$Res> {
  factory _$UnknownErrorCopyWith(_UnknownError value, $Res Function(_UnknownError) _then) = __$UnknownErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnknownErrorCopyWithImpl<$Res>
    implements _$UnknownErrorCopyWith<$Res> {
  __$UnknownErrorCopyWithImpl(this._self, this._then);

  final _UnknownError _self;
  final $Res Function(_UnknownError) _then;

/// Create a copy of ConnectionFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_UnknownError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NoConnection with DiagnosticableTreeMixin implements ConnectionFailureModel {
  const _NoConnection(this.message);
  

@override final  String message;

/// Create a copy of ConnectionFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoConnectionCopyWith<_NoConnection> get copyWith => __$NoConnectionCopyWithImpl<_NoConnection>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ConnectionFailureModel.noConnection'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoConnection&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ConnectionFailureModel.noConnection(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NoConnectionCopyWith<$Res> implements $ConnectionFailureModelCopyWith<$Res> {
  factory _$NoConnectionCopyWith(_NoConnection value, $Res Function(_NoConnection) _then) = __$NoConnectionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NoConnectionCopyWithImpl<$Res>
    implements _$NoConnectionCopyWith<$Res> {
  __$NoConnectionCopyWithImpl(this._self, this._then);

  final _NoConnection _self;
  final $Res Function(_NoConnection) _then;

/// Create a copy of ConnectionFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NoConnection(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ConnectionTimedOut with DiagnosticableTreeMixin implements ConnectionFailureModel {
  const _ConnectionTimedOut(this.message);
  

@override final  String message;

/// Create a copy of ConnectionFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionTimedOutCopyWith<_ConnectionTimedOut> get copyWith => __$ConnectionTimedOutCopyWithImpl<_ConnectionTimedOut>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ConnectionFailureModel.connectionTimedOut'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionTimedOut&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ConnectionFailureModel.connectionTimedOut(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ConnectionTimedOutCopyWith<$Res> implements $ConnectionFailureModelCopyWith<$Res> {
  factory _$ConnectionTimedOutCopyWith(_ConnectionTimedOut value, $Res Function(_ConnectionTimedOut) _then) = __$ConnectionTimedOutCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ConnectionTimedOutCopyWithImpl<$Res>
    implements _$ConnectionTimedOutCopyWith<$Res> {
  __$ConnectionTimedOutCopyWithImpl(this._self, this._then);

  final _ConnectionTimedOut _self;
  final $Res Function(_ConnectionTimedOut) _then;

/// Create a copy of ConnectionFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ConnectionTimedOut(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ResponseError with DiagnosticableTreeMixin implements ConnectionFailureModel {
  const _ResponseError(this.message);
  

@override final  String message;

/// Create a copy of ConnectionFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseErrorCopyWith<_ResponseError> get copyWith => __$ResponseErrorCopyWithImpl<_ResponseError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ConnectionFailureModel.responseError'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ConnectionFailureModel.responseError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ResponseErrorCopyWith<$Res> implements $ConnectionFailureModelCopyWith<$Res> {
  factory _$ResponseErrorCopyWith(_ResponseError value, $Res Function(_ResponseError) _then) = __$ResponseErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ResponseErrorCopyWithImpl<$Res>
    implements _$ResponseErrorCopyWith<$Res> {
  __$ResponseErrorCopyWithImpl(this._self, this._then);

  final _ResponseError _self;
  final $Res Function(_ResponseError) _then;

/// Create a copy of ConnectionFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ResponseError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
