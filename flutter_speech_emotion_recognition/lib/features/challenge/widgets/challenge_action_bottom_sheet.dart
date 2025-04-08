import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/audio_recorder.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/count_down_timer.dart';

class ChallengeActionBottomSheet extends StatelessWidget {
  final String title;
  final String sentence;

  const ChallengeActionBottomSheet({
    super.key,
    required this.title,
    required this.sentence,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConstants.screenPadding),
      child: SizedBox(
        height: 360.h,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.titleMedium),
            SizedBox(height: 12.h),
            Text(sentence, style: context.displayLarge),
            CountDownTimer(time: 3, finishedWidget: AudioRecorder()),
          ],
        ),
      ),
    );
  }
}
