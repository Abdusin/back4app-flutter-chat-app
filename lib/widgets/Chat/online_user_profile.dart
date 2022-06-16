import 'package:flutter/material.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/dummy/profile_dummy.dart';

class OnlineUserProfile extends StatelessWidget {
  final String image;
  final String imageBackground;
  const OnlineUserProfile({Key? key, required this.image, required this.imageBackground}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileDummy(
            dummyType: ProfileDummyType.image, scale: 1, image: image, color: HexColor.fromHex(imageBackground)),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.heavyLightGreen,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
