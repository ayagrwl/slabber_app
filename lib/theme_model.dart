import 'package:flutter/material.dart';
import 'package:trial_app/theme.dart';

class ThemeModel extends ChangeNotifier {

  ThemeData currentTheme = lightTheme;

  toggleTheme(int themeNum) {
    if (themeNum == 0) {
      currentTheme = darkTheme;
      return notifyListeners();
    } else if (themeNum == 1) {
      currentTheme = lightTheme;
      return notifyListeners();
    } else if (themeNum == 2) {
      currentTheme = warmTheme;
      return notifyListeners();
    } else {
      currentTheme = lightTheme;
      return notifyListeners();
    }
  }
}