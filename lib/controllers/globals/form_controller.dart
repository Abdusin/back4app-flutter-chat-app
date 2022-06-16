import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_app/values/values.dart';

class FormController extends GetxController {
  late final FormKey formKey;
  FormController([GlobalKey<FormState>? key]) {
    formKey = key ?? GlobalKey<FormState>();
  }

  void submit() {
    FocusScope.of(Get.overlayContext!).unfocus();
  }

  Future<bool> willPopCallback() async => true;

  bool validate() {
    formKey.currentState?.save();
    return formKey.currentState?.validate() ?? false;
  }

  String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    final isEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if (!isEmail) {
      return 'Please enter a valid email';
    } else {
      return null;
    }
  }

  String? nameValidation(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }
    final isName = RegExp(r"^[a-zA-Z]+$").hasMatch(name);
    if (!isName) {
      return 'Please enter a valid name';
    } else {
      return null;
    }
  }

  String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    final isPassword = password.length >= 6;
    if (!isPassword) {
      return 'Password must be at least 6 characters';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password is required';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }

  String? phoneValidation(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Phone is required';
    }
    final isPhone = RegExp(r"^[0-9]+$").hasMatch(phone);
    if (!isPhone) {
      return 'Please enter a valid phone';
    } else {
      return null;
    }
  }

  String? birthDayValidation(String? birthDay) {
    if (birthDay == null || birthDay.isEmpty) {
      return 'Birthday is required';
    }
    var date = DateTime.tryParse(birthDay);
    final isBirthDay = date != null;
    if (!isBirthDay) {
      return 'Please enter a valid birthday';
    } else {
      return null;
    }
  }

  String? genderValidation(Genders? gender) {
    if (gender == null) {
      return 'Please select your gender';
    }
    return null;
  }
}

enum Genders { male, female, other }

extension GenderTexter on Genders {
  String get text {
    var names = {Genders.female: 'Female', Genders.male: 'Male', Genders.other: 'Other'};
    return names[this]!;
  }
}
