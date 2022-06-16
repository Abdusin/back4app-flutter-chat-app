import 'package:get/get.dart';
import 'package:message_app/controllers/globals/form_controller.dart';
import 'package:message_app/controllers/globals/overlay_mixin.dart';
import 'package:message_app/controllers/globals/text_field_controller.dart';
import 'package:message_app/screens/Chat/chat_screen.dart';
import 'package:message_app/values/values.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LoginScreenController extends FormController with OverlayMixin {
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

  @override
  void submit() async {
    super.submit();
    passwordController.unfocus();
    usernameController.unfocus();
    if (validate()) {
      showLoading();
      var parseUser = ParseUser(usernameController.text, passwordController.text, null);
      var response = await parseUser.login();
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
