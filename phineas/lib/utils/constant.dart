//Production URL
import 'package:get/get.dart';

import '../models/home/home_controller.dart';

HomeController homeController = Get.put(HomeController());

const prodBaseUrl = 'https://chat.v3analytics.in/api/v1/chat/';

//Development URL
const devBaseUrl = 'https://chat.v3analytics.in/api/v1/chat/mock/';

// String baseUrl() {
//   print(homeController.prodDevUrlSwitch);
//   return homeController.prodDevUrlSwitch ? prodBaseUrl : devBaseUrl;
// }

String baseUrl() {
  print(homeController.prodDevUrlSwitch);
  return 'https://chat.v3analytics.in/api/v1/chat/mock/';
}

//End Points
const postMessage = 'message';
const login = 'user/login';
const register = 'user/register';
const otpVerify = 'user/verify/otp';

//Regexp
const String emailRegEx = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
const String passwordRegEx =
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+-=]).{8,}$';
const String onlyAlphabeticRegEx = r'^[a-zA-Z ]+$';
const String firstLetterCapRegEx = r'/\b\w/g';
