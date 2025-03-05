import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/theme_constants.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.main),
  primaryColor: ColorConstants.main,
  scaffoldBackgroundColor: ColorConstants.scaffoldBackground,
  appBarTheme: ThemeConstants.appBarTheme,
  textTheme: ThemeConstants.textTheme,
  filledButtonTheme: ThemeConstants.filledButtonThemeData,
  inputDecorationTheme: ThemeConstants.inputDecorationTheme,
  iconTheme: ThemeConstants.iconThemeData,
);
