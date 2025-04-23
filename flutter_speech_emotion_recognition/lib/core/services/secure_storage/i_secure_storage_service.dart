part of 'secure_storage_service.dart';

abstract interface class ISecureStorageService {
  Future<void> store(String key, String token);
  Future<String?> get(String key);
}
