import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_pinput.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/state/reset_password_pin_view_state.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

@RoutePage()
class ResetPasswordPinView extends StatefulWidget {
  const ResetPasswordPinView({super.key});

  @override
  ResetPasswordPinViewState createState() => _ResetPasswordPinViewState();
}

class _ResetPasswordPinViewState extends ResetPasswordPinViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConstants.screenPadding),
          child: Column(
            children: [
              Spacer(),
              Text(
                LocaleKeys.verification.tr(),
                style: context.titleMedium?.copyWith(
                  color:
                      context.read<ThemeService>().isDarkTheme()
                          ? ColorConstants.darkMain
                          : ColorConstants.lightMain,
                ),
              ),
              Spacer(),
              Form(
                key: formKey,
                child: CustomPinput(
                  onPinComplete: onPinComplete,
                  onValidatePin: onValidatePin,
                ),
              ),
              _Gap30H(),
              CustomButton(
                onPressed: onConfirmPressed,
                child: Text(LocaleKeys.confirm.tr()),
              ),
              _Gap30H(),
              Text.rich(
                TextSpan(
                  text: "${LocaleKeys.didntReceiveCode.tr()} ",
                  style: context.displaySmall,
                  children: [
                    TextSpan(
                      text: LocaleKeys.resendMail.tr(),
                      style: context.displaySmall?.copyWith(
                        color:
                            context.read<ThemeService>().isDarkTheme()
                                ? ColorConstants.darkMain
                                : ColorConstants.lightMain,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = onResendMail,
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
