import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../themes/colors_theme.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFd1d1cf),
      highlightColor: const Color(0xFFe0e0e0),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                  color: ThemeColor.primaryGrey, shape: BoxShape.circle),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width / 1.5,
                  height: 12,
                  decoration: BoxDecoration(
                      color: ThemeColor.primaryGrey,
                      borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(height: 5),
                Container(
                  width: Get.width / 2,
                  height: 12,
                  decoration: BoxDecoration(
                      color: ThemeColor.primaryGrey,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}