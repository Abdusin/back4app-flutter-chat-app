import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_app/controllers/Chat/chat_screen_controller.dart';
import 'package:message_app/values/values.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          try {
            Get.find<ChatScreenController>(tag: 'ChatScreenController').update();
          } catch (e) {
            debugPrint('Chat Screen Controller not found');
          }
          Get.back();
        },
        child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 3,
              color: AppColors.darkBlue,
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.white,
            ),
          ),
        ));
  }
}
