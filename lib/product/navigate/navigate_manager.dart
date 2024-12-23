import 'package:flutter/material.dart';

class NavigatorManager {
  NavigatorManager._();
  static final NavigatorManager instance = NavigatorManager._();

  final GlobalKey<NavigatorState> navigatorGlobalKey =
      GlobalKey<NavigatorState>();

  Future<void> navigateTo(String routeName) async {
    navigatorGlobalKey.currentState?.pushNamed(routeName);
  }

  Future<void> replaceWith(String routeName) async {
    navigatorGlobalKey.currentState?.pushReplacementNamed(routeName);
  }
}
