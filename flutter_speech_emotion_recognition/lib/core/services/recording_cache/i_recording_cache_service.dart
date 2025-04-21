part of 'recording_cache_service.dart';

abstract interface class IRecordingCacheService {
  fp.Either<String, File> getRecording(int challengeId);
  bool contains(int challengeId);
}
