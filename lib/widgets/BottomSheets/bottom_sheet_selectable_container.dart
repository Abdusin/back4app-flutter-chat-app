import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';

class SelectableContainer extends StatelessWidget {
  const SelectableContainer({
    Key? key,
    required this.value,
    required this.icon,
    this.containerColor,
    this.valueColor,
  }) : super(key: key);

  final String value;
  final IconData icon;
  final Color? containerColor;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 60,
        decoration:
            BoxDecoration(color: containerColor ?? HexColor.fromHex("161A1F"), borderRadius: BorderRadius.circular(10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(value,
              style: GoogleFonts.lato(
                color: valueColor ?? Colors.white,
              )),
          Icon(icon, color: Colors.white)
        ]));
  }
}
