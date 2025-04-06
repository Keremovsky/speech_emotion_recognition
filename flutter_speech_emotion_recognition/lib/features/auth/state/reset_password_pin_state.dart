import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/reset_password_pin_view.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

abstract class ResetPasswordPinState extends State<ResetPasswordPinView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String code;

  void onPinComplete(String? value) {
    setState(() {
      code = value!;
    });
  }

  String? onValidatePin(String? value) {
    final control = InputFieldValidator.validatePin(value);
    return control.toNullable()?.message;
  }

  void onConfirmPressed() {
    if (formKey.currentState!.validate()) {
      // TODO: implement pin confirmation
      context.router.pushAndPopUntil(
        ResetPasswordViewRoute(),
        predicate: (route) {
          if (route.isFirst) {
            return true;
          }
          return false;
        },
      );
    }
  }

  void onResendMail() {
    // TODO: implement resending mail logic here
  }
}
