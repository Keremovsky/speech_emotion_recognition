import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_loading_indicator.dart';
import 'package:flutter_speech_emotion_recognition/core/components/failure_display.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/challenge_result_model/challenge_result_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge_history/pre_challenge_history/pre_challenge_history_model.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/feedback_util.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/controller/challenge_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/state/challenge_history_view_state.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/audio_player.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/level_box.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/result_chart.dart';

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
        actions: [
          IconButton(
            onPressed: () async {
              // TODO: add to json
              final areYouSure = await context.read<FeedbackUtil>().showMessageBox(
                context,
                "Are you sure?",
                "This challenge history will be removed. This action can't be removed.",
              );

              if (areYouSure == null || !areYouSure) return;

              if (mounted) {
                final result = await context
                    .read<ChallengeController>()
                    .removeChallengeHistory(widget.data.id);

                result.fold(
                  () {
                    context.back();
                    context.read<FeedbackUtil>().showSnackBar(context, "removed");
                  },
                  (error) {
                    // TODO: add message
                    context.read<FeedbackUtil>().showSnackBar(context, "error");
                  },
                );
              }
            },
            icon: Icon(Icons.remove),
          ),
        ],
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
                                  onPressed: () {
                                    onTryAgainButtonPressed(data.challenge_sentence);
                                  },
                                  child: Text("Try Again"),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return FailureDisplay(
                      error: "Unknown error.",
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
