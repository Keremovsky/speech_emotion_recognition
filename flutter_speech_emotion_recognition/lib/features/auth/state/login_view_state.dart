import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/login_view.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

abstract class LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  void onEmailSaved(String? value) {}
  String? onEmailValidate(String? value) {
    return null;
  }

  void onPasswordSaved(String? value) {}
  String? onPasswordValidate(String? value) {
    return null;
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
    // TODO: implement register page navigation
    log("navigate to register");
  }
}
