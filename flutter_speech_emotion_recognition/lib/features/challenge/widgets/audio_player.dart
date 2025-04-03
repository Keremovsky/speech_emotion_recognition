import 'dart:developer';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/services/file/file_service.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:provider/provider.dart';

class AudioPlayer extends StatefulWidget {
  final File? file;
  final String? songId;

  const AudioPlayer({super.key, this.file, this.songId});

  @override
  AudioPlayerState createState() => AudioPlayerState();
}

class AudioPlayerState extends State<AudioPlayer> {
  late PlayerController _playerController;
  late FileService _fileService;

  late File file;
  bool _isExpanded = false;
  double _bottom = 50;

  @override
  void initState() {
    super.initState();
    _fileService = context.read<FileService>();
    _playerController = PlayerController();
    _playerController.onCompletion.listen((event) async {
      _toggleAnimation();
    });
    _fileControl();
  }

  @override
  void dispose() {
    _playerController.dispose();
    _fileService.removeTempFile(file);
    super.dispose();
  }

  void _fileControl() async {
    if (widget.file != null) {
      file = widget.file!;

      final bool isFileExist = await file.exists();

      if (isFileExist) {
        final int fileLength = await file.length();

        if (!(fileLength > 0)) {
          await _audioDownload();
        } else {
          await _playerController.preparePlayer(path: file.path);

          await _playerController.setFinishMode(finishMode: FinishMode.pause);
        }
      }
    } else {
      await _audioDownload();
    }
  }

  Future<void> _audioDownload() async {
    // TODO: implement audio fetching with audioId
    file = await _fileService.generateTempFile("mp3");

    final ByteData audioFile = await rootBundle.load("assets/audio/test.mp3");

    await file.writeAsBytes(audioFile.buffer.asUint8List());

    await _playerController.preparePlayer(path: file.path);

    log("audio file is written");

    await _playerController.setFinishMode(finishMode: FinishMode.pause);
  }

  void _toggleAnimation() {
    setState(() {
      _isExpanded = !_isExpanded;
      _bottom = _isExpanded ? 10.h : 50.h;
    });
  }

  Future<void> _onPressed() async {
    if (_playerController.playerState.isPlaying) {
      // if player is playing, pause the player
      await _playerController.pausePlayer();
      return;
    }

    await _playerController.startPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _onPressed();
        _toggleAnimation();
      },
      behavior: HitTestBehavior.translucent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AudioFileWaveforms(
            size: Size(double.infinity, double.infinity),
            playerController: _playerController,
            playerWaveStyle: PlayerWaveStyle(
              backgroundColor: Colors.red,
              showSeekLine: false,
              scaleFactor: 220,
              fixedWaveColor:
                  context.read<ThemeService>().currentTheme == ThemeMode.light
                      ? ColorConstants.blackText
                      : ColorConstants.darkInputAreaBorder,
              liveWaveColor:
                  context.read<ThemeService>().currentTheme == ThemeMode.light
                      ? ColorConstants.lightInputAreaFocusedBorder
                      : ColorConstants.whiteText,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCirc,
            bottom: _bottom,
            child: AnimatedScale(
              scale: _isExpanded ? 1 : 2,
              curve: Curves.easeInOutCirc,
              duration: Durations.medium2,
              child:
                  _isExpanded
                      ? Icon(Icons.pause, size: 42.r)
                      : Icon(Icons.play_arrow, size: 42.r),
            ),
          ),
        ],
      ),
    );
  }
}
