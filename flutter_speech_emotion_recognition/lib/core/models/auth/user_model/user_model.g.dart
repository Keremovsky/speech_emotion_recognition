// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  access: json['access'] as String,
  refresh: json['refresh'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  profile_pic: json['profile_pic'] as String,
  register_day: const RegisterDateConverter().fromJson(
    json['register_day'] as String,
  ),
);

Map<String, dynamic> _$UserModelToJson(
  _UserModel instance,
) => <String, dynamic>{
  'access': instance.access,
  'refresh': instance.refresh,
  'username': instance.username,
  'email': instance.email,
  'profile_pic': instance.profile_pic,
  'register_day': const RegisterDateConverter().toJson(instance.register_day),
};
