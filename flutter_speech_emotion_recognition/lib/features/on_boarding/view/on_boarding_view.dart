import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/asset_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/features/on_boarding/state/on_boarding_view_state.dart';
import 'package:flutter_speech_emotion_recognition/features/on_boarding/widgets/single_on_boarding_page.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends OnBoardingViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: SizeConstants.screenPadding),
          child: Column(
            children: [
              Text(context.routeData.path),
              SizedBox(height: 15.h),
              SizedBox(
                height: 600.h,
                child: PageView.builder(
                  controller: pageController,
                  itemBuilder: (context, index) {
                    // TODO: update title, content and image
                    return SingleOnBoardingPage(
                      title: "Hello",
                      content: "Hello hello hello",
                      imagePath: AssetConstants.onBoardingPageSvgPaths[index],
                    );
                  },
                  itemCount: maxPageCount,
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: maxPageCount,
                effect: pageIndicatorEffect,
                onDotClicked: onDotClicked,
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: widget.onFinished,
                      child: Text(LocaleKeys.skip.tr()),
                    ),
                    TextButton(
                      onPressed: onNextPressed,
                      child: Text(LocaleKeys.next.tr()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
