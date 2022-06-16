import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/controllers/Chat/new_message_screen_controller.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/Chat/online_user.dart';
import 'package:message_app/widgets/DarkBackground/dark_radial_background.dart';
import 'package:message_app/widgets/Forms/search_box.dart';
import 'package:message_app/widgets/Navigation/default_back.dart';

class NewMessageScreen extends StatelessWidget {
  const NewMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewMessageScreenController>(
        init: NewMessageScreenController(),
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                const DarkRadialBackground(
                  color: AppColors.heavyDarkBlue,
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: DefaultNav(
                        title: "New Message",
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
                                    placeholder: 'Search Members',
                                    controller: controller.searchController,
                                  ),
                                  AppSpaces.vertical20,
                                  Text(
                                    "SUGGESTED",
                                    style: GoogleFonts.lato(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyBlue,
                                    ),
                                  ),
                                  AppSpaces.vertical20,
                                  const Divider(
                                    height: 2,
                                    color: AppColors.greyBlue,
                                  ),
                                  AppSpaces.vertical20,
                                  Expanded(
                                    child: MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: ListView(
                                        children: controller.users.map((e) {
                                          return OnlineUser(
                                            user: e,
                                            onTap: () => Get.showOverlay<dynamic>(
                                              asyncFunction: () => controller.createPrivateChat(e),
                                              loadingWidget: const Center(
                                                child: CircularProgressIndicator(),
                                              ),
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
