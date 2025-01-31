import 'package:flutter/material.dart';
import 'package:package_weather/product/global/on_generate_route.dart';
import 'package:package_weather/product/global/theme_notifider.dart';
import 'package:package_weather/product/init/theme/ligth_theme/ligth_theme.dart';
import 'package:package_weather/product/navigation/navigate/navigate_manager.dart';
import 'package:package_weather/product/navigation/navigator_routes/navigator_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifer()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final LigthTheme lightTheme = LigthTheme();
  final CustomTheme customTheme = CustomTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifer>().currentTheme,
      //theme: CustomTheme().customLigthTheme,
      initialRoute: '/',
      routes: NavigatorRoutes().items,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
    );
  }
}





