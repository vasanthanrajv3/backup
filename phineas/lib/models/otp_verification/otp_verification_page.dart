import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_text_theme.dart';
import '../../themes/colors_theme.dart';
import '../../widgets/reuse.dart';
import 'otp_verification_controller.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpVerificationController>(
        builder: (controller) => SafeArea(
                child: Scaffold(
              backgroundColor: Colors.grey[100],
              body: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: Get.width,
                  height: Get.height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.forget
                              ? 'Email Verification'
                              : "Enter OTP Verification code",
                          style: robotoBold(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        if (controller.forget)
                          Text(
                            "Please enter your email address",
                            style: robotoMedium(
                                fontSize: 15,
                                color: ThemeColor.secondaryDarkGrey),
                          ),
                        if (!controller.forget)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Verification code has been send to this email',
                                style: robotoMedium(
                                    fontSize: 15,
                                    color: ThemeColor.secondaryDarkGrey),
                              ),
                              Text(
                                controller.email,
                                style: robotoMedium(
                                    fontSize: 18, color: ThemeColor.black),
                              ),
                            ],
                          ),
                        const SizedBox(height: 20),
                        if (!controller.forget)
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                    4,
                                    (index) => Container(
                                          width: 60.0,
                                          height: 60.0,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: TextFormField(
                                            controller: controller
                                                .pinControllers[index],
                                            maxLength: 1,
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter a digit';
                                              }
                                              return null;
                                            },
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              counterText: '',
                                              // Remove default counter text
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              // Handle focusing to the next field on input
                                              if (value.isEmpty && index > 0) {
                                                FocusScope.of(context)
                                                    .previousFocus();
                                              } else if (value.length == 1 &&
                                                  index < 3) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                                controller.onChangeOtpTextBoxes(
                                                    index);
                                              }
                                            },
                                          ),
                                        )),
                              ),
                              if (controller.otpError.isNotEmpty)
                                errorMessage(controller.otpError),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Didn't receive the code?",
                                      style: robotoRegular()),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: controller.isResendButtonEnabled
                                        ? () {}
                                        : null,
                                    child: Text(
                                      controller.isResendButtonEnabled
                                          ? 'Resend OTP'
                                          : '00:${controller.otpResendTime}',
                                      style: robotoMedium(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              commonButton(
                                  width: Get.width - 40,
                                  onPress: () {
                                    controller.verifyOtp();
                                  },
                                  text: "Verify Email"),
                              const SizedBox(height: 30),
                              InkWell(
                                onTap: () {
                                  if (controller.isEmailVerification) {
                                    controller.switchEmailAndOTP();
                                  } else {
                                    Get.back();
                                  }
                                },
                                child: const Text("Change email address",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: ThemeColor.primaryBlack,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto Medium',
                                    )),
                              ),
                            ],
                          ),
                        if (controller.forget)
                          Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    hintText: 'Enter your email',
                                    hintStyle:
                                        robotoRegular(color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ThemeColor.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(100))),
                              ),
                              const SizedBox(height: 30),
                              commonButton(
                                  width: Get.width - 40,
                                  onPress: () {
                                    controller.switchEmailAndOTP();
                                  },
                                  text: 'Send OTP'),
                              const SizedBox(height: 30),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Text("Go back",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: ThemeColor.primaryBlack,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto Medium',
                                    )),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
