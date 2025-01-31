import 'package:flutter/material.dart';
import 'package:package_weather/product/init/theme/dark_theme/dark_theme.dart';
import 'package:package_weather/product/init/theme/ligth_theme/ligth_theme.dart';

class ThemeNotifer extends ChangeNotifier {
  bool isLighTheme = false;

  void changeTheme() {
    isLighTheme = !isLighTheme;
    // butun ekrana haber vermek icin yapilir
    notifyListeners();
  }

  ThemeData get currentTheme => !isLighTheme
      ? CustomTheme().customLigthTheme
      : CustomTheme().customDarkTheme;
}
