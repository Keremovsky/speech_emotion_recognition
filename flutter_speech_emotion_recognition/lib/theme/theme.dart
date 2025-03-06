import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/theme_constants.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.lightMain),
  primaryColor: ColorConstants.lightMain,
  scaffoldBackgroundColor: ColorConstants.lightScaffoldBackground,
  appBarTheme: ThemeConstants.lightAppBarTheme,
  textTheme: ThemeConstants.lightTextTheme,
  filledButtonTheme: ThemeConstants.lightFilledButtonThemeData,
  inputDecorationTheme: ThemeConstants.lightInputDecorationTheme,
  iconTheme: ThemeConstants.lightIconThemeData,
  textSelectionTheme: ThemeConstants.lightTextSelectionThemeData,
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.darkMain),
  primaryColor: ColorConstants.darkMain,
  scaffoldBackgroundColor: ColorConstants.darkScaffoldBackground,
  appBarTheme: ThemeConstants.darkAppBarTheme,
  textTheme: ThemeConstants.darkTextTheme,
  filledButtonTheme: ThemeConstants.darkFilledButtonThemeData,
  inputDecorationTheme: ThemeConstants.darkInputDecorationTheme,
  iconTheme: ThemeConstants.darkIconThemeData,
  textSelectionTheme: ThemeConstants.darkTextSelectionThemeData,
);
