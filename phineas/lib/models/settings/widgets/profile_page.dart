import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../themes/app_text_theme.dart';
import '../../../themes/colors_theme.dart';
import '../../../utils/image_assets.dart';
import '../../../widgets/reuse.dart';
import '../setting_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder: (controller) => SafeArea(
                child: Scaffold(
              body: Container(
                width: Get.width,
                height: Get.height,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      width: Get.width,
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          SvgRes.back,
                          width: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          padding: const EdgeInsets.all(50),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(100)),
                          child: SvgPicture.asset(
                            SvgRes.user,
                            width: 50,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                              color: ThemeColor.primary,
                              border:
                                  Border.all(width: 3, color: ThemeColor.white),
                              borderRadius: BorderRadius.circular(100)),
                          child: SvgPicture.asset(
                            SvgRes.edit,
                            color: ThemeColor.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${controller.localStorage.firstName} ${controller.localStorage.lastName}',
                          style: robotoMedium(),
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          SvgRes.edit,
                          width: 15,
                          height: 15,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email',
                          style: robotoMedium(),
                        ),
                        Text(
                          '${controller.localStorage.email}',
                          style: robotoRegular(),
                        ),
                        SvgPicture.asset(
                          SvgRes.edit,
                          width: 15,
                          height: 15,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Password',
                          style: robotoMedium(),
                        ),
                        Text(
                          '********',
                          style: robotoRegular(),
                        ),
                        SvgPicture.asset(
                          SvgRes.edit,
                          width: 15,
                          height: 15,
                        )
                      ],
                    ),
                    const Spacer(),
                    commonButton(
                        width: Get.width,
                        onPress: () {},
                        color: ThemeColor.secondaryRed,
                        text: 'Delete Account'),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
            )));
  }
}
