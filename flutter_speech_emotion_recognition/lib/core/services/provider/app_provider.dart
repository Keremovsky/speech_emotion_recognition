import 'package:flutter_speech_emotion_recognition/core/services/cache/cache_service.dart';
import 'package:flutter_speech_emotion_recognition/core/services/file/file_service.dart';
import 'package:flutter_speech_emotion_recognition/core/services/secure_storage/secure_storage_service.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/feedback_snackbar.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/controller/auth_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/controller/challenge_controller.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  factory AppProvider() => _instance;
  static final AppProvider _instance = AppProvider._init();

  AppProvider._init();

  List<SingleChildWidget> dependItems(AppRouter router) {
    return [
      Provider(create: (_) => CacheService()),
      Provider(create: (_) => FileService()),
      Provider(create: (_) => SecureStorageService()),
      ChangeNotifierProvider(create: (_) => router),
      ChangeNotifierProvider(create: (_) => ThemeService()),
      Provider(create: (_) => ChallengeController()),
      ChangeNotifierProvider(create: (_) => AuthController()),
      Provider(create: (_) => FeedbackUtil()),
    ];
  }

  static Future<void> ensureInitialized() async {
    await CacheService().ensureInitialized();
  }
}
