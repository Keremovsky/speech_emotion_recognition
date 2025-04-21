import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/challenge_result_model/challenge_result_model.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/controller/challenge_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/view/challenge_view.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/challenge_action_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:fpdart/fpdart.dart' as fp;

abstract class ChallengeViewState extends State<ChallengeView> {
  late Future<fp.Either<String, List<ChallengeResultModel>>> value;

  @override
  void initState() {
    super.initState();
    value = _getData();
  }

  void onRefreshPressed() {
    setState(() {
      value = _getData();
    });
  }

  Future<fp.Either<String, List<ChallengeResultModel>>> _getData() async {
    final result = await context
        .read<ChallengeController>()
        .fetchChallengeHistoryScores(widget.data.id);

    return result.fold(
      (error) {
        return fp.Left(error.message);
      },
      (data) {
        return fp.Right(data);
      },
    );
  }

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

  void onChallengeHistoryBoxPressed(ChallengeResultModel history) {
    // TODO: show result bottom sheet
  }
}
