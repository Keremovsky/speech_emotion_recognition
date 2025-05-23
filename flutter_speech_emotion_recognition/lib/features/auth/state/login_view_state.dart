import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/login_model/login_model.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/feedback_util.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/controller/auth_controller.dart';
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
    context.pushRoute(ResetPasswordMailViewRoute());
  }

  Future<void> onLoginButtonPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final result = await context.read<AuthController>().login(
        LoginModel(email: email, password: password),
      );

      result.fold(
        () {
          widget.onSuccess != null
              ? widget.onSuccess!()
              : mounted
              ? context.router.replaceAll([HomeViewRoute()])
              : null;
        },
        (error) {
          context.read<FeedbackUtil>().showSnackBar(context, error.message);
        },
      );
    }
  }

  void onCreateAccountPressed() {
    context.pushRoute(RegisterViewRoute());
  }
}
