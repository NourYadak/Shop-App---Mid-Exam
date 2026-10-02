import 'package:shop_app/core/utils/font/app_font.dart';
import 'package:shop_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeLight = ThemeData(
    fontFamily: AppFont.quiksand,
    brightness: Brightness.light,
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 20,
        color: Colors.amber,
        fontWeight: FontWeight.w900,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.primary,
      onSecondary: AppColors.onPrimary,
      error: AppColors.error,
      onError: AppColors.primary,
      surface: AppColors.primary,
      onSurface: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.primary),
  );

  static ThemeData themeDark = ThemeData(brightness: Brightness.dark);
}
