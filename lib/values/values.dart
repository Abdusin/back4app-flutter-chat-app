// ignore_for_file: non_constant_identifier_names, constant_identifier_names

library values;

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/models/group_model.dart';
import 'package:message_app/models/group_user.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
part './app_colors.dart';
part './styles.dart';
part './button_styles.dart';
part './box_decoration_styles.dart';
part './spacing.dart';
part './typedefs.dart';
part './functions.dart';

class AppDatas {
  static late final String KeyApplicationId;
  static late final String KeyClientKey;
  static late final String LiveQueryUrl;
  static const KeyServerUrl = 'https://parseapi.back4app.com';

  static final users = <ParseUser>[];
  static final groupUserList = <GroupUser>[];
  static final baseGroupList = <BaseGroupModel>[];
  static final groupList = <GroupModel>[];
  static final privateList = <GroupModel>[];

  static ParseUser? _user;
  static ParseUser? get user => _user;
  static set user(ParseUser? user) {
    _user = user;
    if (user != null) {
      GetStorage.init().then((_) {
        GetStorage().write('session', user.sessionToken);
      });
    } else {
      GetStorage.init().then((_) {
        GetStorage().remove('session');
      });
    }
  }

  static void clear() {
    user = null;
    users.clear();
    groupUserList.clear();
    baseGroupList.clear();
    groupList.clear();
    privateList.clear();
  }
}
