import 'package:auto_route/auto_route.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/controller/auth_controller.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';

class AutoLoginGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final data = await AuthController().autoLogin();

    data.fold(
      () {
        resolver.next(true);
      },
      (error) {
        resolver.redirectUntil(
          LoginViewRoute(
            onSuccess: () {
              resolver.next(true);
            },
          ),
        );
      },
    );
  }
}
