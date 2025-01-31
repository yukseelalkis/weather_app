import 'package:flutter/material.dart';
import 'package:package_weather/feature/view/home_screen.dart';
import 'package:package_weather/feature/view/weather_view.dart';
import 'package:package_weather/feature/view/splash_view.dart';

class NavigatorRoutes {
  Map<String, WidgetBuilder> get items => {
        '/': (context) => const SplashScreen(),
        '/HomeScreen': (context) => const HomeScreen(),
        '/weather': (context) => const WeatherView(),
      };
}
