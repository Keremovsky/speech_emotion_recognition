import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/email_model/email_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/pin_model/pin_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/pre_challenge_model/pre_challenge_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge_history/pre_challenge_history/pre_challenge_history_model.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/login_view.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/register_view.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/reset_password_pin_view.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/reset_password_mail_view.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/reset_password_view.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/view/challenge_history_view.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/view/challenge_view.dart';
import 'package:flutter_speech_emotion_recognition/features/home/view/home_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_speech_emotion_recognition/features/profile/view/edit_profile_view.dart';
import 'package:flutter_speech_emotion_recognition/features/profile/view/profile_view.dart';
import 'package:flutter_speech_emotion_recognition/features/settings/view/settings_view.dart';
import 'package:flutter_speech_emotion_recognition/router/auto_route_guards/auto_login_guard.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen|Route|View")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginViewRoute.page),
    AutoRoute(page: RegisterViewRoute.page),
    AutoRoute(page: ResetPasswordMailViewRoute.page),
    AutoRoute(page: ResetPasswordPinViewRoute.page),
    AutoRoute(page: ResetPasswordViewRoute.page),
    AutoRoute(page: HomeViewRoute.page, initial: true, guards: [AutoLoginGuard()]),
    AutoRoute(page: SettingsViewRoute.page),
    AutoRoute(page: ProfileViewRoute.page),
    AutoRoute(page: EditProfileViewRoute.page),
    AutoRoute(page: ChallengeViewRoute.page),
    AutoRoute(page: ChallengeHistoryViewRoute.page),
  ];
}
