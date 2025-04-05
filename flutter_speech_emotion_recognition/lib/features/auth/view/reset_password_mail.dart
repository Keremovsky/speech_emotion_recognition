import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_text_field.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/state/reset_password_mail_state.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

@RoutePage()
class ResetPasswordMailView extends StatefulWidget {
  const ResetPasswordMailView({super.key});

  @override
  ResetPasswordMailState createState() => _ResetPasswordMailViewState();
}

class _ResetPasswordMailViewState extends ResetPasswordMailState {
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
                  text: "${LocaleKeys.sendMailToReset.tr()} ",
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
                      onSaved: onEmailSaved,
                      validator: onEmailValidate,
                      hintText: LocaleKeys.email.tr(),
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
              ),
              _Gap30H(),
              CustomButton(
                onPressed: onSendMailPressed,
                child: Text(LocaleKeys.sendMail.tr()),
              ),
              _Gap30H(),
              Text.rich(
                TextSpan(
                  text: "${LocaleKeys.dontHaveAccount.tr()} ",
                  style: context.displaySmall,
                  children: [
                    TextSpan(
                      text: LocaleKeys.createRightNow.tr(),
                      style: context.displaySmall?.copyWith(
                        color:
                            context.read<ThemeService>().isDarkTheme()
                                ? ColorConstants.darkMain
                                : ColorConstants.lightMain,
                      ),
                      recognizer:
                          TapGestureRecognizer()..onTap = onRegisterAccountPressed,
                    ),
                  ],
                ),
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
