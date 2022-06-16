import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/controllers/Chat/messaging_screen_controller.dart';
import 'package:message_app/models/group_model.dart';
import 'package:message_app/models/message.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/Chat/online_user.dart';
import 'package:message_app/widgets/Chat/post_bottom_widget.dart';
import 'package:message_app/widgets/DarkBackground/dark_radial_background.dart';
import 'package:message_app/widgets/Navigation/default_back.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class MessagingScreen extends StatelessWidget {
  const MessagingScreen({Key? key, required this.model}) : super(key: key);
  final GroupModel model;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessagingScreenController>(
      init: MessagingScreenController(model),
      builder: (controller) {
        var user = model.user;
        return Scaffold(
          body: Stack(
            children: [
              const DarkRadialBackground(
                color: AppColors.heavyDarkBlue,
              ),
              SizedBox(
                width: Get.width,
                height: Get.height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          AppSpaces.vertical20,
                          DefaultNav(
                            title: !model.private ? model.name : user.username ?? '',
                            action: model.private || !model.isAdmin
                                ? null
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: controller.edit,
                                        icon: const Icon(FeatherIcons.settings),
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ),
                    AppSpaces.vertical15,
                    Expanded(
                      child: ListView.separated(
                        itemCount: controller.messages.length,
                        separatorBuilder: (context, index) => AppSpaces.vertical10,
                        itemBuilder: (context, index) {
                          var message = controller.messages[index];
                          return MessageWidget(message: message, isGroup: !model.private);
                        },
                      ),
                    ),
                    PostBottomWidget(
                      label: "Write a message",
                      sendButtonClicked: controller.sendMessage,
                      controller: controller.messageController,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SentImage extends StatelessWidget {
  final String image;
  const SentImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          width: 200,
          fit: BoxFit.fitWidth,
          image: AssetImage(image),
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final MessageObject message;
  final bool isGroup;
  const MessageWidget({
    Key? key,
    required this.message,
    required this.isGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: message.amISender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (isGroup) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                message.user.username ?? '',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: AppColors.bluePurple,
                ),
              ),
            ),
          ],
          FittedBox(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
              decoration: BoxDecoration(
                color: message.amISender ? AppColors.primaryAccentColor : AppColors.primaryBackgroundColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                message.message,
                style: GoogleFonts.lato(color: Colors.white),
              ),
            ),
          ),
          TimeReceipt(time: '${message.createdAt.hour} : ${message.createdAt.minute}'),
        ],
      ),
    );
  }
}

class MessengerDetails extends StatelessWidget {
  const MessengerDetails({
    Key? key,
    required this.user,
  }) : super(key: key);

  final ParseUser user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [OnlineUser(user: user, onTap: () {}), AppSpaces.horizontal10, const TimeReceipt(time: "12:11 PM")],
      ),
    );
  }
}

class TimeReceipt extends StatelessWidget {
  final String time;
  const TimeReceipt({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(time, style: GoogleFonts.lato(color: Colors.white, fontSize: 10.0));
  }
}
