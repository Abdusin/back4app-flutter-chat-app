import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_app/Screens/Chat/messaging_screen.dart';
import 'package:message_app/controllers/Chat/chat_screen_controller.dart';
import 'package:message_app/screens/Chat/new_group.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/screens/Profile/my_profile.dart';
import 'package:message_app/widgets/Chat/add_chat_icon.dart';
import 'package:message_app/widgets/Chat/badged_title.dart';
import 'package:message_app/widgets/Chat/online_user.dart';
import 'package:message_app/widgets/Chat/selection_tab.dart';
import 'package:message_app/widgets/DarkBackground/dark_radial_background.dart';
import 'package:message_app/widgets/Forms/search_box.dart';
import 'package:message_app/widgets/Navigation/app_header.dart';
import 'package:message_app/widgets/dummy/profile_dummy.dart';
import 'package:message_app/widgets/stacked_images.dart';
import 'new_message_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(ChatScreenController(), tag: 'ChatScreenController', permanent: true);
    return GetBuilder<ChatScreenController>(
      init: _controller,
      builder: (controller) {
        return SafeArea(
          top: false,
          child: Scaffold(
            body: Stack(
              children: [
                const DarkRadialBackground(
                  color: AppColors.heavyDarkBlue,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20.0),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TaskezAppHeader(
                          title: "Chat",
                          leading: GestureDetector(
                            onTap: () {
                              Get.to(() => const ProfilePage());
                            },
                            child: const ProfileDummy(
                              dummyType: ProfileDummyType.icon,
                              scale: 1.0,
                              color: AppColors.purple,
                            ),
                          ),
                          widget: const AppAddIcon(page: NewMessageScreen()),
                        ),
                        AppSpaces.vertical20,
                        SearchBox(placeholder: 'Search', controller: controller.searchController),
                        AppSpaces.vertical20,
                        const SelectionTab(title: "GROUP", page: NewGroupScreen()),
                        if (AppDatas.groupList.isEmpty) ...[
                          AppSpaces.vertical20,
                          const Center(
                              child: Text(
                            "No group found",
                            style: TextStyle(
                              color: AppColors.labelColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                        ] else ...[
                          Expanded(
                            child: ListView(
                              children: [
                                for (var item in AppDatas.groupList) ...[
                                  GestureDetector(
                                    onTap: () => Get.to(() => MessagingScreen(model: item)),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      AppSpaces.vertical20,
                                      BadgedTitle(
                                        title: item.name,
                                        color: 'A5EB9B',
                                        number: item.userIds.length.toString(),
                                      ),
                                      Transform.scale(
                                        alignment: Alignment.centerLeft,
                                        scale: 0.8,
                                        child: BuildStackedImages(users: item.users),
                                      ),
                                    ]),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                        AppSpaces.vertical20,
                        const SelectionTab(title: "DIRECT MESSAGES", page: NewMessageScreen()),
                        AppSpaces.vertical20,
                        if (AppDatas.privateList.isEmpty) ...[
                          AppSpaces.vertical20,
                          const Center(
                              child: Text(
                            "No direct message found",
                            style: TextStyle(
                              color: AppColors.labelColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                        ] else ...[
                          Expanded(
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.builder(
                                itemCount: AppDatas.privateList.length,
                                itemBuilder: (context, index) {
                                  return OnlineUser(
                                    user: AppDatas.privateList[index].user,
                                    onTap: () => Get.to(() => MessagingScreen(model: AppDatas.privateList[index])),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
