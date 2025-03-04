import 'package:auto_route/auto_route.dart';
import 'package:flutter_speech_emotion_recognition/core/enums/cache_keys_enum.dart';
import 'package:flutter_speech_emotion_recognition/core/services/cache/cache_service.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';
import 'package:provider/provider.dart';

class FirstEntranceGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    bool? isFirstEntrance = resolver.context.read<CacheService>().get<bool>(
      CacheKeys.firstEntrance,
    );

    if (isFirstEntrance != null && isFirstEntrance != false) {
      resolver.next(true);
    } else {
      resolver.context.read<CacheService>().set<bool>(
        CacheKeys.firstEntrance,
        true,
      );

      resolver.redirectUntil(
        OnBoardingViewRoute(
          onFinished: () {
            resolver.resolveNext(true);
          },
        ),
      );
    }
  }
}
