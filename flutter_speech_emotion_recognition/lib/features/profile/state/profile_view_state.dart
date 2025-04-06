import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/features/profile/view/profile_view.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

abstract class ProfileViewState extends State<ProfileView> {
  final List<String> titleList = [
    "Very Long Title It Won't Stop It Will Take As Much As Space It Wants",
    "Title",
    "Yet Another Title",
  ];

  final List<String> levelList = ["Easy", "Intermediate", "Extreme"];

  void onEditProfilePressed() {
    context.pushRoute(EditProfileViewRoute());
  }
}
