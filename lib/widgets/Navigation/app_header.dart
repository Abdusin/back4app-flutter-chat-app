import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';

import 'back_button.dart';

class TaskezAppHeader extends StatelessWidget {
  final String title;
  final bool? messagingPage;
  final Widget? widget;
  final Widget? leading;
  const TaskezAppHeader({Key? key, this.leading, this.widget, required this.title, this.messagingPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      leading ?? const AppBackButton(),
      (messagingPage != null)
          ? Row(children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.heavyLightGreen,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
              )
            ])
          : Text(
              title,
              style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
            ),
      widget!
    ]);
  }
}
