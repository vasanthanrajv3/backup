import 'package:chat_bot/themes/colors_theme.dart';
import 'package:flutter/material.dart';

class AppThemes {
  /// Dark theme for APP
  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      primaryColor: ThemeColor.primary,
      textTheme: const TextTheme(
        labelSmall: TextStyle(color: ThemeColor.white),
        labelMedium: TextStyle(color: ThemeColor.white),
        labelLarge: TextStyle(color: ThemeColor.white),
        titleSmall: TextStyle(color: ThemeColor.white),
        titleMedium: TextStyle(color: ThemeColor.white),
        titleLarge: TextStyle(color: ThemeColor.white),
        displaySmall: TextStyle(color: ThemeColor.white),
        displayMedium: TextStyle(color: ThemeColor.white),
        displayLarge: TextStyle(color: ThemeColor.white),
        headlineSmall: TextStyle(color: ThemeColor.white),
        headlineMedium: TextStyle(color: ThemeColor.white),
        headlineLarge: TextStyle(color: ThemeColor.white),
        bodySmall: TextStyle(color: ThemeColor.white),
        bodyMedium: TextStyle(color: ThemeColor.white),
        bodyLarge: TextStyle(color: ThemeColor.white),
      ).apply(displayColor: ThemeColor.white),
      brightness: Brightness.light,
      scaffoldBackgroundColor: ThemeColor.black,
      iconTheme: const IconThemeData(
        color: ThemeColor.black,
      ),
      appBarTheme: appBarTheme(false),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(ThemeColor.primary),
      ),
      inputDecorationTheme: appInputDecorationTheme(false),
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: getElevatedButtonStyle(false)),
      outlinedButtonTheme:
          OutlinedButtonThemeData(style: getOutlineButtonStyle(false)),
      buttonTheme: const ButtonThemeData(buttonColor: ThemeColor.black),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: WidgetStateProperty.all(
                  const TextStyle(color: ThemeColor.white)))));

  /// Light theme for APP
  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      primaryColor: ThemeColor.primary,
      primaryTextTheme: const TextTheme().apply(displayColor: ThemeColor.black),
      textTheme: const TextTheme(
        labelSmall: TextStyle(color: Colors.black),
        labelMedium: TextStyle(color: Colors.black),
        labelLarge: TextStyle(color: Colors.black),
        titleSmall: TextStyle(color: Colors.black),
        titleMedium: TextStyle(color: Colors.black),
        titleLarge: TextStyle(color: Colors.black),
        displaySmall: TextStyle(color: Colors.black),
        displayMedium: TextStyle(color: Colors.black),
        displayLarge: TextStyle(color: Colors.black),
        headlineSmall: TextStyle(color: Colors.black),
        headlineMedium: TextStyle(color: Colors.black),
        headlineLarge: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.black),
      ).apply(displayColor: ThemeColor.black),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ThemeColor.white,
      iconTheme: const IconThemeData(
        color: ThemeColor.white,
      ),
      appBarTheme: appBarTheme(true),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(ThemeColor.primary),
      ),
      inputDecorationTheme: appInputDecorationTheme(true),
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: getElevatedButtonStyle(true)),
      outlinedButtonTheme:
          OutlinedButtonThemeData(style: getOutlineButtonStyle(true)),
      buttonTheme: const ButtonThemeData(buttonColor: ThemeColor.white),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: WidgetStateProperty.all(
                  const TextStyle(color: ThemeColor.black)))));

  static AppBarTheme appBarTheme(bool isDarkTheme) => AppBarTheme(
      backgroundColor: isDarkTheme ? ThemeColor.black : ThemeColor.white,
      iconTheme: IconThemeData(
          color: isDarkTheme ? ThemeColor.white : ThemeColor.black));

  static ButtonStyle getElevatedButtonStyle(bool isDarkTheme) =>
      ElevatedButton.styleFrom(
        foregroundColor: isDarkTheme ? ThemeColor.white : ThemeColor.black,
        backgroundColor: isDarkTheme ? ThemeColor.black : ThemeColor.white,
        disabledBackgroundColor: ThemeColor.disableGrey,
        fixedSize: const Size(395, 55),
        minimumSize: const Size(88, 36),
        elevation: 3,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      );

  static ButtonStyle getOutlineButtonStyle(bool isDarkTheme) =>
      OutlinedButton.styleFrom(
        foregroundColor: isDarkTheme ? ThemeColor.white : ThemeColor.black,
        backgroundColor: isDarkTheme ? ThemeColor.white : ThemeColor.black,
        disabledBackgroundColor: ThemeColor.disableGrey,
        fixedSize: const Size(395, 55),
        minimumSize: const Size(88, 36),
        elevation: 3,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      );

  static InputDecorationTheme appInputDecorationTheme(bool isDarkTheme) =>
      InputDecorationTheme(
          hintStyle: TextStyle(
            color: isDarkTheme ? ThemeColor.black : ThemeColor.white,
          ),
          errorStyle: const TextStyle(
              color: ThemeColor.secondaryRed,
              fontSize: 13,
              fontWeight: FontWeight.bold),
          prefixIconColor: isDarkTheme ? ThemeColor.black : ThemeColor.white,
          suffixIconColor: isDarkTheme ? ThemeColor.black : ThemeColor.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDarkTheme ? ThemeColor.black : ThemeColor.white,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: isDarkTheme ? ThemeColor.black : ThemeColor.white),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColor.secondaryRed,
              width: 2,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColor.secondaryRed,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            width: 3,
            color: !isDarkTheme ? ThemeColor.white : ThemeColor.black,
          )));
}
