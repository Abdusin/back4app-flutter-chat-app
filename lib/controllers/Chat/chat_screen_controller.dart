import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_app/models/group_model.dart';
import 'package:message_app/models/group_user.dart';
import 'package:message_app/values/values.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ChatScreenController extends GetxController {
  final searchController = TextEditingController();

  @override
  void onInit() {
    Future.wait([
      getDatas(),
      getChats(),
    ]);
    super.onInit();
  }

  Future getDatas() async {
    var response = await ParseUser.forQuery().getAll();
    if (response.results != null) {
      AppDatas.users.clear();
      AppDatas.users.addAll(response.results!.cast<ParseUser>());
      AppDatas.users.removeWhere((u) => u.objectId == AppDatas.user!.objectId);
      update();
    }
  }

  Future getChats() async {
    final ParseResponse result = await Functions.chats.executeObjectFunction<ParseObject>();
    if (result.success) {
      AppDatas.groupUserList.clear();
      AppDatas.baseGroupList.clear();
      AppDatas.groupList.clear();
      AppDatas.privateList.clear();
      var ids = <String>{};
      for (var item in result.result['result'] as List) {
        AppDatas.groupUserList.add(GroupUser(
          item['user']['objectId'],
          item['groupId']['objectId'],
        ));
        ids.add(item['groupId']['objectId']);
      }
      await Future.wait(ids.map((e) => getGroupData(e)));
      var list = AppDatas.baseGroupList.map((e) => GroupModel.fromBase(
          e, AppDatas.groupUserList.where((element) => element.groupId == e.id).map((e) => e.userId).toList()));
      AppDatas.groupList.addAll(list.where((element) => !element.private));
      AppDatas.privateList.addAll(list.where((element) => element.private));
      update();
    }
  }

  Future getGroupData(groupId) async {
    var response = await ParseObject('Group').getObject(groupId);
    var group = response.result as ParseObject;
    AppDatas.baseGroupList.add(BaseGroupModel.fromObject(group));
  }
}
