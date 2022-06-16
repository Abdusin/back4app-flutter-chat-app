import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';

class UnlabelledFormInput extends StatelessWidget {
  final String placeholder;
  final TextInputType keyboardType;
  final bool? autofocus;
  final bool obscureText;
  final TextEditingController? controller;
  const UnlabelledFormInput({
    Key? key,
    this.autofocus,
    required this.placeholder,
    required this.keyboardType,
    this.controller,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: autofocus ?? false,
      style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
      onTap: () {},
      keyboardType: keyboardType,
      //initialValue: initialValue,
      obscureText: placeholder == 'Password' || placeholder == 'Choose a password' ? true : false,

      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 18,
          ),
          suffixIcon: placeholder == "Password"
              ? InkWell(
                  onTap: () {},
                  child: Icon(
                    obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                    size: 15.0,
                    color: AppColors.darkBlue2,
                  ))
              : InkWell(
                  onTap: () {
                    controller!.text = "";
                  },
                  child: const Icon(FontAwesomeIcons.solidCircleXmark, color: Colors.white70, size: 20),
                ),
          hintText: placeholder,
          hintStyle: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.darkBlue2),
          filled: false,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkBlue2),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGreen),
          ),
          border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
    );
  }
}
