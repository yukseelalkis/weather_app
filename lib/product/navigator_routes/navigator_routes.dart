import 'package:flutter/material.dart';
import 'package:package_weather/feature/view/weather_view.dart';
import 'package:package_weather/feature/splash/view/splash_view.dart';

class NavigatorRoutes {
  Map<String, WidgetBuilder> get items => {
        '/': (context) => const SplashScreen(),
        '/weather': (context) => const WeatherView(),
      };
}
