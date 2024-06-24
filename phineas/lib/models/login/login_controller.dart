import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/provider/authentication_api.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';
import '../../utils/local_storage.dart';
import '../../widgets/reuse.dart';

class LoginController extends GetxController {
  //API
  AuthenticationAPI authenticationAPI = Get.find<AuthenticationAPI>();

  //dependency injection
  LocalStorage localStorage = Get.find<LocalStorage>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isCheckBox = false;
  bool isPasswordVisible = true;
  bool isLoading = false;

  String errorEmail = '';
  String errorPassword = '';

  void switchPasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void checkBoxToggle() {
    isCheckBox = !isCheckBox;
    update();
  }

  void login() async {
    isLoading = true;
    update();
    if (!RegExp(emailRegEx).hasMatch(emailController.text)) {
      errorEmail = 'Please enter a valid email address';
      isLoading = false;
      update();
    } else if (passwordController.text == '') {
      errorEmail = '';
      errorPassword = 'Please enter the password';
      isLoading = false;
      update();
    } else {
      errorEmail = '';
      errorPassword = '';
      update();
      var result = await authenticationAPI.loginAPI(
          email: emailController.text, password: passwordController.text);

      if (result != null) {
        print(result);
        toastMessage(message: "Logged in successfully");
        storeLocally(result['token']);
      } else {
        isLoading = false;
        update();
      }
    }
  }

  void storeLocally(token) async {
    var tokenDecoded = JwtDecoder.decode(token);

    print(tokenDecoded);

    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('token', token);
    preferences.setBool('newUser', false);
    preferences.setString('firstName', tokenDecoded['first_name']);
    preferences.setString('lastName', tokenDecoded['last_name']);
    preferences.setString('email', tokenDecoded['email']);
    preferences.setString('image', '');
    preferences.setString('userId', tokenDecoded['id'].toString());

    await localStorage.setLocalData(tokenLocal: token);
    await localStorage.setNewUserData(newUserLocal: false);
    await localStorage.setUserDetails(
        firstNameLocal: tokenDecoded['first_name'],
        lastNameLocal: tokenDecoded['last_name'],
        emailLocal: tokenDecoded['email'],
        imageLocal: '',
        userIdLocal: tokenDecoded['id'].toString());

    isLoading = false;
    update();
    Get.offNamed(AppRoutes.home);
  }
}
