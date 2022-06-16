import 'package:get/get.dart';

class IndexedController extends GetxController {
  IndexedController({
    this.maxValue,
    this.minValue,
    this.initialValue,
    this.throwOnInvalidValue = true,
    this.screenUpdateOnChange = false,
  });
  final int? maxValue;
  final int? minValue;
  final int? initialValue;
  final bool throwOnInvalidValue;
  final bool screenUpdateOnChange;

  final _index = 0.obs;
  int get index => _index.value;
  bool newValueValidate(int newValue) {
    if (minValue != null && newValue < minValue!) {
      if (throwOnInvalidValue) {
        throw ArgumentError('Value must be greater than or equal to $minValue');
      }
      return false;
    }
    if (maxValue != null && newValue > maxValue!) {
      if (throwOnInvalidValue) {
        throw ArgumentError('Value must be less than or equal to $maxValue');
      }
      return false;
    }
    return true;
  }

  set index(int value) {
    if (newValueValidate(value)) {
      _index.value = value;
      if (screenUpdateOnChange) {
        update();
      }
    }
  }
}
