import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/features/on_boarding/view/on_boarding_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

abstract class OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();

  final int maxPageCount = 3;

  final WormEffect pageIndicatorEffect = WormEffect(
    spacing: 16.0,
    radius: 14.0,
    dotWidth: 14.0,
    dotHeight: 14.0,
    paintStyle: PaintingStyle.stroke,
    strokeWidth: 1.2,
    dotColor: Colors.grey,
    activeDotColor: Colors.indigo,
    type: WormType.thinUnderground,
  );

  void onDotClicked(int index) {
    pageController.animateToPage(
      index,
      duration: Durations.medium3,
      curve: Curves.fastOutSlowIn,
    );
  }

  void onNextPressed() {
    if (pageController.page != null && pageController.page!.round() == 2) {
      widget.onFinished();
    } else {
      pageController.nextPage(
        duration: Durations.medium3,
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
