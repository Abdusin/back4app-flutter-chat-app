import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';

class BadgedTitle extends StatelessWidget {
  final String title;
  final String number;
  final dynamic color;
  const BadgedTitle({Key? key, required this.title, required this.number, required this.color})
      : assert(
          color is String || color is Color,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var _color = color is String ? HexColor.fromHex(color) : color;
    return Row(
      children: [
        Text(title, style: GoogleFonts.lato(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
        AppSpaces.horizontal10,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: _color, width: 1),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Text(
            "$number members",
            style: GoogleFonts.lato(
              color: _color,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
