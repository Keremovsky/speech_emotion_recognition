import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_model.freezed.dart';
part 'edit_profile_model.g.dart';

@freezed
abstract class EditProfileModel with _$EditProfileModel {
  const factory EditProfileModel({
    required final String username,
    required final String? profile_pic, // Can be a base64 string
  }) = _EditProfileModel;

  factory EditProfileModel.fromJson(Map<String, Object?> json) =>
      _$EditProfileModelFromJson(json);
}
