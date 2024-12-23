import 'package:flutter/material.dart';
import 'package:package_weather/product/global/on_generate_route.dart';
import 'package:package_weather/product/init/theme/ligth_theme.dart';
import 'package:package_weather/product/navigate/navigate_manager.dart';
import 'package:package_weather/product/navigator_routes/navigator_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final LigthTheme lightTheme = LigthTheme();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme.theme,
      initialRoute: '/',
      routes: NavigatorRoutes().items,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
    );
  }
}
