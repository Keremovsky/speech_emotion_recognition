import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_loading_indicator.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/state/challenge_view_state.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/audio_player.dart';

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
      appBar: AppBar(title: Text("Title of Challenge"), centerTitle: true),
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
        Text("Reload Page Button"),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(height: 125.h, width: 360.w, child: AudioPlayer(file: file)),
          ],
        ),
        Text("Details About Challenge and Level", style: context.titleMedium),
        Text("Start Challenge", style: context.titleMedium),
        Text("Previous Challenges", style: context.titleMedium),
      ],
    );
  }
}
