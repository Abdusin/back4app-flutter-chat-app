import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

mixin OverlayMixin on GetxController {
  void showErrorSnackbar(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
    );
  }

  void showSuccessSnackbar(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
    );
  }

  @protected
  OverlayState get overlayState => Overlay.of(Get.overlayContext!, rootOverlay: true)!;
  OverlayEntry? loadingEntry;

  void showLoading() {
    loadingEntry = OverlayEntry(builder: (context) => LodingDialog(hide: hideLoading));
    overlayState.insert(loadingEntry!);
  }

  void hideLoading() {
    if (loadingEntry == null) return;
    loadingEntry!.remove();
    loadingEntry = null;
  }
}

class LodingDialog extends StatelessWidget {
  const LodingDialog({Key? key, required this.hide}) : super(key: key);
  final VoidCallback hide;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.1),
        body: Center(
          child: GestureDetector(
              onTap: () {
                if (kDebugMode) {
                  hide();
                }
              },
              child: RefreshProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Get.theme.primaryColor))),
        ),
      ),
    );
  }
}
