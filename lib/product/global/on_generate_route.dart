import 'package:flutter/material.dart';
import 'package:package_weather/feature/view/home/home_screen.dart';
import 'package:package_weather/feature/view/splash_view.dart';
import 'package:package_weather/feature/view/weather_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case '/home': // HomeScreen yönlendirmesi
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case '/weather':
      return MaterialPageRoute(builder: (context) => const WeatherView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('Sayfa bulunamadi: ${settings.name}'),
          ),
        ),
      );
  }
}
