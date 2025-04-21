import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/pre_challenge_model/pre_challenge_model.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/audio_player.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

/// Card widget that shows given challenge title and level, and able to play audio.
///
/// The audio loading, playing and pausing are handled in the widget
/// but for more control over player `onPressed` function can be used.
/// Be careful that `onPressed` will be executed at the end of the function.
class ChallengeCard extends StatefulWidget {
  final Function(PlayerController)? onPressed;
  final double? height;
  final double? width;
  final PreChallengeModel data;

  const ChallengeCard({
    super.key,
    this.onPressed,
    this.height,
    this.width,
    required this.data,
  });

  @override
  State<ChallengeCard> createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<ChallengeCard> {
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
              await context.pushRoute(ChallengeViewRoute(data: widget.data));
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
          Flexible(child: AudioPlayer(challengeId: widget.data.id)),
        ],
      ),
    );
  }
}

class _ContentText extends StatelessWidget {
  const _ContentText({required this.widget});

  final ChallengeCard widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width == null ? 95.w : widget.width! / 2 - 15,
          child: Text(
            widget.data.level,
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

  final ChallengeCard widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width == null ? 95.w : widget.width! / 2 - 15,
          child: Text(
            widget.data.title,
            style: context.displayMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
