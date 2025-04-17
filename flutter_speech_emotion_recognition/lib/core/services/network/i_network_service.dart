part of 'network_service.dart';

abstract interface class INetworkService {
  void setBaseUrl(String baseUrl);
  void setHeaders(Map<NetworkHeaderKeys, String> headers);
  void setHeader(NetworkHeaderKeys key, String value);
  void removeHeader(NetworkHeaderKeys key);
  void setToken(String token);
  void removeToken();
  Future<Either<ConnectionFailureModel, Response<dynamic>>> get(String url);
  Future<Either<ConnectionFailureModel, Response<dynamic>>> post(
    String url, {
    required dynamic data,
  });
}
