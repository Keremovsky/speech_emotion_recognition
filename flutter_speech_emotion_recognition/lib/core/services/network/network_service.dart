import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/network_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/enums/network_keys_enum.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/network_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/models/connection_failure_model/connection_failure_model.dart';
import 'package:flutter_speech_emotion_recognition/core/services/connectivity/connectivity_service.dart';
import 'package:flutter_speech_emotion_recognition/core/services/secure_storage/secure_storage_service.dart';
import 'package:flutter_speech_emotion_recognition/features/auth/controller/auth_controller.dart';
import 'package:flutter_speech_emotion_recognition/router/router.dart';
import 'package:flutter_speech_emotion_recognition/secrets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'i_network_service.dart';

class NetworkService implements INetworkService {
  late Dio _dio;
  late ConnectivityService _connectivityService;
  late SecureStorageService _secureStorage;
  late AppRouter _router;

  final List<String> _protectedPathList = [
    "challenges/",
    "challenge-histories/",
    "try-challenge/",
    "edit-profile/",
    "delete-account/",
  ];

  factory NetworkService() => _instance;
  static final NetworkService _instance = NetworkService._init();

  NetworkService._init() {
    _dio = Dio();
    _connectivityService = ConnectivityService();
    _secureStorage = SecureStorageService();

    setBaseUrl(baseAppUrl);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (_protectedPathList.any((path) => options.path.contains(path))) {
            final refreshResult = await _secureStorage.get(refreshTokenKey);

            if (refreshResult == null || refreshResult.isEmpty) {
              _router.replaceAll([LoginViewRoute()]);
              return handler.reject(
                DioException(
                  requestOptions: options,
                  type: DioExceptionType.cancel,
                  error: 'Unauthenticated',
                ),
              );
            }

            final accessResult = await _secureStorage.get(accessTokenKey);

            if (accessResult == null ||
                accessResult.isEmpty ||
                JwtDecoder.isExpired(accessResult)) {
              final result = await AuthController().refreshAuth(refreshResult);
              result.fold(
                () {
                  log("access token update success");
                },
                (error) {
                  return handler.reject(
                    DioException(
                      requestOptions: options,
                      type: DioExceptionType.cancel,
                      error: 'Unauthenticated',
                    ),
                  );
                },
              );
            }
          }

          return handler.next(options);
        },
      ),
    );

    log("NetworkService initialized");
  }

  @override
  void registerAppRouter(AppRouter router) {
    _router = router;
  }

  @override
  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  @override
  void setHeaders(Map<NetworkHeaderKeys, String> headers) {
    headers.forEach((key, value) {
      _dio.options.headers[key.name] = value;
    });
  }

  @override
  void setHeader(NetworkHeaderKeys key, String value) {
    _dio.options.headers[key.name] = value;
  }

  @override
  void removeHeader(NetworkHeaderKeys key) {
    _dio.options.headers.remove(key.name);
  }

  @override
  void setToken(String token) {
    _dio.options.headers[NetworkConstants.authorization] = token;
  }

  @override
  void removeToken() {
    _dio.options.headers.remove(NetworkConstants.authorization);
  }

  @override
  Future<Either<ConnectionFailureModel, Response<dynamic>>> get(String url) async {
    return await _doRequest(() => _dio.get(url));
  }

  @override
  Future<Either<ConnectionFailureModel, Response<dynamic>>> post(
    String url, {
    required dynamic data,
  }) async {
    return await _doRequest(() => _dio.post(url, data: data));
  }

  @override
  Future<Either<ConnectionFailureModel, Response<dynamic>>> delete(
    String url,
  ) async {
    return await _doRequest(() => _dio.delete(url));
  }

  @override
  Future<Either<ConnectionFailureModel, Response<dynamic>>> put(
    String url, {
    required dynamic data,
  }) async {
    return await _doRequest(() => _dio.put(url, data: data));
  }

  Future<Either<ConnectionFailureModel, Response<dynamic>>> _doRequest(
    AsyncValueGetter<Response<dynamic>> operation,
  ) async {
    try {
      if (await _connectivityService.isConnected) {
        final result = await operation();

        if (!result.isSuccess) {
          log(result.data.toString());
          return Left(
            ConnectionFailureModel.responseError(
              result.data?["message"] as String? ?? "",
            ),
          );
        }

        return Right(result);
      } else {
        return const Left(ConnectionFailureModel.noConnection("No connection."));
      }
    } on TimeoutException {
      return const Left(
        ConnectionFailureModel.connectionTimedOut("Connection is timed out."),
      );
    } on DioException catch (e) {
      log(e.message ?? "");
      return Left(
        ConnectionFailureModel.responseError(
          "An error occurred while fetching data from server.",
        ),
      );
    } catch (e) {
      log(e.toString());
      return Left(ConnectionFailureModel.unknownError(e.toString()));
    }
  }
}
