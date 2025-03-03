import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_speech_emotion_recognition/core/models/value_failure_model/value_failure_model.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';
import 'package:fpdart/fpdart.dart';

class InputFieldValidator {
  static Option<ValueFailureModel> validateEmptiness(String? input) {
    if (input == null || input.isEmpty) {
      return some(ValueFailureModel.invalidInput(LocaleKeys.emptyFieldMessage.tr()));
    }

    return none();
  }
}