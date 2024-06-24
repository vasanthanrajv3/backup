import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../routes/app_routes.dart';
import '../../themes/app_text_theme.dart';
import '../../themes/colors_theme.dart';
import '../../utils/image_assets.dart';
import '../../widgets/reuse.dart';
import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) => SafeArea(
                child: Scaffold(
              backgroundColor: Colors.grey[100],
              body: controller.localStorage.newUser.value
                  ? Container(
                      height: Get.height,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Expanded(
                            child: CarouselSlider.builder(
                              options: CarouselOptions(
                                  height: Get.height / 1.5,
                                  viewportFraction: 1,
                                  enlargeFactor: 10,
                                  // enlargeCenterPage: true,
                                  // enlargeStrategy:
                                  //     CenterPageEnlargeStrategy.height,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 2),
                                  onPageChanged: controller.onPageChange),
                              itemCount: controller.imageList.length,
                              itemBuilder: (context, index, realIndex) {
                                return SizedBox(
                                  width: Get.width,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        height: Get.height / 3,
                                        child: SvgPicture.asset(
                                          controller.imageList[index]['image']!,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        controller.imageList[index]['title']!,
                                        style: robotoBold(fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        controller.imageList[index]
                                            ['description']!,
                                        style: robotoMedium(
                                            color: ThemeColor.primaryGrey),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AnimatedSmoothIndicator(
                            activeIndex: controller.activeIndex,
                            count: controller.imageList.length,
                            effect: const ExpandingDotsEffect(
                                dotHeight: 10,
                                dotWidth: 10.00,
                                dotColor: ThemeColor.primaryGrey,
                                activeDotColor: ThemeColor.primaryBlack),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          commonButton(
                              width: Get.width,
                              onPress: () {
                                Get.offNamed(AppRoutes.login);
                              },
                              text: "Get Started"),
                        ],
                      ),
                    )
                  : Center(
                      child: Image.asset(
                        ImgRes.appIcon,
                        width: 100,
                        height: 100,
                      ),
                    ),
            )));
  }
}
