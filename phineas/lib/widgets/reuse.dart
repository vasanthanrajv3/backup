import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../themes/app_text_theme.dart';
import '../themes/colors_theme.dart';

void toastMessage({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

Widget errorMessage(message) {
  return Container(
    padding: const EdgeInsets.only(left: 16),
    // height: 20,
    width: Get.width,
    child: Text(
      message,
      style: robotoRegular(color: ThemeColor.secondaryRed),
    ),
  );
}

Widget commonButton(
    {required double width,
    double height = 50,
    required void Function() onPress,
    Color color = ThemeColor.primary,
    double borderRadius = 15,
    required String text,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w500,
    Color textColor = ThemeColor.white}) {
  return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        // backgroundColor: WidgetStateProperty.all<Color>(color),
        minimumSize: WidgetStateProperty.all(Size(width, height)),
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: robotoMedium(
            fontSize: fontSize, fontWeight: fontWeight),
      ));
}

Widget commonTextBox({
  required final textController,
  Color borderColor = Colors.grey,
  double borderRadius = 10,
  double borderWidth = 1,
  Color focusColor = Colors.grey,
  required String hintMessage,
  Color hintTextColor = Colors.grey,
  bool isPassword = false,
  bool passwordVisibility = false,
  void Function()? onPress,
  final keyboardType = TextInputType.text
}) {
  return TextField(
    controller: textController,
    style: robotoRegular(),
    obscureText: passwordVisibility,
    // cursorColor: ThemeColor.primary,
    decoration: InputDecoration(
        // focusColor: focusColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: borderWidth),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(passwordVisibility
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded),
                onPressed: onPress,
              )
            : null,
        hintText: hintMessage,
        hintStyle: robotoRegular(
          // color: hintTextColor,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide (width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius))
    ),
  );
}
