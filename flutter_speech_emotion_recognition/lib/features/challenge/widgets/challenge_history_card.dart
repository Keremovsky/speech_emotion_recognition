import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge_history/pre_challenge_history/pre_challenge_history_model.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/audio_player.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

class ChallengeHistoryCard extends StatefulWidget {
  final Function(PlayerController)? onPressed;
  final double? height;
  final double? width;
  final PreChallengeHistoryModel data;

  const ChallengeHistoryCard({
    super.key,
    this.onPressed,
    this.height,
    this.width,
    required this.data,
  });

  @override
  State<ChallengeHistoryCard> createState() => _ChallengeHistoryCardState();
}

class _ChallengeHistoryCardState extends State<ChallengeHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 150.h,
      width: widget.width ?? 190.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color:
            context.read<ThemeService>().currentTheme == ThemeMode.light
                ? ColorConstants.lightInputAreaBackground
                : ColorConstants.darkInputAreaBackground,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              await context.pushRoute(ChallengeHistoryViewRoute(data: widget.data));
            },
            behavior: HitTestBehavior.translucent,
            child: SizedBox(
              width:
                  widget.width == null
                      ? 110.w
                      : widget.width! / 2 + widget.width! / 20,
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
                child: Column(
                  children: [
                    _TitleText(widget: widget),
                    Spacer(),
                    _ContentText(widget: widget),
                  ],
                ),
              ),
            ),
          ),
          Flexible(child: AudioPlayer(challengeId: widget.data.challenge_id)),
        ],
      ),
    );
  }
}

class _ContentText extends StatelessWidget {
  const _ContentText({required this.widget});

  final ChallengeHistoryCard widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width == null ? 95.w : widget.width! / 2 - 15,
          child: Text(
            widget.data.score.toStringAsFixed(2),
            style: context.displaySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText({required this.widget});

  final ChallengeHistoryCard widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width == null ? 95.w : widget.width! / 2 - 15,
          child: Text(
            widget.data.challenge_title,
            style: context.displayMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
