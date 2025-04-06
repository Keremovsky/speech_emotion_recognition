import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_text_field.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/input_formatters.dart';
import 'package:flutter_speech_emotion_recognition/features/profile/state/edit_profile_view_state.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

@RoutePage()
class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends EditProfileViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.editProfile.tr())),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeConstants.screenPadding,
            right: SizeConstants.screenPadding,
            bottom: SizeConstants.screenPadding,
          ),
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
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image:
                              newProfilePicPath != null
                                  ? DecorationImage(
                                    image: FileImage(File(newProfilePicPath!)),
                                    fit: BoxFit.cover,
                                  )
                                  : DecorationImage(
                                    image: AssetImage("assets/image/pp.jpg"),
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
                      left: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: onProfileFilePickPressed,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: ColorConstants.darkScaffoldBackground.withValues(
                              alpha: 0.5,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.photo_camera_rounded, size: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Form(
                key: formKey,
                child: CustomTextField(
                  onSaved: onUsernameSaved,
                  validator: onUsernameValidate,
                  hintText: LocaleKeys.username.tr(),
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  inputFormatters: InputFormatters.usernameFormatter,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onPressed: onCancelPressed,
                    child: Text(LocaleKeys.cancel.tr()),
                  ),
                  CustomButton(
                    onPressed: onSavePressed,
                    child: Text(LocaleKeys.Save.tr()),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    onPressed: onDeleteAccountPressed,
                    width: 180.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(LocaleKeys.deleteAccount.tr()),
                        SizedBox(width: 5.w),
                        Icon(Icons.delete),
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
