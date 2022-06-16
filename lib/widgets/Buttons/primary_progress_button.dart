import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';

class PrimaryProgressButton extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final VoidCallback? callback;
  const PrimaryProgressButton({
    Key? key,
    required this.label,
    this.callback,
    this.width,
    this.height,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 130,
      height: height ?? 60,
      child: ElevatedButton(
        onPressed: callback,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.heavyBlue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(
                color: AppColors.heavyBlue,
              ),
            ),
          ),
        ),
        child: Text(
          label,
          style: textStyle ??
              GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
