import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/reset_password_model/reset_password_model.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/feedback_snackbar.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/controller/auth_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/reset_password_view.dart';
import 'package:provider/provider.dart';

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

  void onResetPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final model = ResetPasswordModel(
        email: widget.pinModel.email,
        pin: widget.pinModel.pin,
        password: password,
      );

      final result = await context.read<AuthController>().sendResetPassword(model);
      result.fold(
        () {
          context.back();
        },
        (error) {
          // TODO: add message
          context.read<FeedbackUtil>().showSnackBar(context, "");
        },
      );
    }
  }
}
