import 'package:message_app/values/values.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class MessageObject extends ParseObject implements ParseCloneable {
  MessageObject() : super(keyName);
  MessageObject.clone() : this();
  static const keyName = 'Chats';

  @override
  clone(Map<String, dynamic> map) => MessageObject.clone()..fromJson(map);

  @override
  DateTime get createdAt => super.createdAt ?? DateTime.now();

  String get message => get<String>('Message') ?? '';
  ParseUser? _user;
  ParseUser get user {
    _user ??= AppDatas.users.firstWhere(
      (element) => element.objectId == get('fromUser')['objectId'],
      orElse: () => AppDatas.user!,
    );
    return _user!;
  }

  bool get amISender => get('fromUser')['objectId'] == AppDatas.user!.objectId;
}
