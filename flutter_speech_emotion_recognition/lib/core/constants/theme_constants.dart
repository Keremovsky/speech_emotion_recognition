import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/text_style_constants.dart';

// ! Colors which must be updated are in RED
class ThemeConstants {
  static final lightAppBarTheme = AppBarTheme(
    iconTheme: lightIconThemeData,
    actionsIconTheme: lightIconThemeData,
    titleTextStyle: TextStyleConstants.titleMedium,
    foregroundColor: ColorConstants.lightScaffoldBackground,
    scrolledUnderElevation: 0,
    elevation: 0,
    centerTitle: true,
    backgroundColor: ColorConstants.lightMain,
  );

  // TODO: update for dark theme
  static final darkAppBarTheme = lightAppBarTheme.copyWith(
    titleTextStyle: TextStyleConstants.titleMedium.copyWith(
      color: ColorConstants.blackText,
    ),
    foregroundColor: ColorConstants.darkScaffoldBackground,
    backgroundColor: ColorConstants.red,
  );

  static final lightFilledButtonThemeData = FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (states) => ColorConstants.lightMain,
      ),
      side: const WidgetStatePropertyAll(BorderSide.none),
      padding: WidgetStatePropertyAll(EdgeInsets.all(15.r)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      ),
      textStyle: WidgetStatePropertyAll(TextStyleConstants.displayLarge as TextStyle?),
      foregroundColor: const WidgetStatePropertyAll(ColorConstants.blackText),
      elevation: const WidgetStatePropertyAll(0),
    ),
  );

  // TODO: update for dark theme
  static final darkFilledButtonThemeData = FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (states) => ColorConstants.red,
      ),
      side: const WidgetStatePropertyAll(BorderSide.none),
      padding: WidgetStatePropertyAll(EdgeInsets.all(15.r)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      ),
      textStyle: WidgetStatePropertyAll(TextStyleConstants.displayLarge as TextStyle?),
      foregroundColor: const WidgetStatePropertyAll(ColorConstants.whiteText),
      elevation: const WidgetStatePropertyAll(0),
    ),
  );

  static final lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: ColorConstants.lightScaffoldBackground,
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
      borderSide: BorderSide(color: ColorConstants.lightInputAreaBorder, width: 1.r),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(
        color: ColorConstants.lightInputAreaFocusedBorder,
        width: 1.r,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: ColorConstants.lightInputAreaBorder, width: 1.r),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: ColorConstants.inputAreaErrorBorder, width: 1.r),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: ColorConstants.inputAreaErrorBorder, width: 1.r),
    ),
    constraints: BoxConstraints(maxWidth: 306.w),
  );

  // TODO: update for dark theme
  static final darkInputDecorationTheme = lightInputDecorationTheme.copyWith(
    fillColor: ColorConstants.darkScaffoldBackground,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: ColorConstants.red, width: 1.r),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: ColorConstants.red, width: 1.r),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: ColorConstants.red, width: 1.r),
    ),
  );

  static final lightIconThemeData = IconThemeData(
    color: ColorConstants.lightScaffoldBackground,
    size: 28.r,
  );

  static final darkIconThemeData = lightIconThemeData.copyWith(
    color: ColorConstants.darkScaffoldBackground,
  );

  static final lightTextTheme = TextTheme(
    titleMedium: TextStyleConstants.titleMedium,
    displayLarge: TextStyleConstants.displayLarge,
    displayMedium: TextStyleConstants.displayMedium,
    displaySmall: TextStyleConstants.displaySmall,
    bodyMedium: TextStyleConstants.bodyMedium,
    bodySmall: TextStyleConstants.bodySmall,
  );

  static final darkTextTheme = TextTheme(
    titleMedium: TextStyleConstants.titleMedium.copyWith(color: ColorConstants.whiteText),
    displayLarge: TextStyleConstants.displayLarge.copyWith(
      color: ColorConstants.whiteText,
    ),
    displayMedium: TextStyleConstants.displayMedium.copyWith(
      color: ColorConstants.whiteText,
    ),
    displaySmall: TextStyleConstants.displaySmall.copyWith(
      color: ColorConstants.whiteText,
    ),
    bodyMedium: TextStyleConstants.bodyMedium,
    bodySmall: TextStyleConstants.bodySmall,
  );
}
