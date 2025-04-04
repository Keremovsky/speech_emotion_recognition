import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/text_style_constants.dart';

class ThemeConstants {
  static final lightAppBarTheme = AppBarTheme(
    iconTheme: lightIconThemeData,
    actionsIconTheme: lightIconThemeData,
    titleTextStyle: TextStyleConstants.titleMedium,
    foregroundColor: ColorConstants.lightScaffoldBackground,
    backgroundColor: ColorConstants.lightScaffoldBackground,
    scrolledUnderElevation: 0,
    elevation: 0,
    centerTitle: true,
  );

  static final darkAppBarTheme = lightAppBarTheme.copyWith(
    iconTheme: darkIconThemeData,
    actionsIconTheme: darkIconThemeData,
    titleTextStyle: TextStyleConstants.titleMedium.copyWith(
      color: ColorConstants.whiteText,
    ),
    foregroundColor: ColorConstants.darkScaffoldBackground,
    backgroundColor: ColorConstants.darkScaffoldBackground,
  );

  static final lightFilledButtonThemeData = FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (states) => ColorConstants.lightFilledButton,
      ),
      side: const WidgetStatePropertyAll(BorderSide.none),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 22.w)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyleConstants.displayLarge as TextStyle?,
      ),
      foregroundColor: const WidgetStatePropertyAll(ColorConstants.blackText),
      elevation: const WidgetStatePropertyAll(0),
    ),
  );

  static final darkFilledButtonThemeData = FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (states) => ColorConstants.darkFilledButton,
      ),
      side: const WidgetStatePropertyAll(BorderSide.none),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 22.w)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyleConstants.displayLarge as TextStyle?,
      ),
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
    constraints: BoxConstraints(maxWidth: 360.w),
    iconColor: ColorConstants.lightInputAreaIcon,
    hoverColor: ColorConstants.lightInputAreaBackground,
  );

  static final darkInputDecorationTheme = lightInputDecorationTheme.copyWith(
    fillColor: ColorConstants.darkScaffoldBackground,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: ColorConstants.darkInputAreaBorder, width: 1.r),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(
        color: ColorConstants.darkInputAreaFocusedBorder,
        width: 1.r,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: ColorConstants.darkInputAreaBorder, width: 1.r),
    ),
    iconColor: ColorConstants.darkInputAreaIcon,
    hoverColor: ColorConstants.darkInputAreaBackground,
  );

  static final lightTextSelectionThemeData = TextSelectionThemeData(
    cursorColor: ColorConstants.lightTextCursor,
  );

  static final darkTextSelectionThemeData = lightTextSelectionThemeData.copyWith(
    cursorColor: ColorConstants.darkTextCursor,
    selectionColor: ColorConstants.darkInputAreaFocusedBorder,
  );

  static final lightIconThemeData = IconThemeData(
    color: ColorConstants.darkScaffoldBackground,
    size: 24.r,
  );

  static final darkIconThemeData = lightIconThemeData.copyWith(
    color: ColorConstants.lightScaffoldBackground,
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
    titleMedium: TextStyleConstants.titleMedium.copyWith(
      color: ColorConstants.whiteText,
    ),
    displayLarge: TextStyleConstants.displayLarge.copyWith(
      color: ColorConstants.whiteText,
    ),
    displayMedium: TextStyleConstants.displayMedium.copyWith(
      color: ColorConstants.whiteText,
    ),
    displaySmall: TextStyleConstants.displaySmall.copyWith(
      color: ColorConstants.darkGreyTextColor,
    ),
    bodyMedium: TextStyleConstants.bodyMedium,
    bodySmall: TextStyleConstants.bodySmall,
  );

  static final lightSwitchThemeData = SwitchThemeData(
    thumbColor: WidgetStatePropertyAll(ColorConstants.whiteText),
    trackColor: WidgetStatePropertyAll(ColorConstants.darkScaffoldBackground),
    trackOutlineColor: WidgetStatePropertyAll(ColorConstants.lightInputAreaBorder),
  );

  static final darkSwitchThemeData = SwitchThemeData(
    thumbColor: WidgetStatePropertyAll(ColorConstants.blackText),
    trackColor: WidgetStatePropertyAll(ColorConstants.lightScaffoldBackground),
    trackOutlineColor: WidgetStatePropertyAll(ColorConstants.darkInputAreaBorder),
  );

  static final lightProgressIndicatorThemeData = ProgressIndicatorThemeData(
    color: ColorConstants.lightInputAreaBorder,
  );

  static final darkProgressIndicatorThemeData = ProgressIndicatorThemeData(
    color: ColorConstants.darkInputAreaBorder,
  );
}
