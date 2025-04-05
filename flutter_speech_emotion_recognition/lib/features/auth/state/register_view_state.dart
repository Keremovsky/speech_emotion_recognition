import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/register_view.dart';

abstract class RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  late String username;
  late String email;
  late String password;

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  void onUsernameSaved(String? value) {
    setState(() {
      username = value!;
    });
  }

  String? onUsernameValidate(String? value) {
    final control = InputFieldValidator.validateUsername(value);
    return control.toNullable()?.message;
  }

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

  String? onPasswordConfirmValidate(String? value) {
    final control = InputFieldValidator.validatePasswordConfirm(
      value,
      passwordController.text,
    );
    return control.toNullable()?.message;
  }

  void onRegisterButtonPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // TODO: implement user registration
      context.back();
    }
  }

  void onLoginAccountPressed() {
    context.back();
  }
}
