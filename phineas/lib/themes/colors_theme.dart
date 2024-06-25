import 'package:flutter/material.dart';

class ThemeColor {
  static const Color white = Color(0xffffffff);
  static const Color primary = Color(0xFF536DFE);
  static const Color black = Color(0xFF000000);

  static const Color secondaryRed = Color(0xFFE2173A);
  static const Color secondaryDarkGrey = Color(0xFF606260);
  static const Color secondaryMediumGrey = Color(0xFF00004d);
  static const Color secondaryGrey = Color(0xFFF1F3F4);
  static const Color disableGrey = Color(0xFF9E9E9E);

  static const Color primaryBlack = Color(0xFF141915);
  static const Color primaryYellow = Color(0xFFF4C744);
  static const Color primaryGreen = Color(0xff5EBE4E);
  static const Color primaryGrey = Color(0xFF8D8D8D);
  static const Color primaryShadowGrey = Color(0xFFBABABA);
  static const Color primaryDarkGrey = Color(0xFF414141);

  static const Color backgroundGrey = Color(0xFFF5F5F5);
}

// class AppTheme {
//   static final ThemeData darkTheme = ThemeData(
//     useMaterial3: true,
//     brightness: Brightness.dark,
//     scaffoldBackgroundColor: ThemeColor.black,
//     primaryColor: ThemeColor.primary,
//     dividerColor: Colors.grey[400],
//     primaryTextTheme: const TextTheme().apply(displayColor: ThemeColor.white),
//     textTheme: const TextTheme(
//       labelSmall: TextStyle(color: Colors.white),
//       labelMedium: TextStyle(color: Colors.white),
//       labelLarge: TextStyle(color: Colors.white),
//       titleSmall: TextStyle(color: Colors.white),
//       titleMedium: TextStyle(color: Colors.white),
//       titleLarge: TextStyle(color: Colors.white),
//       displaySmall: TextStyle(color: Colors.white),
//       displayMedium: TextStyle(color: Colors.white),
//       displayLarge: TextStyle(color: Colors.white),
//       headlineSmall: TextStyle(color: Colors.white),
//       headlineMedium: TextStyle(color: Colors.white),
//       headlineLarge: TextStyle(color: Colors.white),
//       bodySmall: TextStyle(color: Colors.white),
//       bodyMedium: TextStyle(color: Colors.white),
//       bodyLarge: TextStyle(color: Colors.white),
//     ).apply(displayColor: ThemeColor.white),
//     switchTheme: SwitchThemeData(
//       thumbColor: WidgetStateProperty.all(ThemeColor.black),
//     ),
//     dropdownMenuTheme: DropdownMenuThemeData(
//         textStyle: const TextStyle(color: ThemeColor.white),
//         menuStyle: MenuStyle(
//             backgroundColor: WidgetStateProperty.all(ThemeColor.primaryGrey))),
//     iconTheme: const IconThemeData(
//       color: ThemeColor.white,
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ButtonStyle(
//             foregroundColor: WidgetStateProperty.all(ThemeColor.primary),
//             backgroundColor: WidgetStateProperty.all(ThemeColor.primary),
//             // disabledBackgroundColor: ThemeColor.disableGrey,
//             textStyle: WidgetStateProperty.all(
//                 const TextStyle(color: ThemeColor.white)))),
//     // elevatedButtonTheme:
//     //     ElevatedButtonThemeData(style: getElevatedButtonStyle(true)),
//     inputDecorationTheme: InputDecorationTheme(
//       border: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.grey, width: 1),
//           borderRadius: BorderRadius.circular(10)),
//       focusedBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey),
//       ),
//       labelStyle: const TextStyle(color: Colors.tealAccent),
//     ),
//     dialogTheme: DialogTheme(
//       backgroundColor: Colors.blueGrey,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//     ),
//     appBarTheme: AppBarTheme(
//       // backgroundColor: ThemeColor.primaryGrey,
//       color: ThemeColor.primaryBlack,
//       iconTheme: const IconThemeData(color: ThemeColor.white),
//       titleTextStyle: robotoMedium(
//         color: ThemeColor.white,
//       ),
//     ),
//   );

//   static final ThemeData lightTheme = ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.light,
//       scaffoldBackgroundColor: Colors.grey[100],
//       primaryColor: const Color(0xFF536DFE),
//       dividerColor: Colors.grey[400],
//       switchTheme: SwitchThemeData(
//         thumbColor: WidgetStateProperty.all(ThemeColor.white),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         border: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.grey, width: 1),
//             borderRadius: BorderRadius.circular(10)),
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey),
//         ),
//       ),
//       dropdownMenuTheme: DropdownMenuThemeData(
//           textStyle: const TextStyle(color: ThemeColor.black),
//           menuStyle: MenuStyle(
//               backgroundColor: WidgetStateProperty.all(ThemeColor.white))),
//       iconTheme: const IconThemeData(
//         color: ThemeColor.white,
//       ),
//       appBarTheme: const AppBarTheme(
//         backgroundColor: ThemeColor.backgroundGrey,
//         surfaceTintColor: ThemeColor.backgroundGrey,
//         iconTheme: IconThemeData(color: ThemeColor.black),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ButtonStyle(
//               foregroundColor: WidgetStateProperty.all(ThemeColor.primary),
//               backgroundColor: WidgetStateProperty.all(ThemeColor.primary),
//               // disabledBackgroundColor: ThemeColor.disableGrey,
//               textStyle: WidgetStateProperty.all(
//                   const TextStyle(color: ThemeColor.white)))),
//       buttonTheme: const ButtonThemeData(
//         buttonColor: Color(0xFF536DFE),
//         disabledColor: Colors.grey,
//       ));

//   static ButtonStyle getElevatedButtonStyle(bool isDarkTheme) =>
//       ElevatedButton.styleFrom(
//         foregroundColor: ThemeColor.primary,
//         backgroundColor: ThemeColor.primary,
//         disabledBackgroundColor: ThemeColor.disableGrey,
//         // textStyle: const TextStyle(color: ThemeColor.white),
//         // textStyle: robotoMedium(color: ThemeColor.white),
//       );
// }
