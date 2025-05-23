import "package:flutter/material.dart";
import "package:flutter_speech_emotion_recognition/core/components/custom_button.dart";
import "package:flutter_speech_emotion_recognition/core/components/custom_text_field.dart";
import "package:flutter_speech_emotion_recognition/features/challenge/widgets/challenge_card.dart";
import "package:flutter_speech_emotion_recognition/features/challenge/widgets/result_chart.dart";
import "package:flutter_speech_emotion_recognition/features/home/view/home_view.dart";
import "package:flutter_speech_emotion_recognition/secrets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:integration_test/integration_test.dart";
import "package:flutter_speech_emotion_recognition/main.dart" as app;
import "package:permission_handler/permission_handler.dart";

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end to end integration test", () {
    setUpAll(() async {
      await Permission.microphone.request().then((status) async {
        if (status.isDenied || status.isPermanentlyDenied) {
          await Permission.microphone.request();
        }
      });
    });

    testWidgets("full integration test flow", (tester) async {
      await app.main();
      await Future.delayed(Duration(seconds: 10));
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 5));

      // login
      await tester.enterText(find.byType(CustomTextField).at(0), userData["email"]!);
      await tester.enterText(
        find.byType(CustomTextField).at(1),
        userData["password"]!,
      );
      await Future.delayed(Duration(seconds: 1));

      await tester.tap(find.byType(CustomButton));
      await Future.delayed(Duration(seconds: 1));
      await tester.tap(find.byType(CustomButton));

      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 2));
      expect(find.byType(HomeView), findsOneWidget);

      // update user info
      await tester.tap(find.byType(Container).at(0));

      await tester.tap(find.byType(CustomButton).at(0));

      await tester.enterText(find.byType(CustomTextField).at(0), "itisname");
      await Future.delayed(Duration(seconds: 1));

      await tester.tap(find.byType(CustomButton).at(1));
      await Future.delayed(Duration(seconds: 2));

      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 1));
      expect(find.text('Profile updated successfully.'), findsOneWidget);

      // try challenge
      await tester.tap(find.byType(BackButton).at(0));
      await Future.delayed(Duration(seconds: 1));

      await tester.tap(find.byType(ChallengeCard).at(0));
      await Future.delayed(Duration(seconds: 2));

      await tester.tap(find.byType(CustomButton).at(0));
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 4));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(CustomButton).at(1));
      await Future.delayed(Duration(seconds: 3));

      await tester.pumpAndSettle();

      expect(find.byType(ResultChart), findsOneWidget);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 1));
    });
  });
}
