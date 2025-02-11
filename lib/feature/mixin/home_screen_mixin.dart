import 'package:flutter/material.dart';
import 'package:package_weather/feature/view/home/home_screen.dart';
import 'package:package_weather/product/utilitiy/constants/duration/project_duration.dart';

mixin HomeScreenMixin on State<HomeScreen> implements TickerProvider {
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


}
