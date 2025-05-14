import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/features/profile/view/profile_view.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

abstract class ProfileViewState extends State<ProfileView> {
  void onEditProfilePressed() {
    context.pushRoute(EditProfileViewRoute());
  }
}
