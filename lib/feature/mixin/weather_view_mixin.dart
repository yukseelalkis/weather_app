import 'package:flutter/material.dart';
import 'package:package_weather/feature/view/weather_view.dart';
import 'package:package_weather/product/init/language/project_items_string.dart';
import 'package:package_weather/product/utilitiy/constants/duration/project_duration.dart';

mixin WeatherViewMixin on State<WeatherView> implements TickerProvider {
  late AnimationController controller;
  bool isLigth = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: DurationItems.durationNormal(),
    );
  }

  String selectedCity = ProjectStringItems.baseCity;
  void updateSelectedCity(String city) {
    setState(() {
      selectedCity = city;
    });
  }
}
