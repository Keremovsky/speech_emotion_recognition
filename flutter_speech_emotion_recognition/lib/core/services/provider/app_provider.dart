import 'package:flutter_speech_emotion_recognition/core/services/cache/cache_service.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static final AppProvider _instance = AppProvider._init();
  factory AppProvider() => _instance;

  AppProvider._init();

  List<SingleChildWidget> dependItems = [
    Provider(create: (_) => CacheService()),
    ChangeNotifierProvider(create: (_) => AppRouter()),
  ];
}
