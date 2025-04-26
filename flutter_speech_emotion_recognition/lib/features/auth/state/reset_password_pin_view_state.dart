import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/pin_model/pin_model.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/feedback_util.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/controller/auth_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/view/reset_password_pin_view.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';
import 'package:provider/provider.dart';

abstract class ResetPasswordPinViewState extends State<ResetPasswordPinView> {
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

  void onConfirmPressed() async {
    if (formKey.currentState!.validate()) {
      final model = PinModel(email: widget.emailModel.email, pin: code);

      final result = await context.read<AuthController>().sendResetPasswordPin(
        model,
      );

      result.fold(
        () {
          context.router.pushAndPopUntil(
            ResetPasswordViewRoute(pinModel: model),
            predicate: (route) {
              if (route.isFirst) {
                return true;
              }
              return false;
            },
          );
        },
        (error) {
          //TODO: add message
          context.read<FeedbackUtil>().showSnackBar(context, "");
        },
      );
    }
  }

  void onResendMail() {
    // TODO: implement resending mail logic here
  }
}
