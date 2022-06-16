import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:message_app/controllers/splash_screen_controller.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/DarkBackground/dark_radial_background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: const [
              DarkRadialBackground(
                color: AppColors.heavyDarkBlue,
                position: Alignment(1.0, 1.0),
              ),
              Center(
                child: Image(
                  image: AssetImage("assets/icon/icon.png"),
                  height: 50,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
