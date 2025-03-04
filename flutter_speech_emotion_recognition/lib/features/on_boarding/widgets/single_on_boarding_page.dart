import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/font_size_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleOnBoardingPage extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;

  const SingleOnBoardingPage({
    super.key,
    required this.title,
    required this.content,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(imagePath, width: 280.w),
        SizedBox(height: 25.h),
        Text(title, style: TextStyle(fontSize: FontSizeConstants.fontSize24)),
        SizedBox(height: 15.h),
        Text(content, style: TextStyle(fontSize: FontSizeConstants.fontSize14)),
      ],
    );
  }
}
