import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

class Base64Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Base64Uint8ListConverter();

  @override
  Uint8List fromJson(String source) => base64Decode(source);

  @override
  String toJson(Uint8List bytes) => base64Encode(bytes);
}
