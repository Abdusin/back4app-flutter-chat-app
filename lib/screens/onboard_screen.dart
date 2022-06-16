import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/screens/Auth/login.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/screens/Auth/signup.dart';
import 'package:message_app/widgets/DarkBackground/dark_radial_background.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DarkRadialBackground(
            color: AppColors.heavyDarkBlue,
            position: Alignment(1.0, 1.0),
          ),
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                Image(
                  image: const AssetImage("assets/onboard.jpg"),
                  fit: BoxFit.fitHeight,
                  width: Get.width,
                  height: Get.height / 2,
                ),
                AppSpaces.vertical20,
                Text(
                  'APP NAME',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    backgroundColor: AppColors.heavyDarkBlue.withOpacity(0.4),
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(
                                  () => const LoginScreen(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.heavyBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                    color: AppColors.heavyBlue,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(
                                  () => const SignUpScreen(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                    color: AppColors.heavyBlue,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Register',
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'By continuing you agree Terms of Services & Privacy Policy.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                color: AppColors.labelColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
