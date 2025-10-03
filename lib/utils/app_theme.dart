import 'package:flutter/material.dart';
import 'package:islami_n/utils/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
    backgroundColor: AppColors.blackColor,
  ));
  static final ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: AppColors.blackColor));
}
