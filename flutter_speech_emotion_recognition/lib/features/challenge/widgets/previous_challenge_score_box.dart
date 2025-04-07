import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

class PreviousChallengeScoreBox extends StatelessWidget {
  final double? height;
  final double? width;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final double score;

  const PreviousChallengeScoreBox({
    super.key,
    this.height,
    this.width,
    this.onPressed,
    this.padding,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: height ?? 70.h,
        width: width ?? 70.w,
        child: Material(
          color:
              context.read<ThemeService>().isLightTheme()
                  ? ColorConstants.lightBoxColor
                  : ColorConstants.darkBoxColor,
          borderRadius: BorderRadius.circular(15.r),
          child: Padding(
            padding: padding ?? EdgeInsets.all(8.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(score.toStringAsFixed(2), style: context.displayLarge),
                Text(LocaleKeys.details.tr(), style: context.displayLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
