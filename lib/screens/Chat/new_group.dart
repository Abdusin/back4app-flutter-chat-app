import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_app/controllers/Chat/new_group_screen_controller.dart';
import 'package:message_app/models/group_model.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/Buttons/primary_buttons.dart';
import 'package:message_app/widgets/DarkBackground/dark_radial_background.dart';
import 'package:message_app/widgets/Forms/search_box.dart';
import 'package:message_app/widgets/Navigation/default_back.dart';
import 'package:message_app/widgets/employee_card.dart';

class NewGroupScreen extends StatelessWidget {
  const NewGroupScreen({Key? key, this.groupModel}) : super(key: key);
  final GroupModel? groupModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewGroupScreenController>(
        init: NewGroupScreenController(groupModel: groupModel),
        builder: (controller) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: controller.deleteGroup,
              child: const Icon(Icons.delete),
              backgroundColor: Colors.red,
            ),
            body: Stack(
              children: [
                const DarkRadialBackground(
                  color: AppColors.heavyDarkBlue,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DefaultNav(
                        title: groupModel == null ? "New Group" : "Edit Group",
                        action: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppPrimaryButton(
                              buttonHeight: 40,
                              buttonText: groupModel == null ? "Next" : "Save",
                              callback: () {
                                Get.showOverlay(
                                  asyncFunction: controller.createGroupChat,
                                  loadingWidget: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecorationStyles.fadingGlory,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: DecoratedBox(
                            decoration: BoxDecorationStyles.fadingInnerDecor,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SearchBox(
                                    prefixIcon: const SizedBox.shrink(),
                                    placeholder: 'Group Name',
                                    controller: controller.groupNameController,
                                  ),
                                  AppSpaces.vertical20,
                                  Expanded(
                                    child: MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: ListView(
                                        children: controller.users.map((e) {
                                          return GestureDetector(
                                            onTap: () => controller.onUserSelected(e),
                                            child: EmployeeCard(
                                              selected: controller.selectedUsers.contains(e),
                                              user: e,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
