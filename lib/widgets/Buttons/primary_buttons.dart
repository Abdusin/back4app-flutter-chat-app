import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';

enum PrimaryButtonSizes { small, medium, large }

class AppPrimaryButton extends StatelessWidget {
  final double buttonHeight;
  final double? buttonWidth;

  final String buttonText;
  final VoidCallback? callback;
  const AppPrimaryButton(
      {Key? key, this.callback, required this.buttonText, required this.buttonHeight, this.buttonWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
          onPressed: callback,
          style: ButtonStyles.blueRounded,
          child: Text(buttonText,
              style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
    );
  }
}
