import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/reset_password_view.dart';

abstract class ResetPasswordViewState extends State<ResetPasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  late String password;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void onPasswordSaved(String? value) {
    setState(() {
      password = value!;
    });
  }

  String? onPasswordValidate(String? value) {
    final control = InputFieldValidator.validatePassword(value);
    return control.toNullable()?.message;
  }

  String? onPasswordConfirmValidate(String? value) {
    final control = InputFieldValidator.validatePasswordConfirm(
      value,
      passwordController.text,
    );
    return control.toNullable()?.message;
  }

  void onResetPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // TODO: implement password reset
      context.back();
    }
  }
}
