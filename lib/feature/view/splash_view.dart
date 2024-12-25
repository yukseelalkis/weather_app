import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:package_weather/feature/mixin/splash_view_mixin.dart';
import 'package:package_weather/product/utilitiy/app_style.dart/app_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashMixin {
  static const String _lottie = 'assets/lottie/splash_lottie.json';

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
