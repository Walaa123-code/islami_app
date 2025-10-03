import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  // data
  ThemeMode appTheme = ThemeMode.dark;

// function
  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  bool isLightMode() {
    return appTheme == ThemeMode.light;
  }
}
