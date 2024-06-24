import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../themes/app_text_theme.dart';
import '../../themes/colors_theme.dart';
import '../../widgets/reuse.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
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
                              "Sign in to Your Account",
                              style: robotoBold(fontSize: 20),
                            ),
                            const SizedBox(height: 50),
                            commonTextBox(
                              textController: controller.emailController,
                              hintMessage: 'Username/Email',
                              focusColor: Colors.grey,
                              borderColor: Colors.grey,
                            ),
                            if (controller.errorEmail.isNotEmpty)
                              errorMessage(controller.errorEmail),
                            const SizedBox(height: 20),
                            commonTextBox(
                                textController: controller.passwordController,
                                hintMessage: 'Password',
                                isPassword: true,
                                passwordVisibility:
                                    controller.isPasswordVisible,
                                focusColor: Colors.grey,
                                borderColor: Colors.grey,
                                onPress: () {
                                  controller.switchPasswordVisibility();
                                }),
                            if (controller.errorPassword.isNotEmpty)
                              errorMessage(controller.errorPassword),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.otpVerification,
                                    arguments: {'forget': false});
                              },
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Forget password?",
                                    style: robotoRegular(),
                                  )),
                            ),
                            const SizedBox(height: 25),
                            commonButton(
                                width: Get.width,
                                onPress: () {
                                  controller.login();
                                },
                                text: 'Sign In'),
                            const SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("New User?"),
                                const SizedBox(width: 5),
                                InkWell(
                                  onTap: () => {Get.toNamed(AppRoutes.signup)},
                                  child: Text(
                                    "Sign Up",
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
