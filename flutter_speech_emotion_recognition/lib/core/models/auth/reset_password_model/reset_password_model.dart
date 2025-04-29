import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_model.freezed.dart';
part 'reset_password_model.g.dart';

@freezed
abstract class ResetPasswordModel with _$ResetPasswordModel {
  const factory ResetPasswordModel({
    required final String email,
    required final String pin,
    required final String new_password,
  }) = _ResetPasswordModel;

  factory ResetPasswordModel.fromJson(Map<String, Object?> json) =>
      _$ResetPasswordModelFromJson(json);
}
