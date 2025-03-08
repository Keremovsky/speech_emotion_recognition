import 'package:flutter_speech_emotion_recognition/core/services/cache/cache_service.dart';
import 'package:flutter_speech_emotion_recognition/core/services/file/file_service.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  factory AppProvider() => _instance;
  static final AppProvider _instance = AppProvider._init();

  AppProvider._init();

  static List<SingleChildWidget> dependItems = [
    Provider(create: (_) => CacheService()),
    Provider(create: (_) => FileService()),
    ChangeNotifierProvider(create: (_) => AppRouter()),
    ChangeNotifierProvider(create: (_) => ThemeService()),
  ];

  static Future<void> ensureInitialized() async {
    await CacheService().ensureInitialized();
  }
}
