import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController {
  static void updateTheme({bool isLightTheme = false}) =>
      Get.changeThemeMode(isLightTheme ? ThemeMode.light : ThemeMode.dark);
}
