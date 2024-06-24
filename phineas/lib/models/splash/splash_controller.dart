import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';
import '../../utils/image_assets.dart';
import '../../utils/local_storage.dart';
import '../../widgets/network_error_item.dart';

class SplashController extends GetxController {
  final LocalStorage localStorage = Get.find<LocalStorage>();

  final imageList = [
    {
      'image': SvgRes.splash1,
      'title': 'Personal Financial Analyzer',
      'description':
          'Streamline your financial calculations and analysis effortlessly',
    },
    {
      'image': SvgRes.splash2,
      'title': 'Market Intelligence Companion',
      'description':
          'Stay ahead with real-time market analysis and trends',
    },
    {
      'image': SvgRes.splash3,
      'title': 'Financial Expert',
      'description':
          'Expand your financial literacy with clear explanations and examples',
    },
    {
      'image': SvgRes.splash4,
      'title': 'Money Management Ally',
      'description':
          'Your guide to personalized financial strategies and insights',
    },
  ];

  int activeIndex = 0;

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(
        const Duration(seconds: 4), () => checkInternetConnectivity());
  }

  void onPageChange(index, reason) {
    activeIndex = index;
    update();
  }

  void validateUser() async {
    validateJwtToken();
  }

  //Internet(Wifi or mobile) checking
  void checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      validateUser();
    } else {
      Get.dialog(const NetworkErrorItem(), useSafeArea: false);
    }
  }

  //validate JWT Token expiration
  void validateJwtToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = localStorage.token.toString();

    if (!localStorage.newUser.value) {
      if (token.isNotEmpty) {
        var tokenDecoded = JwtDecoder.decode(token);
        print("Enter ID");
        bool hasExpired = convertStringToTimestamp(tokenDecoded['expire']);
        if (hasExpired) {
          print("Token Not expired");
          Get.offNamed(AppRoutes.home);
        } else {
          print("Token expired");
          preferences.clear();
          Get.offNamed(AppRoutes.login);
        }
      } else {
        print("No Enter ID");
        // Get.offNamed(AppRoutes.home);
        Get.offNamed(AppRoutes.login);
      }
    }
  }

  bool convertStringToTimestamp(stringTime) {
    try {
      DateTime dateTimeObject = DateTime.parse(stringTime);

      DateTime currentTime = DateTime.now();

      if (dateTimeObject.isBefore(currentTime)) {
        return true;
      } else if (dateTimeObject.isAtSameMomentAs(currentTime)) {
        return true;
      } else {
        print("The string timestamp is in the future.");
        return false;
      }
    } on FormatException {
      print("Invalid string format. Please use YYYY-MM-DD HH:MM:SS");
      return false;
    }
  }
}
