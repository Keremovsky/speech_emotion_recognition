// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_failure_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TypeFailureModel implements DiagnosticableTreeMixin {

 String get message;
/// Create a copy of TypeFailureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypeFailureModelCopyWith<TypeFailureModel> get copyWith => _$TypeFailureModelCopyWithImpl<TypeFailureModel>(this as TypeFailureModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TypeFailureModel'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeFailureModel&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TypeFailureModel(message: $message)';
}


}

/// @nodoc
abstract mixin class $TypeFailureModelCopyWith<$Res>  {
  factory $TypeFailureModelCopyWith(TypeFailureModel value, $Res Function(TypeFailureModel) _then) = _$TypeFailureModelCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TypeFailureModelCopyWithImpl<$Res>
    implements $TypeFailureModelCopyWith<$Res> {
  _$TypeFailureModelCopyWithImpl(this._self, this._then);

  final TypeFailureModel _self;
  final $Res Function(TypeFailureModel) _then;

/// Create a copy of TypeFailureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _InvalidType extends TypeFailureModel with DiagnosticableTreeMixin {
  const _InvalidType(this.message): super._();
  

@override final  String message;

/// Create a copy of TypeFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvalidTypeCopyWith<_InvalidType> get copyWith => __$InvalidTypeCopyWithImpl<_InvalidType>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TypeFailureModel.invalidType'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidType&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TypeFailureModel.invalidType(message: $message)';
}


}

/// @nodoc
abstract mixin class _$InvalidTypeCopyWith<$Res> implements $TypeFailureModelCopyWith<$Res> {
  factory _$InvalidTypeCopyWith(_InvalidType value, $Res Function(_InvalidType) _then) = __$InvalidTypeCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$InvalidTypeCopyWithImpl<$Res>
    implements _$InvalidTypeCopyWith<$Res> {
  __$InvalidTypeCopyWithImpl(this._self, this._then);

  final _InvalidType _self;
  final $Res Function(_InvalidType) _then;

/// Create a copy of TypeFailureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_InvalidType(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
