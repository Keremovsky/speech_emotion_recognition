import 'dart:collection';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_speech_emotion_recognition/core/services/file/file_service.dart';
import 'package:fpdart/fpdart.dart' as fp;

part 'i_recording_cache_service.dart';

class RecordingCacheService implements IRecordingCacheService {
  late FileService _fileService;

  factory RecordingCacheService() => _instance;
  static final RecordingCacheService _instance = RecordingCacheService._init();

  RecordingCacheService._init() {
    _fileService = FileService();
    log("RecordingCacheService is Initialized");
  }

  final LinkedHashMap<int, File> _cache = LinkedHashMap();
  final int _maxCacheSize = 30;

  @override
  fp.Either<String, File> getRecording(int challengeId) {
    try {
      if (_cache.containsKey(challengeId)) {
        _moveToEnd(challengeId);
        return fp.Right(_cache[challengeId]!);
      } else {
        return fp.Left("Cache doesn't contain recording.");
      }
    } catch (e) {
      return fp.Left(e.toString());
    }
  }

  Future<File> addToCache(int challengeId, Uint8List recordingData) async {
    if (_cache.length >= _maxCacheSize) {
      _removeOldestRecording();
    }

    final file = await _fileService.generateTempFile("mp3");
    await file.writeAsBytes(recordingData);

    _cache[challengeId] = file;

    return file;
  }

  void _removeOldestRecording() {
    if (_cache.isNotEmpty) {
      int oldestChallengeId = _cache.keys.first;

      _fileService.removeTempFile(_cache[oldestChallengeId]);
      _cache.remove(oldestChallengeId);
    }
  }

  void _moveToEnd(int challengeId) {
    final recording = _cache.remove(challengeId);
    if (recording != null) {
      _cache[challengeId] = recording;
    }
  }

  @override
  bool contains(int challengeId) => _cache.containsKey(challengeId);
}
