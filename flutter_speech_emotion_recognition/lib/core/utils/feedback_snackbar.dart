import 'dart:developer';

import 'package:flutter/material.dart';

class FeedbackUtil {
  factory FeedbackUtil() => _instance;
  static final FeedbackUtil _instance = FeedbackUtil._init();

  FeedbackUtil._init() {
    log("FeedbackUtil is initialized");
  }

  bool _isSnackbarActive = false;

  void showSnackBar(
    BuildContext context,
    String text, {
    Duration duration = const Duration(seconds: 2),
  }) {
    if (_isSnackbarActive) {
      return;
    }

    _isSnackbarActive = true;

    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(text, style: const TextStyle(fontSize: 14)),
            duration: duration,
            behavior: SnackBarBehavior.floating,
          ),
        )
        .closed
        .then((SnackBarClosedReason reason) {
          _isSnackbarActive = false;
        });
  }
}
