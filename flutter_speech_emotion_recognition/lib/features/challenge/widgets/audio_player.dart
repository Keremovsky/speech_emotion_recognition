import 'dart:developer';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_loading_indicator.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/feedback_snackbar.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/controller/challenge_controller.dart';
import 'package:provider/provider.dart';

class AudioPlayer extends StatefulWidget {
  final int challengeId;

  const AudioPlayer({super.key, required this.challengeId});

  @override
  AudioPlayerState createState() => AudioPlayerState();
}

class AudioPlayerState extends State<AudioPlayer> {
  late PlayerController _playerController;
  late FeedbackUtil _feedbackUtil;

  File? file;
  bool _isExpanded = false;
  double _bottom = 50;
  bool _isFileGenerated = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _feedbackUtil = FeedbackUtil();
    _playerController = PlayerController();
    _playerController.onCompletion.listen((event) async {
      _toggleAnimation();
    });
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  Future<void> _fileFetch() async {
    setState(() {
      _isLoading = true;
    });

    final result = await context.read<ChallengeController>().fetchChallengeRecording(
      widget.challengeId,
    );

    await result.fold(
      (error) {
        setState(() {
          _isLoading = false;
        });
        _feedbackUtil.showSnackBar(context, error.message);
      },
      (file) async {
        file = file;

        await _playerController.preparePlayer(path: file.path);
        log("audio file is written");

        setState(() {
          _isLoading = false;
          _isFileGenerated = true;
        });

        await _playerController.startPlayer();

        _toggleAnimation();

        await _playerController.setFinishMode(finishMode: FinishMode.pause);
      },
    );
  }

  void _toggleAnimation() {
    setState(() {
      _isExpanded = !_isExpanded;
      _bottom = _isExpanded ? 10.h : 50.h;
    });
  }

  Future<void> _onPressed() async {
    if (_isLoading) {
      return;
    }

    if (!_isFileGenerated) {
      await _fileFetch();
      if (file == null) {
        return;
      }
    }

    if (_playerController.playerState.isPlaying) {
      // if player is playing, pause the player
      await _playerController.pausePlayer();
      _toggleAnimation();
      return;
    }

    await _playerController.startPlayer();
    _toggleAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await _onPressed(),
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
              scaleFactor: 150,
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
                  _isLoading
                      ? CustomLoadingIndicator(
                        height: 20.h,
                        width: 20.w,
                        strokeWidth: 2,
                      )
                      : _isExpanded
                      ? Icon(Icons.pause, size: 42.r)
                      : Icon(Icons.play_arrow, size: 42.r),
            ),
          ),
        ],
      ),
    );
  }
}
