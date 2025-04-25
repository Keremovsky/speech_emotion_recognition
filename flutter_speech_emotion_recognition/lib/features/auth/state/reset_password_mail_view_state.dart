import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/email_model/email_model.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/feedback_snackbar.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/controller/auth_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/reset_password_mail_view.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';
import 'package:provider/provider.dart';

abstract class ResetPasswordMailViewState extends State<ResetPasswordMailView> {
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

  Future<void> onSendMailPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final model = EmailModel(email: email);

      final result = await context.read<AuthController>().sendResetPasswordEmail(
        model,
      );

      result.fold(
        () {
          context.pushRoute(ResetPasswordPinViewRoute(emailModel: model));
        },
        (error) {
          // TODO: add message
          context.read<FeedbackUtil>().showSnackBar(context, "");
        },
      );
    }
  }

  void onRegisterAccountPressed() {
    context.replaceRoute(RegisterViewRoute());
  }
}
