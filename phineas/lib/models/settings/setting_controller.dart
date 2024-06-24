import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';
import '../../utils/local_storage.dart';
import '../../widgets/dialog_box.dart';

class SettingController extends GetxController {
  final LocalStorage localStorage = Get.find<LocalStorage>();

  bool notificationSwitch = true;
  bool hapticFeedbackSwitch = true;

  String selectedDropDownValue = '';

  var themeMode = ThemeMode.system.obs;

  final List<String> colorSchemeList = ['Light', 'Dark', 'System (Default)'];

  @override
  void onInit() {
    super.onInit();
    selectedDropDownValue = localStorage.colorScheme.value;
    update();
  }

  void onNotificationSwitchChange(bool value) {
    print(value);
    notificationSwitch = value;
    print(notificationSwitch);
    update();
  }

  void onHapticFeedbackSwitchChange(bool value) {
    print(value);
    hapticFeedbackSwitch = value;
    print(hapticFeedbackSwitch);
    update();
  }

  void selectedDropDownChange(String? value) async {
    selectedDropDownValue = value!;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('colorScheme', value);

    localStorage.setColorSchemeData(colorSchemeLocal: value);
    update();

    toggleTheme();
  }

  void toggleTheme() {
    if (localStorage.colorScheme.value == 'Dark') {
      changeThemeMode(ThemeMode.dark);
    } else if (localStorage.colorScheme.value == 'Light') {
      changeThemeMode(ThemeMode.light);
    } else {
      changeThemeMode(ThemeMode.system);
    }
  }

  void changeThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
  }

  void logout() {
    DialogBox.logoutDialogBox(onTap: () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.clear();

      //redirect to login page
      Get.offNamedUntil(AppRoutes.login, (_) => false);
    });
  }
}
