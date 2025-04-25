import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speech_emotion_recognition/core/services/network/network_service.dart';
import 'package:flutter_speech_emotion_recognition/core/services/provider/app_provider.dart';
import 'package:flutter_speech_emotion_recognition/my_app.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await AppProvider.ensureInitialized();

  final router = AppRouter();
  NetworkService().registerAppRouter(router);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final dependItems = AppProvider().dependItems(router);

  runApp(MultiProvider(providers: dependItems, child: MyApp()));
}
