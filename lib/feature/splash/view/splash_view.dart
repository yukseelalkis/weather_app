import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:package_weather/feature/view/weather_view.dart';
import 'package:package_weather/product/utitility/constant/app_style.dart/app_style.dart';
import 'package:package_weather/product/utitility/constant/project_color/color_items.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with ProjectItemColors {
  static const String _lottie = 'assets/lottie/splash_lottie.json';

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WeatherView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppStyle.gradientBoxDecoration,
        child: Center(
          child: Lottie.asset(_lottie),
        ),
      ),
    );
  }
}
