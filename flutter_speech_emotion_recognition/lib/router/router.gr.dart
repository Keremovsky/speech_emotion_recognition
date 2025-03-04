// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute({List<PageRouteInfo>? children})
    : super(HomeViewRoute.name, initialChildren: children);

  static const String name = 'HomeViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [OnBoardingView]
class OnBoardingViewRoute extends PageRouteInfo<OnBoardingViewRouteArgs> {
  OnBoardingViewRoute({
    Key? key,
    required VoidCallback onFinished,
    List<PageRouteInfo>? children,
  }) : super(
         OnBoardingViewRoute.name,
         args: OnBoardingViewRouteArgs(key: key, onFinished: onFinished),
         initialChildren: children,
       );

  static const String name = 'OnBoardingViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnBoardingViewRouteArgs>();
      return OnBoardingView(key: args.key, onFinished: args.onFinished);
    },
  );
}

class OnBoardingViewRouteArgs {
  const OnBoardingViewRouteArgs({this.key, required this.onFinished});

  final Key? key;

  final VoidCallback onFinished;

  @override
  String toString() {
    return 'OnBoardingViewRouteArgs{key: $key, onFinished: $onFinished}';
  }
}
