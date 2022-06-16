import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_app/models/group_model.dart';
import 'package:message_app/screens/Chat/messaging_screen.dart';
import 'package:message_app/values/values.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class NewMessageScreenController extends GetxController {
  final searchController = TextEditingController();
  late final List<ParseUser> _users = AppDatas.users
      .where((element) => !AppDatas.privateList.any((priv) => priv.userIds.first == element.objectId))
      .toList();

  List<ParseUser> get users {
    if (searchController.text.trim().isEmpty) {
      return _users;
    } else {
      return _users
          .where((element) => element.username!.toLowerCase().contains(searchController.text.trim().toLowerCase()))
          .toList();
    }
  }

  @override
  void onInit() {
    searchController.addListener(update);
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future createPrivateChat(ParseUser otherUser) async {
    try {
      var otherUserId = otherUser.objectId!;
      final ParseResponse result = await Functions.createPrivateChat.executeObjectFunction<ParseObject>(parameters: {
        'otherUserId': otherUserId,
      });
      if (result.success) {
        var response = result.result as ParseCloudFunction;
        final ParseObject group = response.get('result');
        AppDatas.baseGroupList.add(BaseGroupModel.fromObject(group));
        AppDatas.privateList.add(GroupModel.fromBase(
          AppDatas.baseGroupList.last,
          [otherUserId],
        ));
        Get.off(() => MessagingScreen(model: AppDatas.privateList.last));
      } else {
        Get.snackbar(
          'Error',
          result.error?.message ?? 'Error',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          margin: const EdgeInsets.all(10),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occured',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(10),
      );
    }
  }
}
