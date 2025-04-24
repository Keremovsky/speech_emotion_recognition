import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class RegisterDateConverter implements JsonConverter<String, String> {
  const RegisterDateConverter();

  @override
  String fromJson(String source) => _convertDateToString(source);

  @override
  String toJson(String field) => field;
}

String _convertDateToString(String date) {
  final dateTime = DateTime.parse(date);
  return DateFormat('MMMM yyyy').format(dateTime);
}
