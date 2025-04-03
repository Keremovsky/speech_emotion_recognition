import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/file/file_service.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/view/challenge_view.dart';
import 'package:path_provider/path_provider.dart';

abstract class ChallengeViewState extends State<ChallengeView> {
  late File file;
  late Future<void> value;

  @override
  void initState() {
    super.initState();
    value = _getData();
  }

  Future<void> _getData() async {
    if (widget.file == null) {
      file = await context.read<FileService>().generateTempFile("mp3");

      // TODO: implement audio fetching from the backend
      final ByteData audioFile = await rootBundle.load("assets/audio/test.mp3");

      await file.writeAsBytes(audioFile.buffer.asUint8List());
    } else {
      file = widget.file!;
    }
  }
}
