import 'package:message_app/controllers/globals/identify_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
export 'package:flutter/material.dart' show TextInputAction, TextInputType;

class TextFieldController extends IdentifyController<String> {
  final bool passwordMode;
  final TextInputAction? buttonAction;
  final TextInputType? keyboardType;
  final bool updateOnEmptyChange;
  late var obscureText = passwordMode.obs;

  TextFieldController({
    this.passwordMode = false,
    bool enabled = true,
    FormFieldValidator<String>? validator,
    this.buttonAction,
    this.keyboardType,
    this.updateOnEmptyChange = false,
    String? id,
    String? value,
  }) : super(id: id, enabled: enabled, validator: validator) {
    if (value != null) {
      setValue(value);
    }
  }

  final controller = TextEditingController();
  final focusNode = FocusNode();
  String get value => controller.text.trim();
  String get text => controller.text;

  @override
  void onInit() {
    if (updateOnEmptyChange) {
      controller.addListener(emptyListener);
    }
    super.onInit();
  }

  @override
  void dispose() {
    if (updateOnEmptyChange) {
      controller.removeListener(emptyListener);
    }
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  late var isEmpty = text.isEmpty;
  void emptyListener() {
    if (updateOnEmptyChange) {
      if (text.isEmpty != isEmpty) {
        isEmpty = text.isEmpty;
        update();
      }
    }
  }

  void unfocus() => focusNode.unfocus();

  void requestFocus() => focusNode.requestFocus();

  void clear() => controller.clear();

  void setText(String text) => controller.text = text;

  void setValue(String value) => controller.text = value;

  void setSelection(int start, int end) {
    controller.selection = TextSelection(
      baseOffset: start,
      extentOffset: end,
    );
  }

  void setSelectionStart(int start) {
    controller.selection = TextSelection(
      baseOffset: start,
      extentOffset: controller.selection.extentOffset,
    );
  }

  void setSelectionEnd(int end) {
    controller.selection = TextSelection(
      baseOffset: controller.selection.baseOffset,
      extentOffset: end,
    );
  }

  void toggleObscureText() {
    if (passwordMode) {
      obscureText.value = !obscureText.value;
    }
  }
}
