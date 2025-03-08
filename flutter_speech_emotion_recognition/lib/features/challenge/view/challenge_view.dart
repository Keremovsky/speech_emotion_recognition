import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/state/challenge_view_state.dart';

@RoutePage()
class ChallengeView extends StatefulWidget {
  const ChallengeView({super.key});

  @override
  ChallengeViewState createState() => _ChallengeViewState();
}

class _ChallengeViewState extends ChallengeViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConstants.screenPadding),
          child: Column(children: []),
        ),
      ),
    );
  }
}
