import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_app/models/group_model.dart';
import 'package:message_app/screens/Chat/chat_screen.dart';
import 'package:message_app/screens/Chat/messaging_screen.dart';
import 'package:message_app/values/values.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class NewGroupScreenController extends GetxController {
  final groupNameController = TextEditingController();
  late final List<ParseUser> _users = AppDatas.users.toList();
  GroupModel? groupModel;
  NewGroupScreenController({this.groupModel}) {
    if (groupModel != null) {
      groupNameController.text = groupModel!.name;
      selectedUsers.addAll(groupModel!.userIds.map((e) => _users.firstWhere((u) => u.objectId == e)));
    }
  }
  var selectedUsers = <ParseUser>[];

  List<ParseUser> get users => _users;

  @override
  void dispose() {
    groupNameController.dispose();
    super.dispose();
  }

  void onUserSelected(ParseUser user) {
    if (selectedUsers.contains(user)) {
      selectedUsers.remove(user);
    } else {
      selectedUsers.add(user);
    }
    update();
  }

  Future createGroupChat() async {
    if (groupNameController.text.trim().isEmpty) {
      return Get.snackbar(
        'Error',
        'Please enter group name',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
        borderColor: Colors.red,
        borderWidth: 1,
      );
    }
    try {
      if (groupModel != null) {
        groupModel!.parseObject.set<String>('Name', groupNameController.text);
        await Functions.updateGroup.executeObjectFunction<ParseObject>(parameters: {
          'groupId': groupModel!.parseObject.objectId,
          'groupName': groupNameController.text.trim(),
          'otherUserIds': selectedUsers.map((element) => element.objectId!).toList(),
        });
        groupModel!.userIds = selectedUsers.map((element) => element.objectId!).toList();
        groupModel!.name = groupNameController.text.trim();
        Get.back();
      } else {
        final ParseResponse result = await Functions.createGroup.executeObjectFunction<ParseObject>(parameters: {
          'groupName': groupNameController.text.trim(),
          'otherUserIds': selectedUsers.map((element) => element.objectId!).toList(),
        });
        if (result.success) {
          var response = result.result as ParseCloudFunction;
          final ParseObject group = response.get('result');
          AppDatas.baseGroupList.add(BaseGroupModel.fromObject(group));
          AppDatas.groupList.add(GroupModel.fromBase(
            AppDatas.baseGroupList.last,
            selectedUsers.map((element) => element.objectId!).toList(),
          ));
          Get.off(() => MessagingScreen(model: AppDatas.groupList.last));
        } else {
          Get.snackbar(
            'Error',
            result.error?.message ?? 'Error',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            margin: const EdgeInsets.all(10),
          );
        }
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

  void deleteGroup() {
    Get.defaultDialog(title: 'Delete Group', middleText: 'Are you sure you want to delete this group?', actions: [
      TextButton(
        child: const Text('Cancel'),
        onPressed: () {
          Get.back();
        },
      ),
      TextButton(
        child: const Text(
          'Delete',
          style: TextStyle(color: Colors.red),
        ),
        onPressed: () {
          Functions.deleteGroup.executeObjectFunction<ParseObject>(parameters: {
            'groupId': groupModel!.parseObject.objectId,
          });
          AppDatas.groupUserList.removeWhere((element) => element.groupId == groupModel!.parseObject.objectId);
          AppDatas.groupList.removeWhere((element) => element.parseObject.objectId == groupModel!.parseObject.objectId);
          AppDatas.baseGroupList
              .removeWhere((element) => element.parseObject.objectId == groupModel!.parseObject.objectId);
          Get.back();
          Get.offAll(() => const ChatScreen());
        },
      ),
    ]);
  }
}
