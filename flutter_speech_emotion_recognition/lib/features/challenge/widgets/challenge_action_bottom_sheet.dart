import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_loading_indicator.dart';
import 'package:flutter_speech_emotion_recognition/core/components/failure_display.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/challenge_result_model/challenge_result_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/recording_challenge_model/recording_challenge_model.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/controller/challenge_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/audio_recorder.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/count_down_timer.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/result_chart.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';
import 'package:fpdart/fpdart.dart' as fp;

class ChallengeActionBottomSheet extends StatefulWidget {
  final int id;
  final String title;
  final String sentence;

  const ChallengeActionBottomSheet({
    super.key,
    required this.id,
    required this.title,
    required this.sentence,
  });

  @override
  State<ChallengeActionBottomSheet> createState() =>
      _ChallengeActionBottomSheetState();
}

class _ChallengeActionBottomSheetState extends State<ChallengeActionBottomSheet> {
  bool isFinished = false;
  Future<fp.Either<String, ChallengeResultModel>>? value;

  Future<fp.Either<String, ChallengeResultModel>> _getResult(
    Uint8List recordingData,
  ) async {
    final requestData = RecordingChallengeModel(recording: recordingData);

    final result = await context.read<ChallengeController>().takeOnChallenge(
      widget.id,
      requestData,
    );

    return result.fold(
      (error) {
        return fp.Left(error.message);
      },
      (data) {
        return fp.Right(data);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConstants.screenPadding),
      child: SizedBox(
        height: 400.h,
        child: Column(
          children: [
            Text(widget.title, style: context.titleMedium),
            SizedBox(height: 12.h),
            isFinished
                ? SizedBox()
                : Text(widget.sentence, style: context.displayLarge),
            CountDownTimer(
              time: 3,
              finishedWidget: FutureBuilder(
                future: value,
                builder: (context, snapshot) {
                  if (value == null) {
                    return AudioRecorder(
                      onFinished: (file) async {
                        final recordingData = await file.readAsBytes();

                        setState(() {
                          isFinished = true;
                          value = _getResult(recordingData);
                        });
                      },
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      final error = snapshot.error! as Exception;

                      return FailureDisplay(error: error.toString());
                    }

                    final result = snapshot.data;
                    if (result != null) {
                      return result.fold(
                        (error) {
                          return FailureDisplay(error: error);
                        },
                        (data) {
                          return ResultChart(model: data);
                        },
                      );
                    }
                    return FailureDisplay(error: LocaleKeys.unknownError.tr());
                  }
                  return CustomLoadingIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
