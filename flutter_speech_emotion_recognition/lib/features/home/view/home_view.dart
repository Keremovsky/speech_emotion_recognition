import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_text_field.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/features/home/widgets/challenge_card.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titleList = [
      "Very Long Title It Won't Stop It Will Take As Much As Space It Wants",
      "Title",
      "Yet Another Title",
    ];

    final List<String> levelList = ["Easy", "Intermediate", "Extreme"];

    return Scaffold(
      appBar: AppBar(title: Text("AppBar Title")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(context.routeData.path, style: context.displayLarge)],
          ),
          SizedBox(
            height: 125.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: SizeConstants.screenPadding),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ChallengeCard(
                  title: titleList[index],
                  level: levelList[index],
                  audioFilePath: "assets/audio/test.mp3",
                  onPressed: (controller) {},
                  width: 230.w,
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 15.w),
              scrollDirection: Axis.horizontal,
            ),
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
