import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/locale_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/main_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';
import 'package:flutter_speech_emotion_recognition/theme/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: LocaleConstants.supportedLocales,
      path: LocaleConstants.path,
      fallbackLocale: LocaleConstants.en,
      child: ScreenUtilInit(
        designSize: SizeConstants.designSize,
        builder: (context, child) {
          return GestureDetector(
            onTap: () => unFocus(context),
            child: const _MaterialApp(),
          );
        },
      ),
    );
  }

  void unFocus(BuildContext context) {
    final currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

class _MaterialApp extends StatefulWidget {
  const _MaterialApp({super.key});

  @override
  __MaterialAppState createState() => __MaterialAppState();
}

class __MaterialAppState extends State<_MaterialApp> {
  @override
  void didChangeDependencies() {
    Intl.defaultLocale = context.locale.languageCode;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Provider.of<AppRouter>(context).config(),
      title: MainConstants.appName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<ThemeService>().currentTheme,
      builder:
          (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.noScaling, boldText: false),
            child: child!,
          ),
    );
  }
}
