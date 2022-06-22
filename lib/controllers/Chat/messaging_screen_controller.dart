import 'dart:async';

import 'package:get/get.dart';
import 'package:message_app/controllers/globals/text_field_controller.dart';
import 'package:message_app/models/group_model.dart';
import 'package:message_app/models/message.dart';
import 'package:message_app/screens/Chat/new_group.dart';
import 'package:message_app/values/values.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class MessagingScreenController extends GetxController {
  final GroupModel model;
  late final ParseUser otherUser = model.user;

  MessagingScreenController(this.model);
  final messageController = TextFieldController(updateOnEmptyChange: true);
  late var chatObject = QueryBuilder(MessageObject())
    ..whereEqualTo('group', model.parseObject.toPointer())
    ..orderByAscending('createdAt');

  final liveQuery = LiveQuery();

  final messages = <MessageObject>[];

  late Timer timer;
  @override
  void onInit() {
    getMessages();
    liveQuerySubscription();
    super.onInit();
  }

  late Subscription<MessageObject> subscription;
  void liveQuerySubscription() async {
    subscription = await liveQuery.client.subscribe(chatObject);
    subscription.on(LiveQueryEvent.create, (object) {
      if (object is MessageObject) {
        if (!messages.any((element) => element.objectId == object.objectId)) {
          messages.add(object);
          update();
        }
      }
    });
  }

  @override
  void onClose() {
    liveQuery.client.unSubscribe(subscription);
    super.onClose();
  }

  Future getMessages() async {
    final result = await chatObject.find();
    messages.addAll(result);
    update();
  }

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      MessageObject()
        ..set('fromUser', AppDatas.user!.toPointer())
        ..set('group', model.parseObject.toPointer())
        ..set('Message', messageController.text)
        ..set('type', 'text')
        ..save();
      model.parseObject
        ..set('lastMessageDate', DateTime.now())
        ..save();
      update();
      messageController.clear();
    }
  }

  void edit() async {
    await Get.to(NewGroupScreen(groupModel: model));
    update();
  }
}
