import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_text_theme.dart';
import '../../themes/colors_theme.dart';
import '../../widgets/reuse.dart';
import 'signup_controller.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
        builder: (controller) => SafeArea(
                child: Scaffold(
              backgroundColor: Colors.grey[100],
              body: controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: Get.width,
                      height: Get.height,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 50),
                            Text(
                              "Sign Up for Free",
                              style: robotoBold(fontSize: 20),
                            ),
                            // Text(
                            //   "Please enter your details fro SignUp",
                            //   style: robotoRegular(
                            //     fontSize: 15,
                            //   ),
                            // ),
                            const SizedBox(height: 50),
                            commonTextBox(
                                textController: controller.emailController,
                                hintMessage: 'Your Email Address',
                                focusColor: Colors.grey,
                                borderColor: Colors.grey,
                                keyboardType: TextInputType.emailAddress),
                            if (controller.errorEmail.isNotEmpty)
                              errorMessage(controller.errorEmail),
                            const SizedBox(height: 20),
                            commonTextBox(
                              textController: controller.firstNameController,
                              hintMessage: 'Your First Name',
                              focusColor: Colors.grey,
                              borderColor: Colors.grey,
                            ),
                            if (controller.errorFirstName.isNotEmpty)
                              errorMessage(controller.errorFirstName),
                            const SizedBox(height: 20),
                            commonTextBox(
                              textController: controller.lastNameController,
                              hintMessage: 'Your Last Name',
                              focusColor: Colors.grey,
                              borderColor: Colors.grey,
                            ),
                            if (controller.errorFirstName.isNotEmpty)
                              errorMessage(controller.errorFirstName),
                            const SizedBox(height: 20),
                            commonTextBox(
                                textController: controller.passwordController,
                                hintMessage: 'Your Password',
                                isPassword: true,
                                passwordVisibility:
                                    controller.isPasswordVisible,
                                onPress: () {
                                  controller.switchPasswordVisibility();
                                }),
                            if (controller.errorPassword.isNotEmpty)
                              errorMessage(controller.errorPassword),
                            const SizedBox(height: 20),
                            commonTextBox(
                                textController:
                                    controller.confirmPasswordController,
                                hintMessage: 'Your Confirm Password',
                                isPassword: true,
                                passwordVisibility:
                                    controller.isConfirmPasswordVisible,
                                onPress: () {
                                  controller.switchConfirmPasswordVisibility();
                                }),
                            if (controller.errorConfirmPassword.isNotEmpty)
                              errorMessage(controller.errorConfirmPassword),
                            const SizedBox(height: 30),
                            commonButton(
                                width: Get.width,
                                onPress: () {
                                  controller.register();
                                },
                                text: 'Sign Up'),
                            const SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account?"),
                                const SizedBox(width: 5),
                                InkWell(
                                  onTap: () => {Get.back()},
                                  child: Text(
                                    "Sign In",
                                    style: robotoMedium(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: ThemeColor.primary),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
            )));
  }
}
