part of 'recording_cache_service.dart';

abstract interface class IRecordingCacheService {
  fp.Either<String, File> getRecordingFromCache(int challengeId);
  bool contains(int challengeId);
}
