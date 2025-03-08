import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/file/file_service.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/view/challenge_view.dart';

abstract class ChallengeViewState extends State<ChallengeView> {
  final PlayerController playerController = PlayerController();

  late FileService _fileService;
  late File _file;

  @override
  void initState() {
    super.initState();
    _fileService = context.read<FileService>();

    _fileService.generateTempFile("mp3").then((value) {
      _file = value;
    });

    // re-build widget every time player stopped
    playerController.onCompletion.forEach((element) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    playerController.dispose();
    _fileService.removeTempFile(_file);
  }
}
