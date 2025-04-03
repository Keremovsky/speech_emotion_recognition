import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/view/challenge_view.dart';
import 'package:flutter_speech_emotion_recognition/features/home/view/home_view.dart';
import 'package:flutter_speech_emotion_recognition/features/on_boarding/view/on_boarding_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_speech_emotion_recognition/features/settings/view/settings_view.dart';
import 'package:flutter_speech_emotion_recognition/router/auto_route_guards/first_entrance_guard.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen|Route|View")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnBoardingViewRoute.page),
    AutoRoute(
      page: HomeViewRoute.page,
      guards: [FirstEntranceGuard()],
      initial: true,
    ),
    AutoRoute(page: SettingsViewRoute.page),
    AutoRoute(page: ChallengeViewRoute.page),
  ];
}
