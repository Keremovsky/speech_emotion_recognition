import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_text_field.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/input_formatters.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/state/reset_password_view_state.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

@RoutePage()
class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  ResetPasswordViewState createState() => _ResetPasswordMailViewState();
}

class _ResetPasswordMailViewState extends ResetPasswordViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConstants.screenPadding),
          child: Column(
            children: [
              Spacer(),
              Text.rich(
                TextSpan(
                  text: "${LocaleKeys.resetYour.tr()} ",
                  style: context.titleMedium,
                  children: [
                    TextSpan(
                      text: LocaleKeys.password.tr(),
                      style: context.titleMedium?.copyWith(
                        color:
                            context.read<ThemeService>().isDarkTheme()
                                ? ColorConstants.darkMain
                                : ColorConstants.lightMain,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      onSaved: onPasswordSaved,
                      validator: onPasswordValidate,
                      controller: passwordController,
                      hintText: LocaleKeys.newPassword.tr(),
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      inputFormatters: InputFormatters.passwordFormatter,
                    ),
                    SizedBox(height: 12.h),
                    CustomTextField(
                      validator: onPasswordConfirmValidate,
                      hintText: LocaleKeys.newPasswordAgain.tr(),
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      inputFormatters: InputFormatters.passwordFormatter,
                    ),
                  ],
                ),
              ),
              _Gap30H(),
              CustomButton(
                onPressed: onResetPressed,
                child: Text(LocaleKeys.reset.tr()),
              ),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class _Gap30H extends StatelessWidget {
  const _Gap30H();

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 30.h);
  }
}
