import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../themes/app_text_theme.dart';
import '../../themes/colors_theme.dart';
import '../../utils/image_assets.dart';
import '../../utils/shimmer_card.dart';
import '../../widgets/reuse.dart';
import 'home_controller.dart';
import 'widget/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => SafeArea(
                child: Scaffold(
              // backgroundColor: Colors.grey[100],
              key: controller.scaffoldKey,
              resizeToAvoidBottomInset: false,
              drawerEnableOpenDragGesture: false,
              endDrawerEnableOpenDragGesture: false,
              onDrawerChanged: (value) {
                if (!value) {
                  controller.scaffoldKey.currentState!.closeDrawer();
                  controller.toggleDrawer();
                }
              },
              drawer: const DrawerMenu(),
              body: Obx(() {
                return GestureDetector(
                  onTap: () {
                    if (controller.animationController.isCompleted) {
                      controller.toggleDrawer();
                    }
                  },
                  child: AnimatedBuilder(
                    animation: controller.animationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          controller.animationController.value * 300.0,
                          0.0,
                        ),
                        child: Transform.scale(
                          scale: controller.scaleAnimation.value,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              controller.animationController.value * 16.0,
                            ),
                            child: child,
                          ),
                        ),
                      );
                    },
                    child: Scaffold(
                      extendBodyBehindAppBar: true,
                      // backgroundColor: Colors.grey[100],
                      resizeToAvoidBottomInset: false,
                      appBar: AppBar(
                        // backgroundColor: Colors.grey[100],
                        surfaceTintColor: Colors.transparent,
                        leading: InkWell(
                          onTap: () {
                            controller.scaffoldKey.currentState!.openDrawer();
                            controller.toggleDrawer();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: SvgPicture.asset(
                              SvgRes.menu,
                              width: 20,
                              height: 20,
                              // color: ThemeColor.black,
                            ),
                          ),
                        ),
                        title: Text(
                          "Phineas",
                          style: robotoMedium(),
                        ),
                        actions: [
                          InkWell(
                            // onTap: () {},
                            child: Container(
                                padding: const EdgeInsets.all(15),
                                height: 50,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      SvgRes.add,
                                      width: 40,
                                      height: 40,
                                    ),
                                    Text(
                                      "New Chat",
                                      style: robotoMedium(),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                      body: SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Expanded(
                                child: controller.messageModelList.isEmpty
                                    ? Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        height: Get.height,
                                        width: Get.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            AnimatedTextKit(
                                              isRepeatingAnimation: false,
                                              animatedTexts: [
                                                TyperAnimatedText(
                                                    "Hello ${controller.localStorage.firstName} ${controller.localStorage.lastName}",
                                                    speed: const Duration(
                                                        milliseconds: 50),
                                                    textStyle: robotoBold(
                                                      fontSize: 25,
                                                    )),
                                              ],
                                            ),
                                            Text(
                                              "How Can I Help You Today?",
                                              style: robotoBold(
                                                fontSize: 25,
                                              ),
                                            ),
                                            Flexible(
                                              child: ListView.separated(
                                                shrinkWrap: true,
                                                itemCount: controller
                                                    .suggestionList.length,
                                                separatorBuilder: (context,
                                                        index) =>
                                                    const SizedBox(height: 10),
                                                itemBuilder: (context, index) {
                                                  if (index <
                                                      controller
                                                          .displayedItems) {
                                                    return AnimatedOpacity(
                                                      opacity: index !=
                                                              controller
                                                                      .displayedItems -
                                                                  1
                                                          ? 1.0
                                                          : index ==
                                                                  controller
                                                                      .displayedItems
                                                              ? 1.0
                                                              : 0.0,
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.easeIn,
                                                      child: InkWell(
                                                        onTap: () {
                                                          controller
                                                              .suggestionText(
                                                                  index);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          decoration:
                                                              BoxDecoration(
                                                                  // color: Colors.grey[300],
                                                                  border: Border.all(
                                                                      width: 1,
                                                                      color: ThemeColor
                                                                          .black),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                controller.suggestionList[
                                                                        index][
                                                                    'description'],
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: robotoMedium(
                                                                    color: ThemeColor
                                                                        .secondaryDarkGrey),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container();
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : ListView.separated(
                                        shrinkWrap: true,
                                        reverse: false,
                                        physics: const ClampingScrollPhysics(),
                                        controller: controller.scrollController,
                                        itemCount:
                                            controller.messageModelList.length,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(height: 10),
                                        itemBuilder:
                                            (context, index) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15.0),
                                                  child: Column(
                                                    children: [
                                                      if (controller
                                                              .messageModelList[
                                                                  index]
                                                              .kind !=
                                                          'chat-completion')
                                                        SizedBox(
                                                          width: Get.width,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                width: 35,
                                                                height: 35,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                            .grey[
                                                                        300],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(9),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  SvgRes.user,
                                                                  color: ThemeColor
                                                                      .primaryBlack,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 10),
                                                            ],
                                                          ),
                                                        ),
                                                      if (controller
                                                              .messageModelList[
                                                                  index]
                                                              .kind ==
                                                          'chat-completion')
                                                        SizedBox(
                                                          width: Get.width,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 35,
                                                                height: 35,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(9),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                            .grey[
                                                                        300],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                child: SvgPicture
                                                                    .asset(SvgRes
                                                                        .chatIcons),
                                                              ),
                                                              const SizedBox(
                                                                  height: 10),
                                                            ],
                                                          ),
                                                        ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        mainAxisAlignment: controller
                                                                    .messageModelList[
                                                                        index]
                                                                    .kind ==
                                                                'chat-completion'
                                                            ? MainAxisAlignment
                                                                .start
                                                            : MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            margin:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            constraints:
                                                                BoxConstraints(
                                                                    maxWidth:
                                                                        Get.width -
                                                                            50),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: controller.messageModelList[index].kind ==
                                                                            'chat-completion'
                                                                        ? Colors.grey[
                                                                            300]
                                                                        : ThemeColor
                                                                            .primary,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: controller.messageModelList[index].kind !=
                                                                              'chat-completion'
                                                                          ? const Radius
                                                                              .circular(
                                                                              10)
                                                                          : const Radius
                                                                              .circular(
                                                                              0),
                                                                      topRight: controller.messageModelList[index].kind !=
                                                                              'chat-completion'
                                                                          ? const Radius
                                                                              .circular(
                                                                              0)
                                                                          : const Radius
                                                                              .circular(
                                                                              10),
                                                                      bottomLeft:
                                                                          const Radius
                                                                              .circular(
                                                                              10),
                                                                      bottomRight:
                                                                          const Radius
                                                                              .circular(
                                                                              10),
                                                                    )),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  child: controller
                                                                              .messageModelList[index]
                                                                              .kind ==
                                                                          'chat-completion'
                                                                      ? Markdown(
                                                                          physics:
                                                                              const NeverScrollableScrollPhysics(),
                                                                          selectable:
                                                                              true,
                                                                          shrinkWrap:
                                                                              true,
                                                                          styleSheet:
                                                                              MarkdownStyleSheet(p: robotoMedium()),
                                                                          // data: controller.sample,
                                                                          data: controller
                                                                              .messageModelList[index]
                                                                              .response,
                                                                        )
                                                                      : SelectableText(
                                                                          controller
                                                                              .messageModelList[index]
                                                                              .response,
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: robotoMedium(
                                                                              fontSize: 15,
                                                                              color: controller.messageModelList[index].kind != 'chat-completion' ? ThemeColor.white : ThemeColor.black),
                                                                        ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      if (controller
                                                              .messageModelList
                                                              .length ==
                                                          index + 1)
                                                        const SizedBox(
                                                            height: 10),
                                                      if (controller
                                                                  .messageModelList
                                                                  .length ==
                                                              index + 1 &&
                                                          controller.isLoading)
                                                        const ShimmerCard(),
                                                      if (controller
                                                                  .messageModelList
                                                                  .length ==
                                                              index + 1 &&
                                                          controller.message
                                                                  .value !=
                                                              '')
                                                        Column(
                                                          children: [
                                                            SizedBox(
                                                              width: Get.width,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: 35,
                                                                    height: 35,
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            9),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.grey[
                                                                            300],
                                                                        borderRadius:
                                                                            BorderRadius.circular(20)),
                                                                    child: SvgPicture
                                                                        .asset(SvgRes
                                                                            .chatIcons),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          10),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          10),
                                                                  margin: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10),
                                                                  constraints: BoxConstraints(
                                                                      maxWidth:
                                                                          Get.width -
                                                                              50),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: Colors.grey[
                                                                              300],
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(0),
                                                                            topRight:
                                                                                Radius.circular(10),
                                                                            bottomLeft:
                                                                                Radius.circular(10),
                                                                            bottomRight:
                                                                                Radius.circular(10),
                                                                          )),
                                                                  child:
                                                                      Obx(() {
                                                                    return Markdown(
                                                                      physics:
                                                                          const NeverScrollableScrollPhysics(),
                                                                      selectable:
                                                                          true,
                                                                      shrinkWrap:
                                                                          true,
                                                                      styleSheet:
                                                                          MarkdownStyleSheet(
                                                                              p: robotoMedium()),
                                                                      // data: controller.sample,
                                                                      data: controller
                                                                          .message
                                                                          .value,
                                                                    );
                                                                  }),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ))),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              padding: const EdgeInsets.only(bottom: 20),
                              child: ListTile(
                                // leading: const Icon(
                                //   Icons.add,
                                //   size: 30,
                                // ),
                                title: commonTextBox(
                                    textController:
                                        controller.messageController,
                                    borderRadius: 40,
                                    hintMessage: 'Message'),
                                trailing: Container(
                                  decoration: BoxDecoration(
                                      color: ThemeColor.primary,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.send,
                                      color: ThemeColor.white,
                                    ),
                                    onPressed: () {
                                      controller.getMessage();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            )));
  }
}
