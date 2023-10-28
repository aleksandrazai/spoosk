import 'package:flutter/material.dart';
import 'package:spoosk/core/colors.dart';

const fontFamily = 'Nunito Sans';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.primaryFontLight,
        fontSize: 20,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: AppColors.primaryFontLight,
        fontSize: 18,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: AppColors.primaryFontLight,
        fontSize: 14,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
      ),
      //Caption в Figme
      bodySmall: const TextStyle(
        color: Color(0xFF9C9DA0),
        fontSize: 10,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
      ),
      //btn 2
      labelMedium: TextStyle(
        color: AppColors.primaryFontLight,
        fontSize: 14,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(); //TODO добавить темную тему
}
