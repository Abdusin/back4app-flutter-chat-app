import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/controllers/globals/text_field_controller.dart';
import 'package:message_app/values/values.dart';

class LabelledFormInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextFieldController controller;
  final Widget Function(TextFieldController controller)? suffixIcon;
  const LabelledFormInput({
    Key? key,
    required this.placeholder,
    required this.controller,
    required this.label,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextFieldController>(
      init: controller,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label.isNotEmpty) ...[
              AppSpaces.vertical10,
              Text(
                label.toUpperCase(),
                textAlign: TextAlign.left,
                style: GoogleFonts.lato(
                  fontSize: 12,
                  color: AppColors.darkBlue2,
                ),
              ),
            ],
            Obx(
              () {
                return TextFormField(
                  controller: controller.controller,
                  style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                  keyboardType: controller.keyboardType,
                  obscureText: controller.obscureText.value,
                  validator: controller.validator,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 20,
                    ),
                    suffixIcon: suffixIcon != null
                        ? suffixIcon!(controller)
                        : (controller.passwordMode
                            ? InkWell(
                                onTap: controller.toggleObscureText,
                                child: Icon(
                                  controller.obscureText.isTrue ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                                  color: AppColors.darkBlue2,
                                ),
                              )
                            : InkWell(
                                onTap: controller.clear,
                                child:
                                    const Icon(FontAwesomeIcons.solidCircleXmark, size: 20, color: AppColors.darkBlue2),
                              )),
                    hintText: placeholder,
                    hintStyle: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.darkBlue2),
                    filled: false,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.darkBlue2),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightGreen),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
