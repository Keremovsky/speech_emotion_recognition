import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/enums/challenge_card_type.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/challenge_card_list.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.home.tr())),
      body: Column(
        children: [
          _UserRow(),
          ChallengeCardList(
            title: LocaleKeys.tryOutAChallenge.tr(),
            activateRefreshButton: true,
            type: ChallengeCardType.random,
          ),
          SizedBox(height: 15.h),
          ChallengeCardList(
            title: LocaleKeys.mostTriedChallenges.tr(),
            type: ChallengeCardType.popular,
          ),
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
