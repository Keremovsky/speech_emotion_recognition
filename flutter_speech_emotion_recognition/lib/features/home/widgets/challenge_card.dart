import 'dart:developer';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_button.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/file/file_service.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

/// Card widget that shows given challenge title and level, and able to play audio.
///
/// The audio loading, playing and pausing are handled in the widget
/// but for more control over player `onPressed` function can be used.
/// Be careful that `onPressed` will be executed at the end of the function.
class ChallengeCard extends StatefulWidget {
  final String title;
  final String level;
  final String audioFilePath;
  final Function(PlayerController)? onPressed;
  final double? height;
  final double? width;

  const ChallengeCard({
    super.key,
    required this.title,
    required this.level,
    required this.audioFilePath,
    this.onPressed,
    this.height,
    this.width,
  });

  @override
  State<ChallengeCard> createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<ChallengeCard> {
  final PlayerController _playerController = PlayerController();

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
    _playerController.onCompletion.forEach((element) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _playerController.dispose();
    _fileService.removeTempFile(_file);
  }

  Future<void> _preparePlayer() async {
    // load audio and prepare player
    final audioFile = await rootBundle.load(widget.audioFilePath);

    await _file.writeAsBytes(audioFile.buffer.asUint8List());

    await _playerController.preparePlayer(path: _file.path);

    log("audio file is written");
  }

  Future<void> _onPressed() async {
    final bool isFileExist = await _file.exists();

    if (isFileExist) {
      // if file exist check the length of it in case of it is empty
      final int length = await _file.length();

      if (!(length > 0)) {
        await _preparePlayer();
      } else {
        final int currentDuration = await _playerController.getDuration(
          DurationType.current,
        );

        if (_playerController.playerState.isPlaying) {
          // if player is playing, pause the player.
          await _playerController.pausePlayer();
          setState(() {});
          return;
        } else if (currentDuration == _playerController.maxDuration) {
          // if audio finished, start from the beginning.
          await _playerController.seekTo(0);
        }
      }
    } else {
      // if file doesn't exist then load it
      await _preparePlayer();
    }

    await _playerController.startPlayer();

    setState(() {});

    widget.onPressed != null ? widget.onPressed!(_playerController) : null;

    await _playerController.setFinishMode(finishMode: FinishMode.pause);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 150.h,
      width: widget.width ?? 190.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color:
            context.read<ThemeService>().currentTheme == ThemeMode.light
                ? ColorConstants.lightInputAreaBackground
                : ColorConstants.darkInputAreaBackground,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              await context.pushRoute(ChallengeViewRoute());
            },
            behavior: HitTestBehavior.translucent,
            child: SizedBox(
              width:
                  widget.width == null
                      ? 110.w
                      : widget.width! / 2 + widget.width! / 20,
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
                child: Column(
                  children: [
                    _TitleText(widget: widget),
                    Spacer(),
                    _ContentText(widget: widget),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Stack(
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
                CustomButton(
                  onPressed: () {
                    _onPressed();
                  },
                  style: Theme.of(context).filledButtonTheme.style?.copyWith(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    minimumSize: WidgetStatePropertyAll(
                      Size(double.infinity, double.infinity),
                    ),
                  ),
                  child:
                      _playerController.playerState.isPlaying
                          ? Icon(Icons.pause, size: 52.r)
                          : Icon(Icons.play_arrow, size: 52.r),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentText extends StatelessWidget {
  const _ContentText({super.key, required this.widget});

  final ChallengeCard widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width == null ? 95.w : widget.width! / 2 - 15,
          child: Text(
            widget.level,
            style: context.displaySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText({super.key, required this.widget});

  final ChallengeCard widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width == null ? 95.w : widget.width! / 2 - 15,
          child: Text(
            widget.title,
            style: context.displayMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
