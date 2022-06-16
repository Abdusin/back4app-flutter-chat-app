import 'package:message_app/values/values.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class BaseGroupModel {
  final String id;
  String name;
  final String adminId;
  final bool private;
  BaseGroupModel._(this.id, this.name, this.adminId, this.private);
  late ParseObject parseObject;
  factory BaseGroupModel.fromObject(ParseObject object) {
    return BaseGroupModel._(
      object.objectId!,
      object.get('Name'),
      object.get('admin').objectId,
      object.get('private'),
    )..parseObject = object;
  }

  bool get isAdmin => adminId == AppDatas.user!.objectId;
}

class GroupModel extends BaseGroupModel {
  List<String> userIds;
  late ParseUser user;
  late List<ParseUser> users;
  GroupModel._(String id, String name, String adminId, bool private, this.userIds)
      : super._(id, name, adminId, private) {
    users = AppDatas.users.where((element) => userIds.contains(element.objectId)).toList();
    user = users.first;
  }

  factory GroupModel.fromBase(BaseGroupModel base, List<String> userIds) {
    return GroupModel._(base.id, base.name, base.adminId, base.private, userIds)..parseObject = base.parseObject;
  }
}
