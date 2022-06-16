import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/Buttons/primary_progress_button.dart';
import 'package:message_app/widgets/DarkBackground/dark_radial_background.dart';
import 'package:message_app/widgets/Navigation/app_header.dart';
import 'package:message_app/widgets/Onboarding/labelled_option.dart';
import 'package:message_app/widgets/container_label.dart';

class ProfileNotificationSettings extends StatelessWidget {
  final _assignmedToMe = ValueNotifier(true);
  final _taskCompleted = ValueNotifier(false);
  final _mentionedMe = ValueNotifier(true);
  final _directMessage = ValueNotifier(false);

  ProfileNotificationSettings({Key? key}) : super(key: key);

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
                child: Column(
                  children: [
                    TaskezAppHeader(
                      title: "Notifications",
                      widget: PrimaryProgressButton(
                        width: 80,
                        height: 40,
                        label: "Done",
                        textStyle: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    AppSpaces.vertical40,
                    Container(
                      width: double.infinity,
                      height: Get.height * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), color: AppColors.primaryBackgroundColor),
                      child: Column(
                        children: const [
                          LabelledOption(
                            label: '30 minutes',
                            icon: Icons.lock_clock,
                          ),
                          LabelledOption(
                            label: '1 hour',
                            icon: Icons.lock_clock,
                          ),
                          LabelledOption(
                            label: 'Until Tomorrow',
                            icon: Icons.calendar_today,
                          ),
                          LabelledOption(
                            label: 'Until next 2 days',
                            icon: Icons.calendar_today,
                          ),
                          LabelledOption(
                            label: 'Custom',
                            icon: Icons.calendar_today,
                          ),
                        ],
                      ),
                    ),
                    AppSpaces.vertical40,
                    const ContainerLabel(label: "NOTIFY MY ABOUT"),
                    AppSpaces.vertical40,
                    LabelledCheckbox(
                      label: "Task assigned to me",
                      notifierValue: _assignmedToMe,
                    ),
                    LabelledCheckbox(label: "Task completed", notifierValue: _taskCompleted),
                    LabelledCheckbox(label: "Mentioned Me", notifierValue: _mentionedMe),
                    LabelledCheckbox(label: "Direct Message", notifierValue: _directMessage),
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

class LabelledCheckbox extends StatelessWidget {
  final String label;
  final ValueNotifier<bool>? notifierValue;

  const LabelledCheckbox({
    required this.label,
    Key? key,
    this.notifierValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label, style: GoogleFonts.lato(color: Colors.white, fontSize: 17)),
      Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.grey,
        ),
        child: ValueListenableBuilder(
            valueListenable: notifierValue!,
            builder: (BuildContext context, _, __) {
              return Checkbox(
                  value: notifierValue!.value,
                  activeColor: AppColors.primaryAccentColor,
                  onChanged: (bool? value) => notifierValue!.value = value!);
            }),
      ),
    ]);
  }
}
