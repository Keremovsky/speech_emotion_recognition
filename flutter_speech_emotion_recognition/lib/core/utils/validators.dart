import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_speech_emotion_recognition/core/models/value_failure_model/value_failure_model.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';
import 'package:fpdart/fpdart.dart';

class InputFieldValidator {
  static final List<String> _validDomains = ["gmail.com"];
  static final String _emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  static final String _passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

  static Option<ValueFailureModel> validateEmptiness(String? input) {
    if (input == null || input.isEmpty) {
      return some(ValueFailureModel.invalidInput(LocaleKeys.emptyFieldMessage.tr()));
    }

    return none();
  }

  static Option<ValueFailureModel> validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return some(ValueFailureModel.invalidInput(LocaleKeys.emptyFieldMessage.tr()));
    }

    final RegExp regex = RegExp(_emailPattern);

    if (!regex.hasMatch(input)) return some(ValueFailureModel.invalidInput(""));

    final String domain = input.split("@").last;

    if (!_validDomains.contains(domain)) {
      return some(ValueFailureModel.invalidInput(""));
    }

    return none();
  }

  static Option<ValueFailureModel> validatePassword(String? input) {
    if (input == null || input.isEmpty) {
      return some(ValueFailureModel.invalidInput(LocaleKeys.emptyFieldMessage.tr()));
    }

    final RegExp regex = RegExp(_passwordPattern);

    if (!regex.hasMatch(input)) return some(ValueFailureModel.invalidInput(""));

    return none();
  }
}
