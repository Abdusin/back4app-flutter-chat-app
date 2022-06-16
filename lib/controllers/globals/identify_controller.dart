import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdentifyController<T> extends GetxController {
  late String id;
  final FormFieldValidator<T>? validator;
  final bool enabled;
  IdentifyController({String? id, this.validator, this.enabled = true}) {
    this.id = id ?? uidGenerator();
  }
  String uidGenerator() {
    return '${Random().nextInt(1000)}~${Random().nextInt(1000)}~${Random().nextInt(1000)}';
  }
}
