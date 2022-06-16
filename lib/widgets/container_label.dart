import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';

class ContainerLabel extends StatelessWidget {
  final String label;
  const ContainerLabel({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: GoogleFonts.lato(
          fontSize: 12,
          color: AppColors.labelColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
