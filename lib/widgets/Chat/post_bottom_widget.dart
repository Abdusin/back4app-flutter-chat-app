import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_app/controllers/globals/text_field_controller.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/Forms/form_input_with_label.dart';

class PostBottomWidget extends StatelessWidget {
  final String label;
  final TextFieldController controller;
  final VoidCallback sendButtonClicked;
  const PostBottomWidget({
    required this.label,
    required this.sendButtonClicked,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
      width: Get.width,
      decoration: const BoxDecoration(
        color: AppColors.primaryBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: LabelledFormInput(
                placeholder: label,
                controller: controller,
                label: '',
                suffixIcon: (controller) => Transform.rotate(
                  angle: 195.2,
                  child: GestureDetector(
                    onTap: controller.text.isEmpty ? () {} : sendButtonClicked,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: controller.text.isEmpty ? Colors.grey : AppColors.primaryAccentColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 23,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AppSpaces.horizontal20,
          ],
        ),
      ),
    );
  }
}
