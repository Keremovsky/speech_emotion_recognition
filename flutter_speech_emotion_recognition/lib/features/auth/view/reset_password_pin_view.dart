import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/state/reset_password_pin_state.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class ResetPasswordPinView extends StatefulWidget {
  const ResetPasswordPinView({super.key});

  @override
  ResetPasswordPinState createState() => _ResetPasswordPinViewState();
}

class _ResetPasswordPinViewState extends ResetPasswordPinState {
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
                child: Pinput(
                  length: 4,
                  onCompleted: onPinComplete,
                  validator: onValidatePin,
                  errorTextStyle: context.bodySmall,
                  defaultPinTheme: PinTheme(
                    height: 77.h,
                    width: 77.w,
                    textStyle: context.displayLarge,
                    decoration: BoxDecoration(
                      color: ColorConstants.darkInputAreaBackground,
                      border: Border.all(color: ColorConstants.darkInputAreaBorder),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  errorPinTheme: PinTheme(
                    height: 77.h,
                    width: 77.w,
                    textStyle: context.displayLarge,
                    decoration: BoxDecoration(
                      color: ColorConstants.darkInputAreaBackground,
                      border: Border.all(color: ColorConstants.inputAreaErrorBorder),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    height: 77.h,
                    width: 77.w,
                    textStyle: context.displayLarge,
                    decoration: BoxDecoration(
                      color: ColorConstants.darkInputAreaBackground,
                      border: Border.all(
                        color: ColorConstants.darkInputAreaFocusedBorder,
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
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
