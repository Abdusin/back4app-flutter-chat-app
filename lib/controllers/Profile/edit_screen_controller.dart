import 'package:get/get.dart';
import 'package:message_app/controllers/globals/form_controller.dart';
import 'package:message_app/controllers/globals/overlay_mixin.dart';
import 'package:message_app/controllers/globals/text_field_controller.dart';
import 'package:message_app/values/values.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class EditScreenController extends FormController with OverlayMixin {
  ParseUser get user => AppDatas.user!;
  late final usernameController = TextFieldController(
    id: 'username',
    validator: nameValidation,
    keyboardType: TextInputType.text,
    passwordMode: false,
    value: user.username,
  );
  late final bioController = TextFieldController(
    id: 'bio',
    keyboardType: TextInputType.text,
    passwordMode: false,
    value: user.get('bio') ?? '',
  );

  void changeImage() {
    var images = ['1', '2', '4', '7', '9'];
    var userActiveImage = user.get('image', defaultValue: '1');
    var index = images.indexOf(userActiveImage as String);
    if (index == images.length - 1) {
      user.set('image', images[0]);
    } else {
      user.set('image', images[index + 1]);
    }
    update();
  }

  @override
  void submit() async {
    super.submit();
    if (validate()) {
      showLoading();
      user.username = usernameController.text;
      user.set('bio', bioController.text);
      var response = await user.save();
      hideLoading();
      if (response.success) {
        showSuccessSnackbar('Profile Updated');
        AppDatas.user = response.result as ParseUser;
        Get.back();
      } else {
        showErrorSnackbar(response.error!.message);
      }
    }
  }
}
