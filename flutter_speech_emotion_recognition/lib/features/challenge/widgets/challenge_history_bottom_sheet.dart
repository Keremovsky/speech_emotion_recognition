import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/challenge_result_model/challenge_result_model.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/result_chart.dart';

class ChallengeHistoryBottomSheet extends StatelessWidget {
  final String title;
  final ChallengeResultModel model;

  const ChallengeHistoryBottomSheet({
    super.key,
    required this.title,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConstants.screenPadding),
      child: SizedBox(height: 360.h, width: double.infinity, child: ResultChart()),
    );
  }
}
