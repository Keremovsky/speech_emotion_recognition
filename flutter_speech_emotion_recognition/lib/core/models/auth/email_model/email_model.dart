import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_model.freezed.dart';
part 'email_model.g.dart';

@freezed
abstract class EmailModel with _$EmailModel {
  const factory EmailModel({required final String email}) = _EmailModel;

  factory EmailModel.fromJson(Map<String, Object?> json) =>
      _$EmailModelFromJson(json);
}
