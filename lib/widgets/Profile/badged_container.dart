import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';

class BadgedContainer extends StatelessWidget {
  final String label;
  final String value;
  final String badgeColor;
  final VoidCallback? callback;

  const BadgedContainer({Key? key, required this.label, required this.value, required this.badgeColor, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: double.infinity,
        height: 90,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(color: AppColors.primaryBackgroundColor, borderRadius: BorderRadius.circular(10)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: HexColor.fromHex("A06AFA"), shape: BoxShape.circle),
              child: const Icon(Icons.do_not_disturb, color: Colors.white, size: 30)),
          AppSpaces.horizontal20,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: GoogleFonts.lato(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            (value == "Off")
                ? Text(value, style: GoogleFonts.lato(fontWeight: FontWeight.bold, color: AppColors.greyBlue))
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor.fromHex(badgeColor),
                    ),
                    child: Text(value, style: GoogleFonts.lato(fontWeight: FontWeight.bold)))
          ])
        ]),
      ),
    );
  }
}
