import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_speech_emotion_recognition/core/enums/network_keys_enum.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/email_model/email_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/login_model/login_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/pin_model/pin_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/register_model/register_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/reset_password_model/reset_password_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth/user_model/user_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/auth_failure_model/auth_failure_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/base_failure_model/base_failure_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/edit_profile_model/edit_profile_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/type_failure_model/type_failure_model.dart';
import 'package:flutter_speech_emotion_recognition/core/services/network/network_service.dart';
import 'package:flutter_speech_emotion_recognition/core/services/secure_storage/secure_storage_service.dart';
import 'package:flutter_speech_emotion_recognition/secrets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthController extends ChangeNotifier {
  late NetworkService _networkService;
  late SecureStorageService _secureStorageService;
  late UserModel _user;

  UserModel get user => _user;

  static final AuthController _instance = AuthController._init();
  factory AuthController() => _instance;

  AuthController._init() {
    log("AuthController initialized");

    _networkService = NetworkService();
    _secureStorageService = SecureStorageService();
  }

  Future<Option<BaseFailureModel>> login(LoginModel data) async {
    final result = await _networkService.post("auth/login/", data: data.toJson());

    return await result.fold(
      (error) {
        return some(error);
      },
      (result) async {
        final data = result.data;
        if (data is Map<String, dynamic>) {
          final userData = UserModel.fromJson(data);
          await _secureStorageService.store(refreshTokenKey, userData.refresh);

          _networkService.setHeader(
            NetworkHeaderKeys.Authorization,
            "Bearer ${userData.access}",
          );

          _user = userData;
          notifyListeners();

          return none();
        }
        return some(TypeFailureModel.invalidType("Type of fetched data was wrong."));
      },
    );
  }

  Future<Option<BaseFailureModel>> autoLogin() async {
    final refreshToken = await _secureStorageService.get(refreshTokenKey);

    if (refreshToken == null) {
      return some(AuthFailureModel.refreshTokenNull(""));
    }

    final isExpired = JwtDecoder.isExpired(refreshToken);

    if (isExpired) {
      return some(AuthFailureModel.refreshTokenExpired(""));
    }

    return await _refreshAuth(refreshToken);
  }

  Future<Option<BaseFailureModel>> register(RegisterModel data) async {
    final result = await _networkService.post("auth/register/", data: data.toJson());

    return result.fold(
      (error) {
        return some(error);
      },
      (result) {
        return none();
      },
    );
  }

  Future<Option<BaseFailureModel>> sendResetPasswordEmail(EmailModel data) async {
    final result = await _networkService.post(
      "auth/reset-mail/",
      data: data.toJson(),
    );

    return result.fold(
      (error) {
        return some(error);
      },
      (result) {
        final data = result.data;
        if (data is Map<String, dynamic>) {
          return none();
        }
        return some(TypeFailureModel.invalidType("Type of fetched data was wrong."));
      },
    );
  }

  Future<Option<BaseFailureModel>> sendResetPasswordPin(PinModel data) async {
    final result = await _networkService.post(
      "auth/reset-pin/",
      data: data.toJson(),
    );

    return result.fold(
      (error) {
        return some(error);
      },
      (result) {
        final data = result.data;
        if (data is Map<String, dynamic>) {
          return none();
        }
        return some(TypeFailureModel.invalidType("Type of fetched data was wrong."));
      },
    );
  }

  Future<Option<BaseFailureModel>> sendResetPassword(ResetPasswordModel data) async {
    final result = await _networkService.post(
      "auth/reset-password/",
      data: data.toJson(),
    );

    return result.fold(
      (error) {
        return some(error);
      },
      (result) {
        final data = result.data;
        if (data is Map<String, dynamic>) {
          return none();
        }
        return some(TypeFailureModel.invalidType("Type of fetched data was wrong."));
      },
    );
  }

  Future<Option<BaseFailureModel>> editProfile(EditProfileModel data) async {
    final result = await _networkService.post("edit-profile/", data: data.toJson());

    return result.fold(
      (error) {
        return some(error);
      },
      (result) {
        final data = result.data;
        if (data is Map<String, dynamic>) {
          final editProfileData = EditProfileModel.fromJson(data);

          _user = _user.copyWith(
            username: editProfileData.username ?? _user.username,
            profile_pic: editProfileData.profile_pic ?? _user.profile_pic,
          );
          notifyListeners();

          return none();
        }
        return some(TypeFailureModel.invalidType("Type of fetched data was wrong."));
      },
    );
  }

  Future<Option<BaseFailureModel>> deleteAccount() async {
    final result = await _networkService.delete("delete-account/");

    return result.fold(
      (error) {
        return some(error);
      },
      (result) {
        _user = UserModel.empty();
        notifyListeners();

        return none();
      },
    );
  }

  Future<Option<BaseFailureModel>> _refreshAuth(String refreshToken) async {
    final result = await _networkService.post(
      "auth/token/refresh/",
      data: {"refresh": refreshToken},
    );

    return await result.fold(
      (error) {
        return some(error);
      },
      (result) async {
        final data = result.data;
        if (data is Map<String, dynamic>) {
          data["refresh"] = refreshToken;

          final userData = UserModel.fromJson(data);

          _networkService.setHeader(
            NetworkHeaderKeys.Authorization,
            "Bearer ${userData.access}",
          );

          _user = userData;
          notifyListeners();

          return none();
        }
        return some(TypeFailureModel.invalidType("Type of fetched data was wrong."));
      },
    );
  }
}
