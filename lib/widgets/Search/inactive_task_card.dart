import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/dummy/green_done_icon.dart';

class InactiveTaskCard extends StatelessWidget {
  final String header;
  final String subHeader;
  final ValueNotifier<bool> notifier;
  final String date;
  const InactiveTaskCard(
      {Key? key, required this.notifier, required this.header, required this.subHeader, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.value = !notifier.value;
      },
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryBackgroundColor, width: 4),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryBackgroundColor,
                    ),
                    child: const GreenDoneIcon()),
                AppSpaces.horizontal20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      header,
                      style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Text(
                      subHeader,
                      style: GoogleFonts.lato(color: AppColors.greyBlue2),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              date,
              style: GoogleFonts.lato(color: AppColors.greyBlue2),
            )
          ],
        ),
      ),
    );
  }
}
