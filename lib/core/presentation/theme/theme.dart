import 'package:flutter/material.dart';

const primaryColor = Color(0xFF005FF9);
const scaffoldBackgroundLight = Color(0xFFF5F5F5);
const primaryFontLight = Color(0xFF4C4E4F);
const fontFamily = 'Nunito Sans';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundLight,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: primaryFontLight,
        fontSize: 20,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: primaryFontLight,
        fontSize: 18,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: primaryFontLight,
        fontSize: 14,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
      ),
      //Caption в Figme
      bodySmall: TextStyle(
        color: Color(0xFF9C9DA0),
        fontSize: 12,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
      ),
      //btn 2
      labelMedium: TextStyle(
        color: primaryFontLight,
        fontSize: 14,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(); //TODO добавить темную тему
}
