// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFailureModel implements DiagnosticableTreeMixin {

 String get message;
/// Create a copy of AuthFailureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureModelCopyWith<AuthFailureModel> get copyWith => _$AuthFailureModelCopyWithImpl<AuthFailureModel>(this as AuthFailureModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthFailureModel'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailureModel&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthFailureModel(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthFailureModelCopyWith<$Res>  {
  factory $AuthFailureModelCopyWith(AuthFailureModel value, $Res Function(AuthFailureModel) _then) = _$AuthFailureModelCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthFailureModelCopyWithImpl<$Res>
    implements $AuthFailureModelCopyWith<$Res> {
  _$AuthFailureModelCopyWithImpl(this._self, this._then);

  final AuthFailureModel _self;
  final $Res Function(AuthFailureModel) _then;

/// Create a copy of AuthFailureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _RefreshTokenNull extends AuthFailureModel with DiagnosticableTreeMixin {
  const _RefreshTokenNull(this.message): super._();
  

@override final  String message;

/// Create a copy of AuthFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenNullCopyWith<_RefreshTokenNull> get copyWith => __$RefreshTokenNullCopyWithImpl<_RefreshTokenNull>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthFailureModel.refreshTokenNull'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenNull&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthFailureModel.refreshTokenNull(message: $message)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenNullCopyWith<$Res> implements $AuthFailureModelCopyWith<$Res> {
  factory _$RefreshTokenNullCopyWith(_RefreshTokenNull value, $Res Function(_RefreshTokenNull) _then) = __$RefreshTokenNullCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$RefreshTokenNullCopyWithImpl<$Res>
    implements _$RefreshTokenNullCopyWith<$Res> {
  __$RefreshTokenNullCopyWithImpl(this._self, this._then);

  final _RefreshTokenNull _self;
  final $Res Function(_RefreshTokenNull) _then;

/// Create a copy of AuthFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_RefreshTokenNull(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RefreshTokenExpired extends AuthFailureModel with DiagnosticableTreeMixin {
  const _RefreshTokenExpired(this.message): super._();
  

@override final  String message;

/// Create a copy of AuthFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenExpiredCopyWith<_RefreshTokenExpired> get copyWith => __$RefreshTokenExpiredCopyWithImpl<_RefreshTokenExpired>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthFailureModel.refreshTokenExpired'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenExpired&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthFailureModel.refreshTokenExpired(message: $message)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenExpiredCopyWith<$Res> implements $AuthFailureModelCopyWith<$Res> {
  factory _$RefreshTokenExpiredCopyWith(_RefreshTokenExpired value, $Res Function(_RefreshTokenExpired) _then) = __$RefreshTokenExpiredCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$RefreshTokenExpiredCopyWithImpl<$Res>
    implements _$RefreshTokenExpiredCopyWith<$Res> {
  __$RefreshTokenExpiredCopyWithImpl(this._self, this._then);

  final _RefreshTokenExpired _self;
  final $Res Function(_RefreshTokenExpired) _then;

/// Create a copy of AuthFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_RefreshTokenExpired(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
