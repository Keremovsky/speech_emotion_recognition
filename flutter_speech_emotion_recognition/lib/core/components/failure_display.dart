import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';

class FailureDisplay extends StatelessWidget {
  final String error;
  final void Function()? refresh;
  const FailureDisplay({super.key, required this.error, this.refresh});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConstants.inputFieldHorizontalPadding,
      ),
      child: Center(
        child: Column(
          children: [
            Text(error, style: context.displayLarge),
            refresh == null
                ? SizedBox()
                : IconButton(
                  onPressed: refresh,
                  icon: Icon(Icons.refresh, size: 42.r),
                ),
          ],
        ),
      ),
    );
  }
}
