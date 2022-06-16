import 'package:get/get.dart';
import 'package:message_app/controllers/globals/form_controller.dart';
import 'package:message_app/controllers/globals/overlay_mixin.dart';
import 'package:message_app/controllers/globals/text_field_controller.dart';
import 'package:message_app/screens/Chat/chat_screen.dart';
import 'package:message_app/values/values.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class SignupScreenController extends FormController with OverlayMixin {
  late final usernameController = TextFieldController(
    id: 'username',
    validator: nameValidation,
    keyboardType: TextInputType.text,
    passwordMode: false,
  );
  late final passwordController = TextFieldController(
    id: 'password',
    validator: passwordValidation,
    keyboardType: TextInputType.text,
    passwordMode: true,
  );
  late final emailController = TextFieldController(
    id: 'email',
    validator: emailValidation,
    keyboardType: TextInputType.emailAddress,
    passwordMode: false,
  );

  @override
  void submit() async {
    super.submit();
    if (validate()) {
      showLoading();
      var parseUser = ParseUser.createUser(usernameController.text, passwordController.text, emailController.text);
      var response = await parseUser.signUp();
      hideLoading();
      if (response.success) {
        showSuccessSnackbar('Signup Successful');
        AppDatas.user = response.result as ParseUser;
        Get.to(() => const ChatScreen());
      } else {
        showErrorSnackbar(response.error!.message);
      }
    }
  }
}
