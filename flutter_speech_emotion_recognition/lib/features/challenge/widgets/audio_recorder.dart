import 'dart:developer';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/services/file/file_service.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';
import 'package:provider/provider.dart';

class AudioRecorder extends StatefulWidget {
  final double? height;
  final double? width;
  final Future<void> Function(File file)? onFinished;

  const AudioRecorder({super.key, this.height, this.width, this.onFinished});

  @override
  State<AudioRecorder> createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  final RecorderController _recorderController = RecorderController();
  late FileService _fileService;
  late File _file;

  @override
  void initState() {
    super.initState();
    _fileService = context.read<FileService>();
    _startRecording();
  }

  @override
  void dispose() {
    _recorderController.dispose();
    _fileService.removeTempFile(_file);
    super.dispose();
  }

  void _startRecording() async {
    _file = await _fileService.generateTempFile("m4a");
    await _recorderController.record(path: _file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        AudioWaveforms(
          size: Size(widget.width ?? 320.w, widget.height ?? 120.h),
          recorderController: _recorderController,
        ),
        const Spacer(),
        Row(
          children: [
            CustomButton(
              onPressed: () async {
                await _recorderController.stop(false);
                log("recording finished");
                // TODO: implement challenge upload and analysis logic
                if (widget.onFinished != null) {
                  await widget.onFinished!(_file);
                }
              },
              child: Text(LocaleKeys.stop.tr()),
            ),
            const Spacer(),
            CustomButton(
              onPressed: () async {
                final navigator = Navigator.of(context);

                await _recorderController.stop();
                if (mounted) {
                  navigator.pop();
                }
              },
              child: Text(LocaleKeys.abort.tr()),
            ),
          ],
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
