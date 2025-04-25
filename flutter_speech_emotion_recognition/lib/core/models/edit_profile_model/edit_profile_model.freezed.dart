// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditProfileModel {

 String? get username; set username(String? value); String? get profile_pic; set profile_pic(String? value);
/// Create a copy of EditProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditProfileModelCopyWith<EditProfileModel> get copyWith => _$EditProfileModelCopyWithImpl<EditProfileModel>(this as EditProfileModel, _$identity);

  /// Serializes this EditProfileModel to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'EditProfileModel(username: $username, profile_pic: $profile_pic)';
}


}

/// @nodoc
abstract mixin class $EditProfileModelCopyWith<$Res>  {
  factory $EditProfileModelCopyWith(EditProfileModel value, $Res Function(EditProfileModel) _then) = _$EditProfileModelCopyWithImpl;
@useResult
$Res call({
 String? username, String? profile_pic
});




}
/// @nodoc
class _$EditProfileModelCopyWithImpl<$Res>
    implements $EditProfileModelCopyWith<$Res> {
  _$EditProfileModelCopyWithImpl(this._self, this._then);

  final EditProfileModel _self;
  final $Res Function(EditProfileModel) _then;

/// Create a copy of EditProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = freezed,Object? profile_pic = freezed,}) {
  return _then(_self.copyWith(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profile_pic: freezed == profile_pic ? _self.profile_pic : profile_pic // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EditProfileModel implements EditProfileModel {
   _EditProfileModel({this.username, this.profile_pic});
  factory _EditProfileModel.fromJson(Map<String, dynamic> json) => _$EditProfileModelFromJson(json);

@override  String? username;
@override  String? profile_pic;

/// Create a copy of EditProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditProfileModelCopyWith<_EditProfileModel> get copyWith => __$EditProfileModelCopyWithImpl<_EditProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditProfileModelToJson(this, );
}



@override
String toString() {
  return 'EditProfileModel(username: $username, profile_pic: $profile_pic)';
}


}

/// @nodoc
abstract mixin class _$EditProfileModelCopyWith<$Res> implements $EditProfileModelCopyWith<$Res> {
  factory _$EditProfileModelCopyWith(_EditProfileModel value, $Res Function(_EditProfileModel) _then) = __$EditProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String? username, String? profile_pic
});




}
/// @nodoc
class __$EditProfileModelCopyWithImpl<$Res>
    implements _$EditProfileModelCopyWith<$Res> {
  __$EditProfileModelCopyWithImpl(this._self, this._then);

  final _EditProfileModel _self;
  final $Res Function(_EditProfileModel) _then;

/// Create a copy of EditProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = freezed,Object? profile_pic = freezed,}) {
  return _then(_EditProfileModel(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profile_pic: freezed == profile_pic ? _self.profile_pic : profile_pic // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
