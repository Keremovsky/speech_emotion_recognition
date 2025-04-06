import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/reset_password_mail.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

abstract class ResetPasswordMailState extends State<ResetPasswordMailView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String email;

  void onEmailSaved(String? value) {
    setState(() {
      email = value!;
    });
  }

  String? onEmailValidate(String? value) {
    final control = InputFieldValidator.validateEmail(value);
    return control.toNullable()?.message;
  }

  void onSendMailPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // TODO: implement e-mail control
      context.pushRoute(ResetPasswordPinViewRoute());
    }
  }

  void onRegisterAccountPressed() {
    context.replaceRoute(RegisterViewRoute());
  }
}
