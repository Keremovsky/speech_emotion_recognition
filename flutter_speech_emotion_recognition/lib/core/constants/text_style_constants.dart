import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/font_size_constants.dart';

class TextStyleConstants {
  /// app bar title
  static final titleMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: FontSizeConstants.fontSize24,
    color: ColorConstants.blackText,
  );

  /// input area text, question text and result page texts
  static final displayLarge = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: FontSizeConstants.fontSize18,
    color: ColorConstants.blackText,
  );

  /// text button's text
  static final displayMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: FontSizeConstants.fontSize18,
    color: ColorConstants.blackText,
  );

  /// checkbox text in test start page and question number in test result page
  static final displaySmall = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: FontSizeConstants.fontSize14,
    color: ColorConstants.blackText,
  );

  /// input area hint text
  static final bodyMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: FontSizeConstants.fontSize16,
    color: ColorConstants.greyText,
  );

  /// input area error text
  static final bodySmall = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: FontSizeConstants.fontSize10,
    color: ColorConstants.red,
  );
}
