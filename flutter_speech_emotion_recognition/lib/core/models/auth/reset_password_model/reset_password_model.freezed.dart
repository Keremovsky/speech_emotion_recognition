// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetPasswordModel {

 String get email; String get pin; String get new_password;
/// Create a copy of ResetPasswordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordModelCopyWith<ResetPasswordModel> get copyWith => _$ResetPasswordModelCopyWithImpl<ResetPasswordModel>(this as ResetPasswordModel, _$identity);

  /// Serializes this ResetPasswordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordModel&&(identical(other.email, email) || other.email == email)&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.new_password, new_password) || other.new_password == new_password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,pin,new_password);

@override
String toString() {
  return 'ResetPasswordModel(email: $email, pin: $pin, new_password: $new_password)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordModelCopyWith<$Res>  {
  factory $ResetPasswordModelCopyWith(ResetPasswordModel value, $Res Function(ResetPasswordModel) _then) = _$ResetPasswordModelCopyWithImpl;
@useResult
$Res call({
 String email, String pin, String new_password
});




}
/// @nodoc
class _$ResetPasswordModelCopyWithImpl<$Res>
    implements $ResetPasswordModelCopyWith<$Res> {
  _$ResetPasswordModelCopyWithImpl(this._self, this._then);

  final ResetPasswordModel _self;
  final $Res Function(ResetPasswordModel) _then;

/// Create a copy of ResetPasswordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? pin = null,Object? new_password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,pin: null == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String,new_password: null == new_password ? _self.new_password : new_password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ResetPasswordModel implements ResetPasswordModel {
  const _ResetPasswordModel({required this.email, required this.pin, required this.new_password});
  factory _ResetPasswordModel.fromJson(Map<String, dynamic> json) => _$ResetPasswordModelFromJson(json);

@override final  String email;
@override final  String pin;
@override final  String new_password;

/// Create a copy of ResetPasswordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordModelCopyWith<_ResetPasswordModel> get copyWith => __$ResetPasswordModelCopyWithImpl<_ResetPasswordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetPasswordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordModel&&(identical(other.email, email) || other.email == email)&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.new_password, new_password) || other.new_password == new_password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,pin,new_password);

@override
String toString() {
  return 'ResetPasswordModel(email: $email, pin: $pin, new_password: $new_password)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordModelCopyWith<$Res> implements $ResetPasswordModelCopyWith<$Res> {
  factory _$ResetPasswordModelCopyWith(_ResetPasswordModel value, $Res Function(_ResetPasswordModel) _then) = __$ResetPasswordModelCopyWithImpl;
@override @useResult
$Res call({
 String email, String pin, String new_password
});




}
/// @nodoc
class __$ResetPasswordModelCopyWithImpl<$Res>
    implements _$ResetPasswordModelCopyWith<$Res> {
  __$ResetPasswordModelCopyWithImpl(this._self, this._then);

  final _ResetPasswordModel _self;
  final $Res Function(_ResetPasswordModel) _then;

/// Create a copy of ResetPasswordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? pin = null,Object? new_password = null,}) {
  return _then(_ResetPasswordModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,pin: null == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String,new_password: null == new_password ? _self.new_password : new_password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
