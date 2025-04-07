import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';

class LevelBox extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final String level;

  const LevelBox({
    super.key,
    this.height,
    this.width,
    this.padding,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color:
            context.read<ThemeService>().isLightTheme()
                ? ColorConstants.lightBoxColor
                : ColorConstants.darkBoxColor,
        borderRadius: BorderRadius.circular(6.r),
        child: Padding(
          padding: padding ?? EdgeInsets.all(8.r),
          child: Text(level, style: context.displayLarge),
        ),
      ),
    );
  }
}
