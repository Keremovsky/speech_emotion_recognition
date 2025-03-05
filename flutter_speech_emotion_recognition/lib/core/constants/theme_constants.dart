import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/text_style_constants.dart';

class ThemeConstants {
  static final appBarTheme = AppBarTheme(
    iconTheme: iconThemeData,
    actionsIconTheme: iconThemeData,
    titleTextStyle: TextStyleConstants.titleMedium,
    foregroundColor: ColorConstants.scaffoldBackground,
    scrolledUnderElevation: 0,
    elevation: 0,
    centerTitle: true,
    backgroundColor: ColorConstants.main,
  );

  static final filledButtonThemeData = FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (states) => ColorConstants.main,
      ),
      side: const WidgetStatePropertyAll(BorderSide.none),
      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyleConstants.displayLarge as TextStyle?,
      ),
      foregroundColor: const WidgetStatePropertyAll(ColorConstants.whiteText),
      elevation: const WidgetStatePropertyAll(0),
    ),
  );

  static final inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: ColorConstants.scaffoldBackground,
    hintStyle: TextStyleConstants.bodyMedium,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    errorStyle: TextStyleConstants.bodySmall,
    errorMaxLines: 1,
    contentPadding: EdgeInsets.symmetric(
      horizontal: SizeConstants.inputFieldHorizontalPadding,
      vertical: SizeConstants.inputFieldVerticalPadding,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: ColorConstants.inputAreaBorder, width: 1.r),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(
        color: ColorConstants.inputAreaFocusedBorder,
        width: 1.r,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: ColorConstants.inputAreaBorder, width: 1.r),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(
        color: ColorConstants.inputAreaErrorBorder,
        width: 1.r,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(
        color: ColorConstants.inputAreaErrorBorder,
        width: 1.r,
      ),
    ),
    constraints: BoxConstraints(maxWidth: 306.w),
  );

  static final iconThemeData = IconThemeData(
    color: ColorConstants.scaffoldBackground,
    size: 28.r,
  );

  static final textTheme = TextTheme(
    titleMedium: TextStyleConstants.titleMedium,
    displayLarge: TextStyleConstants.displayLarge,
    displayMedium: TextStyleConstants.displayMedium,
    displaySmall: TextStyleConstants.displaySmall,
    bodyMedium: TextStyleConstants.bodyMedium,
    bodySmall: TextStyleConstants.bodySmall,
  );
}
