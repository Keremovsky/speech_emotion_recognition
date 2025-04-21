import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/view/challenge_view.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/challenge_action_bottom_sheet.dart';

abstract class ChallengeViewState extends State<ChallengeView> {
  void onStartTheChallengePressed() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ChallengeActionBottomSheet(
          title: widget.data.title,
          sentence: widget.data.sentence,
        );
      },
    );
  }

  void onChallengeHistoryBoxPressed() {
    log("AAAAAAAAAAAAAAA");
  }
}
