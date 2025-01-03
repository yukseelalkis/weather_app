import 'package:flutter/material.dart';
import 'package:package_weather/feature/view/splash_view.dart';
import 'package:package_weather/feature/view/weather_view.dart';
import 'package:package_weather/product/utilitiy/constants/duration/project_duration.dart';

mixin SplashMixin on State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(DurationItems.durationStart(), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WeatherView()),
      );
    });
  }
}
