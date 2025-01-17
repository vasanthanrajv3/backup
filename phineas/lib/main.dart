import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'models/splash/splash_binding.dart';
import 'models/splash/splash_page.dart';
import 'routes/app_pages.dart';
import 'themes/colors_theme.dart';
import 'utils/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //dependencies injections
  DependencyInjection.init();

  //screen rotation disabled
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatbot',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      // theme: ThemeColor().themeData,
      home: const SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
