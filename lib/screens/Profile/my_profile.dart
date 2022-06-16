import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/screens/Profile/edit_profile.dart';
import 'package:message_app/screens/onboard_screen.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/DarkBackground/dark_radial_background.dart';
import 'package:message_app/widgets/Navigation/default_back.dart';
import 'package:message_app/widgets/Profile/profile_text_option.dart';
import 'package:message_app/widgets/dummy/profile_dummy.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String tabSpace = "\t\t";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DarkRadialBackground(
            color: AppColors.heavyDarkBlue,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppSpaces.vertical25,
                    const DefaultNav(title: "Profile"),
                    AppSpaces.vertical25,
                    ProfileDummy(
                      color: AppColors.lightBlue,
                      dummyType: ProfileDummyType.image,
                      scale: 4.0,
                      image: "assets/memoji/${AppDatas.user!.get('image', defaultValue: '1')}.png",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${AppDatas.user!.username}',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '${AppDatas.user!.emailAddress}',
                      style: GoogleFonts.lato(
                        color: AppColors.lightBlue,
                        fontSize: 17,
                      ),
                    ),
                    AppSpaces.vertical20,
                    Column(
                      children: [
                        ProfileTextOption(
                          label: '$tabSpace Edit',
                          icon: FeatherIcons.edit,
                          onTap: () => Get.to(() => const EditProfileScreen())!.then((value) => setState(() {})),
                          margin: 5.0,
                        ),
                        const Divider(height: 20, color: AppColors.darkGreyBlue),
                        ProfileTextOption(
                          label: '$tabSpace Signout',
                          icon: FeatherIcons.logOut,
                          onTap: () {
                            AppDatas.clear();
                            Get.offAll(() => const OnboardScreen());
                          },
                          margin: 5.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
