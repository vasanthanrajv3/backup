import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/provider/authentication_api.dart';
import '../../routes/app_routes.dart';
import '../../widgets/reuse.dart';

class OtpVerificationController extends GetxController {

  bool forget = Get.arguments['forget'] ?? false;
  String emailForVerification = Get.arguments['emailForVerification'] ?? '';

  //APIs
  final AuthenticationAPI authenticationAPI = Get.find<AuthenticationAPI>();

  //Keys
  final formKey = GlobalKey<FormState>();

  final pinControllers = List.generate(4, (_) => TextEditingController());

  String email = "";
  String otp = '';
  String otpError = '';

  int otpResendTime = 30;

  bool isResendButtonEnabled = false;
  bool isEmailVerification = false;

  @override
  void onInit() {
    startTimer();
    email = emailForVerification;
    super.onInit();
  }

  String maskEmail(String email) {
    final parts = email.split('@');
    final usernameLength = parts[0].length;
    final domain = parts[1];

    final maskLength = usernameLength > 3 ? usernameLength - 2 : 1;
    final mask = '*' * maskLength;

    return '${parts[0].substring(0, 1)}$mask${parts[0].substring(usernameLength - 1)}@$domain';
  }

  void onChangeOtpTextBoxes(index) {
    if (pinControllers[index + 1].text.isNotEmpty) {
      pinControllers[index + 1].clear();
      update();
    }
  }

  void switchEmailAndOTP() {
    isEmailVerification = true;
    forget = !forget;
    update();
  }

  void verifyOtp() async {
    otp = pinControllers.map((c) => c.text).join();
    if(otp.length == 4) {
      otpError = '';
      update();

      var results = await authenticationAPI.otpVerificationAPI(email: email, otp: otp);

      if(results != null) {
        print("Login Success");
        print(results);
        toastMessage(message: "Success: ${results['message']}");
        Get.offNamed(AppRoutes.login);
      }
    } else {
      otpError = 'Please enter a valid OTP';
      update();
    }
  }

  void startTimer() {
    isResendButtonEnabled = false;
    otpResendTime = 30;
    update();
    const onSec = Duration(seconds: 1);
    Timer.periodic(onSec, (timer) {
      if (otpResendTime == 0) {
        timer.cancel();
        isResendButtonEnabled = true;
        update();
      } else {
        otpResendTime--;
        update();
      }
    });
  }
}
