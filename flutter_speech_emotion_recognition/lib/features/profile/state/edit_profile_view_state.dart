import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/validators.dart';
import 'package:flutter_speech_emotion_recognition/features/profile/view/edit_profile_view.dart';

abstract class EditProfileViewState extends State<EditProfileView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? newProfilePicPath;
  String? username;

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

  void onUsernameSaved(String? value) {
    setState(() {
      username = value!;
    });
  }

  String? onUsernameValidate(String? value) {
    final control = InputFieldValidator.validateUsername(value);
    return control.toNullable()?.message;
  }

  void onCancelPressed() {
    context.back();
  }

  void onSavePressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // TODO: implement updating user information
      context.back();
    }
  }

  void onDeleteAccountPressed() {
    // TODO: implement account deletion
  }
}
