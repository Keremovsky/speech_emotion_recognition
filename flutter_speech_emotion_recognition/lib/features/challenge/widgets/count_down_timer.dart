import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';

class CountDownTimer extends StatefulWidget {
  final int time;
  final Widget finishedWidget;
  final TextStyle? timerTextStyle;

  const CountDownTimer({
    super.key,
    required this.time,
    required this.finishedWidget,
    this.timerTextStyle,
  });

  @override
  CountDownTimerState createState() => CountDownTimerState();
}

class CountDownTimerState extends State<CountDownTimer> {
  late int _currentTime;
  Timer? _timer;
  bool _isFinished = false;

  @override
  void initState() {
    super.initState();
    _currentTime = widget.time;
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentTime > 0) {
        setState(() {
          _currentTime--;
        });
      } else {
        setState(() {
          _isFinished = true;
        });
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
          _isFinished
              ? widget.finishedWidget
              : Center(
                child: Text(
                  '$_currentTime',
                  style: widget.timerTextStyle ?? context.titleLarge,
                ),
              ),
    );
  }
}
