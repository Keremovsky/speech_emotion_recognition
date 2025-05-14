import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_loading_indicator.dart';
import 'package:flutter_speech_emotion_recognition/core/components/failure_display.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/challenge_result_model/challenge_result_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/pre_challenge_model/pre_challenge_model.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/state/challenge_view_state.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/audio_player.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/level_box.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/previous_challenge_score_box.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

@RoutePage()
class ChallengeView extends StatefulWidget {
  final PreChallengeModel data;

  const ChallengeView({super.key, required this.data});

  @override
  ChallengeViewState createState() => _ChallengeViewState();
}

class _ChallengeViewState extends ChallengeViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.data.title), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConstants.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 125.h,
                    width: 330.w,
                    child: AudioPlayer(challengeId: widget.data.id),
                  ),
                ],
              ),
              Text(widget.data.sentence, style: context.displayLarge),
              Divider(),
              Text(widget.data.description, style: context.displayLarge),
              SizedBox(height: 8.h),
              LevelBox(level: widget.data.level),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: onStartTheChallengePressed,
                    child: Text(LocaleKeys.startTheChallenge.tr()),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              FutureBuilder(
                future: value,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      final error = snapshot.error!;

                      return FailureDisplay(
                        error: error.toString(),
                        refresh: onRefreshPressed,
                      );
                    } else {
                      final result = snapshot.data;

                      if (result != null) {
                        return result.fold(
                          (error) {
                            return FailureDisplay(
                              error: error,
                              refresh: onRefreshPressed,
                            );
                          },
                          (data) {
                            if (data.isEmpty) {
                              return FailureDisplay(
                                error: LocaleKeys.historyEmpty.tr(),
                              );
                            }

                            ChallengeResultModel bestScoreModel = data[0];
                            for (final item in data) {
                              if (bestScoreModel.score < item.score) {
                                bestScoreModel = item;
                              }
                            }

                            return Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.bestScore.tr(),
                                      style: context.displayLarge,
                                    ),
                                    SizedBox(height: 4.h),
                                    PreviousChallengeScoreBox(
                                      onPressed:
                                          () => onChallengeHistoryBoxPressed(
                                            bestScoreModel,
                                          ),
                                      score: bestScoreModel.score,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 16.w),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        LocaleKeys.previousScores.tr(),
                                        style: context.displayLarge,
                                      ),
                                      SizedBox(height: 4.h),
                                      SizedBox(
                                        height: 70.h,
                                        child: ListView.separated(
                                          itemBuilder: (context, index) {
                                            return PreviousChallengeScoreBox(
                                              onPressed:
                                                  () => onChallengeHistoryBoxPressed(
                                                    data[index],
                                                  ),
                                              score: data[index].score,
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return SizedBox(width: 8.w);
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemCount: data.length,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        return FailureDisplay(
                          error: LocaleKeys.unknownError.tr(),
                          refresh: onRefreshPressed,
                        );
                      }
                    }
                  }

                  return CustomLoadingIndicator(
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
