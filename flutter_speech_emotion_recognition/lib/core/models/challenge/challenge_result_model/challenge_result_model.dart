import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_result_model.freezed.dart';
part 'challenge_result_model.g.dart';

@freezed
abstract class ChallengeResultModel with _$ChallengeResultModel {
  const factory ChallengeResultModel({
    required final double score,
    required final double average_score,
    required final List<double> challenge_emotions,
    required final List<double> emotions,
  }) = _ChallengeResultModel;

  factory ChallengeResultModel.fromJson(Map<String, Object?> json) =>
      _$ChallengeResultModelFromJson(json);
}
