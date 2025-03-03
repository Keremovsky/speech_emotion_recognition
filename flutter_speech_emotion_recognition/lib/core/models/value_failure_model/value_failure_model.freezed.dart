// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value_failure_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ValueFailureModel implements DiagnosticableTreeMixin {

 String get message;
/// Create a copy of ValueFailureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValueFailureModelCopyWith<ValueFailureModel> get copyWith => _$ValueFailureModelCopyWithImpl<ValueFailureModel>(this as ValueFailureModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ValueFailureModel'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValueFailureModel&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ValueFailureModel(message: $message)';
}


}

/// @nodoc
abstract mixin class $ValueFailureModelCopyWith<$Res>  {
  factory $ValueFailureModelCopyWith(ValueFailureModel value, $Res Function(ValueFailureModel) _then) = _$ValueFailureModelCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ValueFailureModelCopyWithImpl<$Res>
    implements $ValueFailureModelCopyWith<$Res> {
  _$ValueFailureModelCopyWithImpl(this._self, this._then);

  final ValueFailureModel _self;
  final $Res Function(ValueFailureModel) _then;

/// Create a copy of ValueFailureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _InvalidInput with DiagnosticableTreeMixin implements ValueFailureModel {
  const _InvalidInput(this.message);
  

@override final  String message;

/// Create a copy of ValueFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvalidInputCopyWith<_InvalidInput> get copyWith => __$InvalidInputCopyWithImpl<_InvalidInput>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ValueFailureModel.invalidInput'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidInput&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ValueFailureModel.invalidInput(message: $message)';
}


}

/// @nodoc
abstract mixin class _$InvalidInputCopyWith<$Res> implements $ValueFailureModelCopyWith<$Res> {
  factory _$InvalidInputCopyWith(_InvalidInput value, $Res Function(_InvalidInput) _then) = __$InvalidInputCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$InvalidInputCopyWithImpl<$Res>
    implements _$InvalidInputCopyWith<$Res> {
  __$InvalidInputCopyWithImpl(this._self, this._then);

  final _InvalidInput _self;
  final $Res Function(_InvalidInput) _then;

/// Create a copy of ValueFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_InvalidInput(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
