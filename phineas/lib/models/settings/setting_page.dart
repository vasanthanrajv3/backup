import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../themes/app_text_theme.dart';
import '../../themes/colors_theme.dart';
import '../../utils/image_assets.dart';
import '../../widgets/reuse.dart';
import 'setting_controller.dart';
import 'widgets/profile_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder: (controller) => SafeArea(
                child: Scaffold(
              appBar: AppBar(
                // backgroundColor: Colors.grey[100],
                // surfaceTintColor: Colors.grey[100],
                title: Text(
                  "Settings",
                  style: robotoMedium(fontSize: 20),
                ),
              ),
              // backgroundColor: Colors.grey[100],
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bannerText(text: 'Account'),
                      bannerSubText(
                          onTap: true,
                          onPress: () {
                            Get.dialog(const ProfilePage());
                          },
                          titleText: 'Email',
                          subTitleText: controller.localStorage.email.value),
                      Divider(
                        color: Colors.grey[400],
                      ),
                      bannerSubText(
                          titleText: 'Subscription', subTitleText: 'Free plan'),
                      Divider(
                        color: Colors.grey[400],
                      ),
                      bannerSubText(
                        titleText: 'Data Controls',
                      ),
                      Divider(
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 20),
                      bannerText(text: 'App Settings'),
                      bannerSubText(
                        titleText: 'Touch/Face ID',
                      ),
                      Divider(
                        color: Colors.grey[400],
                      ),
                      bannerSubText(
                        titleText: 'Color Scheme',
                        type: 'Dropdown',
                        dropdownItemList: controller.colorSchemeList,
                        dropdownValue: controller.selectedDropDownValue,
                        onDropdownChange: controller.selectedDropDownChange,
                      ),
                      Divider(
                        color: Colors.grey[400],
                      ),
                      bannerSubText(
                        titleText: 'Haptic Feedback',
                        type: 'Switch',
                        toggleSwitch: controller.hapticFeedbackSwitch,
                        onSwitchChange: controller.onHapticFeedbackSwitchChange,
                      ),
                      Divider(
                        color: Colors.grey[400],
                      ),
                      bannerSubText(
                        titleText: 'Push Notifications',
                        type: 'Switch',
                        toggleSwitch: controller.notificationSwitch,
                        onSwitchChange: controller.onNotificationSwitchChange,
                      ),
                      Divider(
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 20),
                      bannerText(text: 'About us'),
                      bannerSubText(
                        leadingSvgRes: SvgRes.help,
                        titleText: 'Help Center',
                      ),
                      Divider(
                        color: Colors.grey[400],
                      ),
                      bannerSubText(
                        leadingSvgRes: SvgRes.help,
                        titleText: 'Terms and Policies',
                      ),
                      Divider(
                        color: Colors.grey[400],
                      ),
                      bannerSubText(
                        leadingSvgRes: SvgRes.help,
                        titleText: 'Privacy Policy',
                      ),
                      Divider(
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: Get.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width / 5),
                        child: commonButton(
                            width: Get.width / 2.5,
                            onPress: () {
                              controller.logout();
                            },
                            text: 'Logout',
                            height: 35),
                      ),
                      const SizedBox(height: 10),
                      Container(
                          width: Get.width,
                          alignment: Alignment.center,
                          child: Text(
                            "Version 1.0.0",
                            style: robotoRegular(),
                          )),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            )));
  }
}

Widget bannerText({required String text}) {
  return Text(
    text,
    style: robotoMedium(color: ThemeColor.primaryGrey),
  );
}

Widget bannerSubText(
    {required String titleText,
    String subTitleText = '',
    String leadingSvgRes = '',
    String type = '',
    bool toggleSwitch = false,
    bool onTap = false,
    String dropdownValue = '',
    List<String> dropdownItemList = const [],
    void Function()? onPress,
    void Function(bool value)? onSwitchChange,
    void Function(String? value)? onDropdownChange}) {
  return ListTile(
    onTap: onTap ? onPress : null,
    leading: leadingSvgRes != ''
        ? SvgPicture.asset(
            leadingSvgRes,
            width: 20,
            height: 20,
          )
        : null,
    title: Text(
      titleText,
      style: robotoMedium(),
    ),
    subtitle: subTitleText != ''
        ? Text(
            subTitleText,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style:
                robotoMedium(fontSize: 15, color: ThemeColor.secondaryDarkGrey),
          )
        : null,
    trailing: type == 'Switch'
        ? Switch(
            value: toggleSwitch,
            onChanged: onSwitchChange,
            activeTrackColor: ThemeColor.primary,
          )
        : type == 'Dropdown'
            ? DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                // focusColor: ThemeColor.primary,
                borderRadius: BorderRadius.circular(10),
                // dropdownColor: ThemeColor.secondaryGrey,
                // style: const TextStyle(color: ThemeColor.black),
                underline: Container(
                  height: 0,
                ),
                onChanged: onDropdownChange,
                items: dropdownItemList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  );
                }).toList(),
              )
            : SvgPicture.asset(
                SvgRes.angleRight,
                width: 15,
                height: 15,
              ),
  );
}
