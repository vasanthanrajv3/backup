import 'package:flutter/cupertino.dart';

import 'colors_theme.dart';

TextStyle robotoRegular({
  Color color = ThemeColor.primaryBlack,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.normal,
  String fontFamily = 'Roboto Regular',
}) {
  return TextStyle(
    // color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle robotoMedium({
  Color color = ThemeColor.primaryBlack,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
  String fontFamily = 'Roboto Medium',
}) {
  return TextStyle(
    // color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle robotoBold({
  Color color = ThemeColor.primaryBlack,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
  String fontFamily = 'Roboto Bold',
}) {
  return TextStyle(
    // color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}
