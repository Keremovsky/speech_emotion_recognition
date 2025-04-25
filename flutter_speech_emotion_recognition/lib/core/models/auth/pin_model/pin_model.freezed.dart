// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PinModel {

 String get email; String get pin;
/// Create a copy of PinModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinModelCopyWith<PinModel> get copyWith => _$PinModelCopyWithImpl<PinModel>(this as PinModel, _$identity);

  /// Serializes this PinModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinModel&&(identical(other.email, email) || other.email == email)&&(identical(other.pin, pin) || other.pin == pin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,pin);

@override
String toString() {
  return 'PinModel(email: $email, pin: $pin)';
}


}

/// @nodoc
abstract mixin class $PinModelCopyWith<$Res>  {
  factory $PinModelCopyWith(PinModel value, $Res Function(PinModel) _then) = _$PinModelCopyWithImpl;
@useResult
$Res call({
 String email, String pin
});




}
/// @nodoc
class _$PinModelCopyWithImpl<$Res>
    implements $PinModelCopyWith<$Res> {
  _$PinModelCopyWithImpl(this._self, this._then);

  final PinModel _self;
  final $Res Function(PinModel) _then;

/// Create a copy of PinModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? pin = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,pin: null == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PinModel implements PinModel {
  const _PinModel({required this.email, required this.pin});
  factory _PinModel.fromJson(Map<String, dynamic> json) => _$PinModelFromJson(json);

@override final  String email;
@override final  String pin;

/// Create a copy of PinModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PinModelCopyWith<_PinModel> get copyWith => __$PinModelCopyWithImpl<_PinModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PinModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PinModel&&(identical(other.email, email) || other.email == email)&&(identical(other.pin, pin) || other.pin == pin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,pin);

@override
String toString() {
  return 'PinModel(email: $email, pin: $pin)';
}


}

/// @nodoc
abstract mixin class _$PinModelCopyWith<$Res> implements $PinModelCopyWith<$Res> {
  factory _$PinModelCopyWith(_PinModel value, $Res Function(_PinModel) _then) = __$PinModelCopyWithImpl;
@override @useResult
$Res call({
 String email, String pin
});




}
/// @nodoc
class __$PinModelCopyWithImpl<$Res>
    implements _$PinModelCopyWith<$Res> {
  __$PinModelCopyWithImpl(this._self, this._then);

  final _PinModel _self;
  final $Res Function(_PinModel) _then;

/// Create a copy of PinModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? pin = null,}) {
  return _then(_PinModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,pin: null == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
