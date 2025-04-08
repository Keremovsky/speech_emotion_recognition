import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_loading_indicator.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/state/challenge_view_state.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/audio_player.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/challenge_action_bottom_sheet.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/level_box.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/previous_challenge_score_box.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

@RoutePage()
class ChallengeView extends StatefulWidget {
  final File? file;

  const ChallengeView({super.key, this.file});

  @override
  ChallengeViewState createState() => _ChallengeViewState();
}

class _ChallengeViewState extends ChallengeViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dune: Paul Muad’dib vs Shaddam"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                final error = snapshot.error! as Exception;

                return _Failure(error: error);
              } else {
                return _Success(file: file);
              }
            }
            return CustomLoadingIndicator();
          },
        ),
      ),
    );
  }
}

class _Failure extends StatelessWidget {
  final Exception error;

  const _Failure({required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Detailed Error Text"),
        IconButton(onPressed: () {}, icon: Icon(Icons.refresh, size: 42.r)),
        Text(error.toString()),
      ],
    );
  }
}

class _Success extends StatelessWidget {
  final File file;

  const _Success({required this.file});

  @override
  Widget build(BuildContext context) {
    final String sentence = "Your feet! You’ll be lucky to keep your head.";
    final String description =
        "First part “Your feet!” will be voiced aggressively and energetic. For the second part, “You’ll be lucky to keep your head”, will contain anger as well but not that aggressive as first part.";

    return Padding(
      padding: EdgeInsets.all(SizeConstants.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(height: 125.h, width: 330.w, child: AudioPlayer(file: file)),
            ],
          ),
          Text(sentence, style: context.displayLarge),
          Divider(),
          Text(description, style: context.displayLarge),
          SizedBox(height: 8.h),
          LevelBox(level: "Intermediate"),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ChallengeActionBottomSheet(
                        title: "Dune: Paul Muad’dib vs Shaddam",
                        sentence: sentence,
                      );
                    },
                  );
                },
                child: Text(LocaleKeys.startTheChallenge.tr()),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocaleKeys.bestScore.tr(), style: context.displayLarge),
                  SizedBox(height: 4.h),
                  PreviousChallengeScoreBox(
                    onPressed: () {
                      log("AAAAAAAAAAAAAAA");
                    },
                    score: 80.2145,
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
                            onPressed: () {
                              log("AAAAAAAAAAAAAAA");
                            },
                            score: 80,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 8.w);
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
