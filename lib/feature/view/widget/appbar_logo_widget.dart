// App bar Logo weather
import 'package:flutter/material.dart';

class LogoAppbarWidget extends StatelessWidget {
  final String name;
  const LogoAppbarWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Image.asset(
        _nameWithPath,
        fit: BoxFit.contain,
      ),
    );
  }

  String get _nameWithPath => 'assets/logo/$name.png';
}
