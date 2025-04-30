import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge_history/post_challenge_history/post_challenge_history_model.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/feedback_util.dart';
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

  Future<void> onTryAgainButtonPressed(String sentence) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return ChallengeActionBottomSheet(
          id: widget.data.challenge_id,
          title: widget.data.challenge_title,
          sentence: sentence,
        );
      },
    );
  }

  Future<void> onRemovePressed() async {
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
  }
}
