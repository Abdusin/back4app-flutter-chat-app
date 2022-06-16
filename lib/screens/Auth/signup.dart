import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/controllers/Auth/signup_screen_controller.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/DarkBackground/dark_radial_background.dart';
import 'package:message_app/widgets/Forms/form_input_with_label.dart';
import 'package:message_app/widgets/Navigation/back_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupScreenController>(
      init: SignupScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              const DarkRadialBackground(
                color: AppColors.heavyDarkBlue,
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: SafeArea(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppBackButton(),
                        const SizedBox(height: 40),
                        Text(
                          'Sign Up',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AppSpaces.vertical20,
                        LabelledFormInput(
                          placeholder: "Username",
                          controller: controller.usernameController,
                          label: "Your Username",
                        ),
                        const SizedBox(height: 15),
                        LabelledFormInput(
                          placeholder: "Email",
                          controller: controller.emailController,
                          label: "Your Email",
                        ),
                        const SizedBox(height: 15),
                        LabelledFormInput(
                          placeholder: "Password",
                          controller: controller.passwordController,
                          label: "Your Password",
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: controller.submit,
                            style: ButtonStyles.blueRounded,
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
