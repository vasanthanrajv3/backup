import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/provider/authentication_api.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';
import '../../widgets/reuse.dart';

class SignupController extends GetxController {
  //API
  final AuthenticationAPI authenticationAPI = Get.find<AuthenticationAPI>();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  bool isLoading = false;

  String errorEmail = '';
  String errorPassword = '';
  String errorConfirmPassword = '';
  String errorFirstName = '';
  String errorLastName = '';

  void switchPasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void switchConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    update();
  }

  void register() async {
    isLoading = true;
    update();
    if (!RegExp(emailRegEx).hasMatch(emailController.text)) {
      errorEmail = 'Please enter a valid email address';
      isLoading = false;
      update();
    } else if (!RegExp(passwordRegEx).hasMatch(passwordController.text)) {
      errorEmail = '';
      errorPassword =
          'Minimum 8 characters long\nContains at least one lowercase letter (a-z)\nContains at least one uppercase letter (A-Z)\nContains at least one digit (0-9)\nContains at least one special character (!@#%^&*()_+-=)\nDoes not contain any whitespace characters (spaces, tabs)';
      isLoading = false;
      update();
    } else if (!RegExp(onlyAlphabeticRegEx)
        .hasMatch(firstNameController.text)) {
      errorEmail = '';
      errorPassword = '';
      errorFirstName = 'Enter only Alphabet';
      isLoading = false;
      update();
    } else if (!RegExp(onlyAlphabeticRegEx).hasMatch(lastNameController.text)) {
      errorEmail = '';
      errorPassword = '';
      errorFirstName = 'Enter only Alphabet';
      errorLastName = 'Enter only Alphabet';
      isLoading = false;
      update();
    } else if (passwordController.text != confirmPasswordController.text) {
      errorEmail = '';
      errorPassword = '';
      errorFirstName = '';
      errorLastName = '';
      errorConfirmPassword = 'Password Mismatch';
      isLoading = false;
      update();
    } else {
      errorPassword = '';
      errorEmail = '';
      errorFirstName = '';
      errorLastName = '';
      errorConfirmPassword = '';
      update();

      var results = await authenticationAPI.registerAPI(
          email: emailController.text,
          password: passwordController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text);

      if (results != null) {
        toastMessage(message: "Success: ${results['message']}");
        isLoading = false;
        update();
        Get.toNamed(AppRoutes.otpVerification, arguments: {
          'forget': false,
          'emailForVerification': emailController.text
        });
      } else {
        isLoading = false;
        update();
      }
      // Get.offNamed(AppRoutes.home);
    }
  }
}
