import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/Shapes/dashed_circle.dart';

class SelectionTab extends StatelessWidget {
  final String title;
  final StatelessWidget? page;
  const SelectionTab({Key? key, required this.title, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title,
              style: GoogleFonts.lato(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.greyBlue,
              )),
          InkWell(
            onTap: () {
              Get.to(() => page!);
            },
            child: const CircularBorder(
                color: AppColors.greyBlue,
                width: 1,
                size: 20,
                icon: Icon(Icons.add, size: 15, color: AppColors.greyBlue)),
          ),
        ]),
        AppSpaces.vertical20,
        const Divider(
          height: 2,
          color: AppColors.greyBlue,
        ),
      ]),
    );
  }
}
