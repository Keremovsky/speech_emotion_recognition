// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResetPasswordModel _$ResetPasswordModelFromJson(Map<String, dynamic> json) =>
    _ResetPasswordModel(
      email: json['email'] as String,
      pin: json['pin'] as String,
      new_password: json['new_password'] as String,
    );

Map<String, dynamic> _$ResetPasswordModelToJson(_ResetPasswordModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'pin': instance.pin,
      'new_password': instance.new_password,
    };
