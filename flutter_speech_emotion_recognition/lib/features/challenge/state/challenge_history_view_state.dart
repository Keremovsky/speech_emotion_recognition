import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge_history/post_challenge_history/post_challenge_history_model.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/controller/challenge_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/view/challenge_history_view.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/challenge_action_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:fpdart/fpdart.dart' as fp;

abstract class ChallengeHistoryViewState extends State<ChallengeHistoryView> {
  late Future<fp.Either<String, PostChallengeHistoryModel>> value;

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

  Future<fp.Either<String, PostChallengeHistoryModel>> _getData() async {
    final result = await context
        .read<ChallengeController>()
        .fetchPostChallengeHistory(widget.data.id);

    return result.fold(
      (error) {
        return fp.Left(error.message);
      },
      (data) {
        return fp.Right(data);
      },
    );
  }

  void onTryAgainButtonPressed(String sentence) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ChallengeActionBottomSheet(
          id: widget.data.id,
          title: widget.data.challenge_title,
          sentence: sentence,
        );
      },
    );
  }
}
