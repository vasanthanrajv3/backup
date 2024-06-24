import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/app_text_theme.dart';
import '../themes/colors_theme.dart';

class SnackNotification {
  static error({message = ''}) {
    Get.snackbar(
      '',
      message,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      titleText: Container(
        width: Get.size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              style: BorderStyle.solid,
              color: ThemeColor.secondaryRed,
            ),
          ),
        ),
      ),
      messageText: SizedBox(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: ThemeColor.secondaryRed,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Error',
                    ),
                    Text(
                      message,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  static warning({message = ''}) {
    Get.snackbar(
      '',
      message,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      titleText: Container(
        width: Get.size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              style: BorderStyle.solid,
              color: ThemeColor.primaryYellow,
            ),
          ),
        ),
      ),
      messageText: SizedBox(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: ThemeColor.primaryYellow,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Warning',
                    ),
                    Text(
                      message,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  static success({message = ''}) {
    Get.snackbar(
      '',
      message,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      titleText: Container(
        width: Get.size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              style: BorderStyle.solid,
              color: ThemeColor.primaryGreen,
            ),
          ),
        ),
      ),
      messageText: SizedBox(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                CupertinoIcons.checkmark_circle_fill,
                color: ThemeColor.primaryGreen,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Success',
                      style: robotoRegular(color: ThemeColor.primaryGreen),
                    ),
                    Text(
                      message,
                      style: robotoRegular(color: ThemeColor.primaryDarkGrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  static message({message = ''}) {
    Get.snackbar(
      '',
      message,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      titleText: Container(
        width: Get.size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              style: BorderStyle.solid,
              color: ThemeColor.secondaryDarkGrey,
            ),
          ),
        ),
      ),
      messageText: SizedBox(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                message,
              ),
            ],
          ),
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }
}
