import 'package:message_app/controllers/globals/identify_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
export 'package:flutter/material.dart' show TextInputAction, TextInputType;

class FormValueController<T> extends IdentifyController<T> {
  late Rx<T> _value;
  T get value => _value.value;
  set value(T value) => _value.value = value;
  FormValueController({
    required T value,
    bool enabled = true,
    FormFieldValidator<T>? validator,
    String? id,
  }) : super(id: id, validator: validator) {
    _value = Rx<T>(value);
  }
}
