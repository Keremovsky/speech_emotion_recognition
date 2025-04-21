import 'package:freezed_annotation/freezed_annotation.dart';

class LevelIntToStringConverter implements JsonConverter<String, int> {
  const LevelIntToStringConverter();

  @override
  String fromJson(int source) => _convertLevelToString(source);

  @override
  int toJson(String field) => _convertLevelToInt(field);
}

String _convertLevelToString(int level) {
  switch (level) {
    case 0:
      return "Easy";
    case 1:
      return "Intermediate";
    case 2:
      return "Hard";
    default:
      return "";
  }
}

int _convertLevelToInt(String level) {
  switch (level) {
    case "Easy":
      return 0;
    case "Intermediate":
      return 1;
    case "Hard":
      return 2;
    default:
      return -1;
  }
}
