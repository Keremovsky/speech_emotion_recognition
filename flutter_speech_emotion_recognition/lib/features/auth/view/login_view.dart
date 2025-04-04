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
import 'package:flutter_speech_emotion_recognition/features/auth/state/login_view_state.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewState {
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
                  text: "${LocaleKeys.welcomeTo.tr()} ",
                  style: context.titleMedium,
                  children: [
                    TextSpan(
                      text: LocaleKeys.app.tr(),
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
                    ),
                    SizedBox(height: 12.h),
                    CustomTextField(
                      onSaved: onPasswordSaved,
                      validator: onPasswordValidate,
                      hintText: LocaleKeys.password.tr(),
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: onForgotPasswordPressed,
                    child: Text(
                      LocaleKeys.forgotPassword.tr(),
                      style: context.displaySmall,
                    ),
                  ),
                ],
              ),
              _Gap30H(),
              CustomButton(
                onPressed: onLoginButtonPressed,
                child: Text(LocaleKeys.login.tr()),
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
                          TapGestureRecognizer()..onTap = onCreateAccountPressed,
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
