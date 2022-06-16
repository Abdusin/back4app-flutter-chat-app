import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

mixin GetStorageMixin on GetxController {
  late Function onStorageLoad;
  final storage = GetStorage();

  @override
  void onInit() async {
    await GetStorage.init();
    onStorageLoad();
    setFirstTime();
    super.onInit();
  }

  bool isFirstTime() {
    return storage.read('isFirstTime') == null;
  }

  void setFirstTime() {
    storage.write('isFirstTime', true);
  }
}
