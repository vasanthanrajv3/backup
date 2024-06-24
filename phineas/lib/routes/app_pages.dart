import 'package:get/get.dart';

import '../models/home/home_binding.dart';
import '../models/home/home_page.dart';
import '../models/login/login_binding.dart';
import '../models/login/login_page.dart';
import '../models/otp_verification/otp_verification_binding.dart';
import '../models/otp_verification/otp_verification_page.dart';
import '../models/settings/setting_binding.dart';
import '../models/settings/setting_page.dart';
import '../models/signup/signup_binding.dart';
import '../models/signup/signup_page.dart';
import '../models/splash/splash_binding.dart';
import '../models/splash/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.otpVerification,
      page: () => const OtpVerificationPage(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
  ];
}
