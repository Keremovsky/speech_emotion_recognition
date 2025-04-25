import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_model.freezed.dart';
part 'edit_profile_model.g.dart';

@unfreezed
abstract class EditProfileModel with _$EditProfileModel {
  factory EditProfileModel({String? username, String? profile_pic}) =
      _EditProfileModel;

  factory EditProfileModel.fromJson(Map<String, Object?> json) =>
      _$EditProfileModelFromJson(json);
}
