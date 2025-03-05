import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/theme_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(context.routeData.path)],
          ),
          CustomButton(
            onPressed: () {
              final currentTheme = context.read<ThemeService>().currentTheme;
              if (currentTheme.isLight) {
                context.read<ThemeService>().setTheme(ThemeMode.dark);
              } else {
                context.read<ThemeService>().setTheme(ThemeMode.light);
              }
            },
            child: Text("Change Theme"),
          ),
        ],
      ),
    );
  }
}
