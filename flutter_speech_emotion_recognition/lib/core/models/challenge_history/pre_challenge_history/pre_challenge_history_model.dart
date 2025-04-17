import 'package:freezed_annotation/freezed_annotation.dart';

part 'pre_challenge_history_model.freezed.dart';
part 'pre_challenge_history_model.g.dart';

@freezed
abstract class PreChallengeHistoryModel with _$PreChallengeHistoryModel {
  const factory PreChallengeHistoryModel({
    required final int id,
    required final String challenge_title,
    required final double score,
  }) = _PreChallengeHistoryModel;

  factory PreChallengeHistoryModel.fromJson(Map<String, Object?> json) =>
      _$PreChallengeHistoryModelFromJson(json);
}
