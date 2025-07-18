import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/reset_password_model/reset_password_model.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/feedback_util.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/controller/auth_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/reset_password_view.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';
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
        new_password: password,
      );

      final result = await context.read<AuthController>().sendResetPassword(model);
      result.fold(
        () {
          context.back();
          context.read<FeedbackUtil>().showSnackBar(
            context,
            LocaleKeys.resetPasswordSuccess.tr(),
          );
        },
        (error) {
          context.read<FeedbackUtil>().showSnackBar(
            context,
            LocaleKeys.resetPasswordFailure.tr(),
          );
        },
      );
    }
  }
}
