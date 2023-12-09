import 'package:flutter/material.dart';
import 'package:flutter_project_1st/theme/dark_theme.dart';
import 'package:flutter_project_1st/theme/light-theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData getTheme() => _themeData;

  void setTheme(bool isDarkMode) {
    _themeData = isDarkMode ? darkTheme : lightTheme;
    notifyListeners();
  }
}
