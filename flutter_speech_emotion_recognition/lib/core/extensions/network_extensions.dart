import 'package:dio/dio.dart';

extension ResponseExtension on Response {
  bool get isSuccess => statusCode == 200;
}