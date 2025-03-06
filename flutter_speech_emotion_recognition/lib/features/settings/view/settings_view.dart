import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_switch.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/locale_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.settings.tr())),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConstants.screenPadding),
          child: Column(
            children: [
              CustomSwitch.text(
                text: LocaleKeys.theme.tr(),
                textStyle: context.displayLarge,
                onChanged: (value) {
                  if (value) {
                    context.read<ThemeService>().setTheme(ThemeMode.light);
                  } else {
                    context.read<ThemeService>().setTheme(ThemeMode.dark);
                  }
                },
                onIcon: Icon(Icons.sunny),
                offIcon: Icon(Icons.mode_night),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onPressed: () {
                      context.setLocale(LocaleConstants.en);
                    },
                    child: Text(LocaleKeys.english.tr()),
                  ),
                  CustomButton(
                    onPressed: () {
                      context.setLocale(LocaleConstants.tr);
                    },
                    child: Text(LocaleKeys.turkish.tr()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
