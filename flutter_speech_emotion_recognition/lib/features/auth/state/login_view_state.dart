import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/login_view.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

abstract class LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String email;
  late String password;

  void onEmailSaved(String? value) {
    setState(() {
      email = value!;
    });
  }

  String? onEmailValidate(String? value) {
    final control = InputFieldValidator.validateEmail(value);
    return control.toNullable()?.message;
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

  void onForgotPasswordPressed() {
    // TODO: implement password reset page navigation
    log("navigate to password reset");
  }

  void onLoginButtonPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // TODO: implement user authentication
      context.pushRoute(HomeViewRoute());
    }
  }

  void onCreateAccountPressed() {
    context.pushRoute(RegisterViewRoute());
  }
}
