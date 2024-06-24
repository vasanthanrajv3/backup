import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/app_text_theme.dart';
import '../themes/colors_theme.dart';

class NetworkErrorItem extends StatelessWidget {
  const NetworkErrorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              'Internet connection lost!',
              style: robotoRegular(color: ThemeColor.primaryGrey),
            ),
            Text(
              'Check your connection and try again.',
              style: robotoRegular(color: ThemeColor.primaryGrey),
            )
          ],
        ),
      ),
    );
  }
}
