import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/controller/auth_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/challenge_history_card_list.dart';
import 'package:flutter_speech_emotion_recognition/features/profile/state/profile_view_state.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends ProfileViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.profile.tr())),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConstants.screenPadding),
              child: Column(
                children: [
                  SizedBox(
                    height: 110.h,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  context.watch<AuthController>().user.profile_pic,
                                ),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorConstants.darkScaffoldBackground,
                                width: 6,
                                strokeAlign: BorderSide.strokeAlignOutside,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CustomButton(
                            onPressed: onEditProfilePressed,
                            child: Text(LocaleKeys.editProfile.tr()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        context.watch<AuthController>().user.username,
                        style: context.displayLarge,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: ColorConstants.darkGreyTextColor,
                        size: 15,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "${LocaleKeys.joined.tr()} ${context.watch<AuthController>().user.register_day}",
                        style: context.displaySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ChallengeHistoryCardList(title: LocaleKeys.history.tr())],
            ),
          ],
        ),
      ),
    );
  }
}
