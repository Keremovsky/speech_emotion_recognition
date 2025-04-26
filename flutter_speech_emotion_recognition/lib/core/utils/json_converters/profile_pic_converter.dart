import 'package:flutter_speech_emotion_recognition/secrets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ProfilePicConverter implements JsonConverter<String, String> {
  const ProfilePicConverter();

  @override
  String fromJson(String source) => _convertPathToLink(source);

  @override
  String toJson(String field) => field;
}

String _convertPathToLink(String path) => baseUrl + path.substring(1);
