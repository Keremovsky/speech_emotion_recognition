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
import 'package:flutter_speech_emotion_recognition/core/models/challenge_history/pre_challenge_history/pre_challenge_history_model.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/state/challenge_history_view_state.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/audio_player.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/level_box.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/result_chart.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

@RoutePage()
class ChallengeHistoryView extends StatefulWidget {
  final PreChallengeHistoryModel data;

  const ChallengeHistoryView({super.key, required this.data});

  @override
  ChallengeHistoryViewState createState() => _ChallengeHistoryView();
}

class _ChallengeHistoryView extends ChallengeHistoryViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.challenge_title),
        centerTitle: true,
        actions: [IconButton(onPressed: onRemovePressed, icon: Icon(Icons.remove))],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConstants.screenPadding),
          child: FutureBuilder(
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
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 125.h,
                                  width: 330.w,
                                  child: AudioPlayer(
                                    challengeId: widget.data.challenge_id,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              data.challenge_sentence,
                              style: context.displayLarge,
                            ),
                            Divider(),
                            Text(
                              data.challenge_description,
                              style: context.displayLarge,
                            ),
                            SizedBox(height: 8.h),
                            LevelBox(level: data.challenge_level),
                            SizedBox(height: 8.h),
                            ResultChart(
                              model: ChallengeResultModel(
                                score: data.score,
                                average_score: data.challenge_average,
                                challenge_emotions: data.challenge_emotions,
                                emotions: data.emotions,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  onPressed: () async {
                                    await onTryAgainButtonPressed(
                                      data.challenge_sentence,
                                    );
                                  },
                                  child: Text(LocaleKeys.tryAgain.tr()),
                                ),
                              ],
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
        ),
      ),
    );
  }
}
