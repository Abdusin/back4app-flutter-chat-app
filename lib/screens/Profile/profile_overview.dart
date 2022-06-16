import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/Screens/Profile/my_profile.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/Buttons/primary_progress_button.dart';
import 'package:message_app/widgets/Buttons/progress_card_close_button.dart';
import 'package:message_app/widgets/DarkBackground/dark_radial_background.dart';
import 'package:message_app/widgets/Profile/badged_container.dart';
import 'package:message_app/widgets/Profile/text_outlined_button.dart';
import 'package:message_app/widgets/container_label.dart';
import 'package:message_app/widgets/dummy/profile_dummy.dart';

import 'profile_notification_settings.dart';

class ProfileOverview extends StatelessWidget {
  const ProfileOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DarkRadialBackground(
            color: AppColors.heavyDarkBlue,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                const Align(
                  alignment: Alignment.center,
                  child: ProfileDummy(
                    color: AppColors.lightBlue,
                    dummyType: ProfileDummyType.image,
                    scale: 3.0,
                    image: "assets/man-head.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Blake Gordon",
                      style: GoogleFonts.lato(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                ),
                Text("blake@email.com", style: GoogleFonts.lato(color: AppColors.lightBlue, fontSize: 17)),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: OutlinedButtonWithText(
                    width: 150,
                    content: "View Profile",
                    onPressed: () {
                      Get.to(() => const ProfilePage());
                    },
                  ),
                ),
                AppSpaces.vertical20,
                const ContainerLabel(label: "Workspace"),
                AppSpaces.vertical10,
                Container(
                  width: double.infinity,
                  height: 90,
                  padding: const EdgeInsets.all(20.0),
                  decoration:
                      BoxDecoration(color: AppColors.primaryBackgroundColor, borderRadius: BorderRadius.circular(10)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const ProfileDummy(
                        color: AppColors.lightBlue,
                        dummyType: ProfileDummyType.image,
                        scale: 1.20,
                        image: "assets/man-head.png",
                      ),
                      AppSpaces.horizontal20,
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text("UI8 Design",
                            style: GoogleFonts.lato(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text("hello@ui8.net",
                            style: GoogleFonts.lato(fontWeight: FontWeight.bold, color: AppColors.greyBlue))
                      ])
                    ]),
                    PrimaryProgressButton(
                      width: 90,
                      height: 40,
                      label: "Invite",
                      textStyle: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
                AppSpaces.vertical20,
                const ContainerLabel(label: "Notification"),
                AppSpaces.vertical10,
                BadgedContainer(
                  label: "Do not disturb",
                  callback: () {
                    Get.to(() => ProfileNotificationSettings());
                  },
                  value: "Off",
                  badgeColor: "FDA5FF",
                ),
                AppSpaces.vertical20,
                const ContainerLabel(label: "Manage"),
                AppSpaces.vertical10,
                Row(children: [
                  Expanded(
                    flex: 1,
                    child: BadgedContainer(
                      label: "Team",
                      value: "8",
                      badgeColor: "FDA5FF",
                      callback: () {},
                    ),
                  ),
                  AppSpaces.horizontal10,
                  const Expanded(
                    flex: 1,
                    child: BadgedContainer(
                      label: "Labels",
                      value: "12",
                      badgeColor: "FFDE72",
                    ),
                  )
                ]),
                AppSpaces.vertical20,
                Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: HexColor.fromHex("FF968E"),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Log Out",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
              ])))),
          Positioned(
            top: 50,
            left: 20,
            child: Transform.scale(
              scale: 1.2,
              child: ProgressCardCloseButton(
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
