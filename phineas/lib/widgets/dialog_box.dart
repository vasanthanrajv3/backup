import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/app_text_theme.dart';
import '../themes/colors_theme.dart';

class DialogBox {
  static logoutDialogBox({required VoidCallback onTap}) {
    showDialog(
      context: Get.overlayContext!,
      builder: (context) => AlertDialog(
        title: Text(
          'Logout',
          style: robotoMedium(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        content: Text(
          'Are you sure want to logout?',
          style: robotoMedium(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: robotoMedium(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ThemeColor.primary,
              ),
            ),
            onPressed: () => Get.back(),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              'Logout',
              style: robotoMedium(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ThemeColor.primary,
              ),
            ),
          )
        ],
      ),
    );
  }

  static deleteCommentDialogBox({
    required VoidCallback onTap,
  }) {
    showDialog(
      context: Get.overlayContext!,
      builder: (context) => AlertDialog(
        title: const Text(
          'Delete Comment',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        content: const Text(
          'Are you sure want to delete this comment?',
        ),
        actions: [
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ThemeColor.primary,
              ),
            ),
            onPressed: () => Get.back(),
          ),
          TextButton(
            onPressed: onTap,
            child: const Text(
              'Delete',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ThemeColor.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
