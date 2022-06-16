import 'package:get/get.dart';
import 'package:message_app/controllers/globals/storage_mixin.dart';
import 'package:message_app/models/message.dart';
import 'package:message_app/screens/Chat/chat_screen.dart';
import 'package:message_app/screens/onboard_screen.dart';
import 'package:message_app/values/values.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class SplashScreenController extends GetxController with GetStorageMixin {
  @override
  void onInit() {
    onStorageLoad = () async {
      await Parse().initialize(
        AppDatas.KeyApplicationId,
        AppDatas.KeyServerUrl,
        clientKey: AppDatas.KeyClientKey,
        liveQueryUrl: AppDatas.LiveQueryUrl,
        autoSendSessionId: true,
        registeredSubClassMap: <String, ParseObjectConstructor>{
          MessageObject.keyName: () => MessageObject(),
        },
      );
      var session = storage.read('session');
      if (session != null) {
        var response = await ParseUser.getCurrentUserFromServer(session);
        if (response?.success == true) {
          AppDatas.user = response!.result as ParseUser;
          Get.to(() => const ChatScreen());
          return;
        } else {
          storage.remove('session');
        }
      }
      await 1.delay();
      Get.to(() => const OnboardScreen());
    };
    super.onInit();
  }
}
