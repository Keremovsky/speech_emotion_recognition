import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/check_box_tile.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_switch.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/asset_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/features/settings/state/settings_view_state.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends SettingsViewState {
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
                initialState: context.read<ThemeService>().isLightTheme(),
                text: LocaleKeys.changeTheme.tr(),
                textStyle: context.displayLarge,
                onChanged: onSwitchChanged,
                onIcon: Icon(Icons.sunny),
                offIcon: Icon(Icons.mode_night),
              ),
              SizedBox(height: 8.h),
              CheckBoxTile.short(
                onChanged: onCheckBoxChanged,
                size: 22.r,
                label: LocaleKeys.shareData.tr(),
                value: dataPermission,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onPressed: onEnglishPressed,
                    child: Row(
                      children: [
                        Text(LocaleKeys.english.tr()),
                        SizedBox(width: 12.w),
                        SvgPicture.asset(
                          AssetConstants.englishFlagPath,
                          width: 20.r,
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    onPressed: onTurkishPressed,
                    child: Row(
                      children: [
                        Text(LocaleKeys.turkish.tr()),
                        SizedBox(width: 12.w),
                        SvgPicture.asset(
                          AssetConstants.turkishFlagPath,
                          width: 20.r,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    onPressed: exitFromAccount,
                    child: Row(
                      children: [
                        Text("Exit from Account"),
                        SizedBox(width: 12.w),
                        Icon(Icons.exit_to_app, size: 20.r),
                      ],
                    ),
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
