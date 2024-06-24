import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../themes/app_text_theme.dart';
import '../../../themes/colors_theme.dart';
import '../../../utils/image_assets.dart';
import '../home_controller.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(right: 110),
              width: Get.width,
              child: Drawer(
                backgroundColor: Colors.grey[100],
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      width: Get.width,
                      child: InkWell(
                        onTap: () {
                          controller.scaffoldKey.currentState!.closeDrawer();
                          controller.toggleDrawer();
                        },
                        child: const Icon(Icons.close),
                      ),
                    ),
                    ListTile(
                      leading: Container(
                          padding: const EdgeInsets.all(10),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(25)),
                          child: SvgPicture.asset(SvgRes.user)),
                      title: Text(
                        '${controller.localStorage.firstName} ${controller.localStorage.lastName}',
                        style: robotoMedium(),
                      ),
                      subtitle: Text(
                        controller.localStorage.email.value,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: robotoRegular(),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: SvgPicture.asset(
                        SvgRes.setting,
                        width: 20,
                        height: 20,
                      ),
                      title: const Text('Settings'),
                      onTap: () {
                        controller.scaffoldKey.currentState!.closeDrawer();
                        controller.toggleDrawer();
                        Get.toNamed(AppRoutes.settings);
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        SvgRes.help,
                        width: 20,
                        height: 20,
                      ),
                      title: const Text('Help Center'),
                      onTap: () {
                        controller.scaffoldKey.currentState!.closeDrawer();
                        controller.toggleDrawer();
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        SvgRes.mail,
                        width: 20,
                        height: 20,
                      ),
                      title: const Text('Send us feedback'),
                      onTap: () {
                        controller.scaffoldKey.currentState!.closeDrawer();
                        controller.toggleDrawer();
                      },
                    ),
                    ListTile(
                      title: const Text('Production URL'),
                      trailing: Switch(
                        value: controller.prodDevUrlSwitch,
                        onChanged: controller.onProdDevSwitchChange,
                        activeTrackColor: ThemeColor.primary,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ));
  }
}
