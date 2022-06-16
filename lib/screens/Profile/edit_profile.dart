import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/controllers/Profile/edit_screen_controller.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/Buttons/primary_progress_button.dart';
import 'package:message_app/widgets/DarkBackground/dark_radial_background.dart';
import 'package:message_app/widgets/Forms/form_input_with_label.dart';
import 'package:message_app/widgets/Navigation/default_back.dart';
import 'package:message_app/widgets/dummy/profile_dummy.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditScreenController>(
        init: EditScreenController(),
        builder: (controller) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: Stack(
                children: [
                  const DarkRadialBackground(
                    color: AppColors.heavyDarkBlue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SafeArea(
                      child: SingleChildScrollView(
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              AppSpaces.vertical25,
                              DefaultNav(
                                title: "Edit Profile",
                                action: Align(
                                  alignment: Alignment.centerRight,
                                  child: PrimaryProgressButton(
                                    width: 70,
                                    height: 40,
                                    callback: controller.submit,
                                    label: "Done",
                                    textStyle: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Stack(
                                children: [
                                  ProfileDummy(
                                    color: AppColors.lightBlue,
                                    dummyType: ProfileDummyType.image,
                                    scale: 3.0,
                                    image: "assets/memoji/${controller.user.get('image', defaultValue: '1')}.png",
                                  ),
                                  GestureDetector(
                                    onTap: controller.changeImage,
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryAccentColor.withOpacity(0.75),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        FeatherIcons.shuffle,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AppSpaces.vertical20,
                              LabelledFormInput(
                                placeholder: "Username",
                                controller: controller.usernameController,
                                label: "Your Username",
                              ),
                              AppSpaces.vertical20,
                              LabelledFormInput(
                                placeholder: "Bio",
                                controller: controller.bioController,
                                label: "Your Bio",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
