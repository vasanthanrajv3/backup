import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/message_model.dart';
import '../../data/provider/post_api.dart';
import '../../routes/app_routes.dart';
import '../../utils/local_storage.dart';
import '../../widgets/dialog_box.dart';
import '../../widgets/reuse.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //API
  final PostAPI postAPI = Get.find<PostAPI>();

  //dependency injection
  final LocalStorage localStorage = Get.find<LocalStorage>();

  //Keys
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<AnimatedListState> animationKey =
      GlobalKey<AnimatedListState>();

  //controller
  final ScrollController scrollController = ScrollController();
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;

  TextEditingController messageController = TextEditingController();

  int displayedItems = 0;

  Timer? timer;

  bool isLoading = false;
  bool prodDevUrlSwitch = true;

  List<MessageModel> messageModelList = <MessageModel>[].obs;
  List suggestionList = [
    {
      "title": "Financial News",
      "description": "What are today's top financial headlines?"
    },
    {
      "title": "Educational",
      "description": "How do index funds differ from mutual funds?"
    },
    {
      "title": "Personal Finance",
      "description": "How can I improve my credit score?"
    },
    {
      "title": "Calculation Related",
      "description": "What is the 1-year ROI for Reliance stock?"
    },
    {"title": "", "description": ""},
  ];

  RxString message = ''.obs;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(
        const Duration(milliseconds: 500), (_) => showNextItem());
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
  }

  void toggleDrawer() {
    if (animationController.isDismissed) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  void showNextItem() {
    if (displayedItems < suggestionList.length) {
      displayedItems++;
      update();
    } else {
      timer?.cancel();
      update();
    }
  }

  void scrollToEnd() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 300,
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );
    update();
  }

  void suggestionText(index) {
    messageController =
        TextEditingController(text: suggestionList[index]['description']);
    update();
    getMessage();
    update();
  }

  void getMessage() async {
    if (messageController.text.isNotEmpty) {
      isLoading = true;
      update();
      var body = {
        "user_id": 1002,
        "message": messageController.text,
        "stream": true
      };
      update();
      messageModelList.add(MessageModel.fromJson({
        "model": "gpt-4-turbo",
        "kind": "user",
        "response": messageController.text,
        "created_at": "2024-06-05T05:21:16.002634Z",
        "done": false
      }));
      messageController.clear();
      if (messageModelList.length >= 2) {
        scrollToEnd();
      }
      update();
      var results = await postAPI.postQuestion(body);
      if (results != null && !results.isEmpty) {
        final jsonObjects = results.split('\n');
        isLoading = false;
        update();
        List<dynamic> dataList = await jsonObjects
            .map((jsonString) {
              try {
                return json.decode(jsonString);
              } catch (e) {
                return null;
              }
            })
            .where((item) => item != null)
            .toList();
        print(dataList);
        for (var data in dataList) {
          updateMessage(data['response']);
          await Future.delayed(const Duration(milliseconds: 100));
          scrollToEnd();
        }
        messageModelList.add(MessageModel.fromJson({
          "model": "gpt-4-turbo",
          "kind": "chat-completion",
          "response": message.value,
          "created_at": "2024-06-05T05:21:16.002634Z",
          "done": false
        }));
        message.value = '';
        update();
        scrollToEnd();
      } else {
        isLoading = false;
        update();
      }
      print("@@@@@@@@@@@@@@@@@@@@@@@");
      print(results);
      print("@@@@@@@@@@@@@@@@@@@@@@@");
    } else {
      toastMessage(message: "Please type something");
      update();
    }
  }

  void logout() {
    DialogBox.logoutDialogBox(onTap: () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.clear();

      //redirect to login page
      Get.offNamedUntil(AppRoutes.login, (_) => false);
    });
  }

  void onProdDevSwitchChange(bool value) {
    print(value);
    prodDevUrlSwitch = value;
    print(prodDevUrlSwitch);
    update();
    print(prodDevUrlSwitch);
  }

  void updateMessage(String response) async {
    message.value += response;
    update();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
