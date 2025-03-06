import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_text_field.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test AppBar Title")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(context.routeData.path, style: context.displayLarge)],
          ),
          _Gap15(),
          CustomTextField(icon: Icon(Icons.home)),
          _Gap15(),
          CustomButton(
            onPressed: () {
              context.pushRoute(const SettingsViewRoute());
            },
            child: Text("Go to Settings"),
          ),
        ],
      ),
    );
  }
}

class _Gap15 extends StatelessWidget {
  const _Gap15({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 15.h);
  }
}
