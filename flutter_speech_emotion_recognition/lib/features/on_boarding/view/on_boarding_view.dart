import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(context.routeData.path)],
          ),
          SizedBox(height: 15.h),
          TextButton(onPressed: onFinished, child: Text("Continue to Home")),
        ],
      ),
    );
  }
}
