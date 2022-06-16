import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';

class SearchBox extends StatelessWidget {
  final String placeholder;
  final Widget? prefixIcon;

  final TextEditingController? controller;
  const SearchBox({
    Key? key,
    required this.placeholder,
    this.prefixIcon,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
      onTap: () {},
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        prefixIcon: prefixIcon ??
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(FeatherIcons.search, color: Colors.white),
            ),
        suffixIcon: InkWell(
          onTap: () {
            controller!.text = "";
          },
          child: const Icon(FontAwesomeIcons.solidCircleXmark, color: Colors.white70, size: 20),
        ),
        hintText: placeholder,
        hintStyle: GoogleFonts.lato(
            //fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.darkBlue2),
        filled: true,
        fillColor: AppColors.primaryBackgroundColor,
        // enabledBorder: UnderlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: BorderSide(color: AppColors.darkBlue2),
        // ),
        // focusedBorder: UnderlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: BorderSide(color: AppColors.lightGreen),
        // ),
      ),
    );
  }
}
