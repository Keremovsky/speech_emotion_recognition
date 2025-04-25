import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_model.freezed.dart';
part 'pin_model.g.dart';

@freezed
abstract class PinModel with _$PinModel {
  const factory PinModel({required final String email, required final String pin}) =
      _PinModel;

  factory PinModel.fromJson(Map<String, Object?> json) => _$PinModelFromJson(json);
}
