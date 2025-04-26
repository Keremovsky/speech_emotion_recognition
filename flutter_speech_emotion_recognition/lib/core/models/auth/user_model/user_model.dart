import 'package:flutter_speech_emotion_recognition/core/utils/json_converters/profile_pic_converter.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/json_converters/register_date_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required final String access,
    required final String refresh,
    required final String username,
    required final String email,
    @ProfilePicConverter() required final String profile_pic,
    @RegisterDateConverter() required final String register_day,
  }) = _UserModel;

  factory UserModel.empty() => const UserModel(
    access: "",
    refresh: "",
    username: "",
    email: "",
    profile_pic: "",
    register_day: "",
  );

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
