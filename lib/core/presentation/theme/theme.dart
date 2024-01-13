import 'package:flutter/material.dart';
import '../../colors.dart';

const fontFamily = 'Nunito Sans';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
    textTheme: TextTheme(
      //H3
      headlineLarge: TextStyle(
        color: AppColors.primaryFontLight,
        fontSize: 20,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
      ),
      //H4
      headlineMedium: TextStyle(
        color: AppColors.primaryFontLight,
        fontSize: 18,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
      ),
      //Body1
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryFontLight,
      ),
      //Body2
      bodyMedium: TextStyle(
        color: AppColors.primaryFontLight,
        fontSize: 14,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
      ),
      //Caption
      bodySmall: const TextStyle(
        color: Color(0xFF9C9DA0),
        fontSize: 12,
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
    iconTheme: IconThemeData(
      color: AppColors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(); //TODO добавить темную тему
}
