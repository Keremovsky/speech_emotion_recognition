import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/features/home/widgets/challenge_card.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';
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
      appBar: AppBar(title: Text(LocaleKeys.home.tr())),
      body: Column(
        children: [
          _UserRow(),
          _RandomChallengeRow(titleList: titleList, levelList: levelList),
          _Gap15H(),
          _MostTriedChallengeRow(titleList: titleList, levelList: levelList),
        ],
      ),
    );
  }
}

class _UserRow extends StatelessWidget {
  const _UserRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConstants.screenPadding),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.pushRoute(ProfileViewRoute());
            },
            child: Row(
              children: [
                SizedBox(
                  height: 60.h,
                  width: 60.w,
                  child: Image.asset("assets/image/pp.jpg"),
                ),
                SizedBox(width: 10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${LocaleKeys.welcome.tr()} Kerem",
                      style: context.titleMedium,
                    ),
                    Text(LocaleKeys.goToProfile.tr(), style: context.displaySmall),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              context.pushRoute(const SettingsViewRoute());
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}

class _RandomChallengeRow extends StatelessWidget {
  const _RandomChallengeRow({required this.titleList, required this.levelList});

  final List<String> titleList;
  final List<String> levelList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConstants.screenPadding),
          child: Row(
            children: [
              Text(LocaleKeys.tryOutAChallenge.tr(), style: context.titleMedium),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh, size: 28.r),
                splashColor: Colors.transparent,
              ),
            ],
          ),
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
      ],
    );
  }
}

class _MostTriedChallengeRow extends StatelessWidget {
  const _MostTriedChallengeRow({required this.titleList, required this.levelList});

  final List<String> titleList;
  final List<String> levelList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConstants.screenPadding),
          child: Text(
            LocaleKeys.mostTriedChallenges.tr(),
            style: context.titleMedium,
          ),
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
      ],
    );
  }
}

class _Gap15H extends StatelessWidget {
  const _Gap15H({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 15.h);
  }
}
