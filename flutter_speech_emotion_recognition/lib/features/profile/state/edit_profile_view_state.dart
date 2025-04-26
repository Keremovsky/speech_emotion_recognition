import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/models/edit_profile_model/edit_profile_model.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/feedback_snackbar.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/controller/auth_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/profile/view/edit_profile_view.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';
import 'package:provider/provider.dart';

abstract class EditProfileViewState extends State<EditProfileView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  String? newProfilePicPath;

  @override
  void initState() {
    super.initState();
    controller.text = context.read<AuthController>().user.username;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<String?> _getFilePath() async {
    final filePicker = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', "jpeg"],
    );

    if (filePicker != null) {
      return filePicker.files.single.path!;
    }

    return null;
  }

  void onProfileFilePickPressed() async {
    final filePath = await _getFilePath();

    if (filePath != null) {
      setState(() {
        newProfilePicPath = filePath;
      });
    }
  }

  String? onUsernameValidate(String? value) {
    final control = InputFieldValidator.validateUsername(value);
    return control.toNullable()?.message;
  }

  void onCancelPressed() {
    context.back();
  }

  void onSavePressed() async {
    if (formKey.currentState!.validate()) {
      EditProfileModel editProfileModel = EditProfileModel();

      String? base64String;
      if (newProfilePicPath != null) {
        final file = File(newProfilePicPath!);
        final bytes = await file.readAsBytes();
        base64String = base64Encode(bytes);
      }

      if (mounted &&
          controller.text != context.read<AuthController>().user.username) {
        editProfileModel.username = controller.text;
      }
      if (base64String != null) {
        editProfileModel.profile_pic = base64String;
      }

      if (editProfileModel.username != null ||
          editProfileModel.profile_pic != null) {
        if (mounted) {
          print(editProfileModel.toJson());
          final result = await context.read<AuthController>().editProfile(
            editProfileModel,
          );

          result.fold(
            () {
              // TODO: add message
              context.read<FeedbackUtil>().showSnackBar(context, "success");
            },
            (error) {
              // TODO: add message
              context.read<FeedbackUtil>().showSnackBar(context, "error");
            },
          );
        }

        if (mounted) context.back();
      }
    }
  }

  Future<void> onDeleteAccountPressed() async {
    final result = await context.read<AuthController>().deleteAccount();

    result.fold(
      () {
        context.router.replaceAll([LoginViewRoute(onSuccess: () {})]);
        context.read<FeedbackUtil>().showSnackBar(context, "removed");
      },
      (error) {
        // TODO: add message
        context.read<FeedbackUtil>().showSnackBar(context, "error");
      },
    );
  }
}
