import 'package:flutter/widgets.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/reset_password_pin_view.dart';

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
      // TODO: implement pin confirmation and reset password view navigation
    }
  }

  void onResendMail() {
    // TODO: implement resending mail logic here
  }
}
