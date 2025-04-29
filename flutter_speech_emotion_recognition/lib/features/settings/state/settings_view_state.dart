import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/locale_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/feedback_util.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/controller/auth_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/settings/view/settings_view.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

abstract class SettingsViewState extends State<SettingsView> {
  bool dataPermission = false;

  @override
  void initState() {
    super.initState();
    // TODO: implement data permission fetch
  }

  void onSwitchChanged(bool value) {
    if (value) {
      context.read<ThemeService>().setTheme(ThemeMode.light);
    } else {
      context.read<ThemeService>().setTheme(ThemeMode.dark);
    }
  }

  void onCheckBoxChanged(bool value) {
    // TODO: implement data permission change
    setState(() {
      dataPermission = !dataPermission;
    });
  }

  void onEnglishPressed() {
    context.setLocale(LocaleConstants.en);
  }

  void onTurkishPressed() {
    context.setLocale(LocaleConstants.tr);
  }

  Future<void> exitFromAccount() async {
    final result = await context.read<AuthController>().exitFromAccount();

    result.fold(
      () {
        context.router.replaceAll([LoginViewRoute()]);
      },
      (error) {
        context.read<FeedbackUtil>().showSnackBar(context, error.message);
      },
    );
  }
}
