import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_weather/product/utilitiy/app_style.dart/app_style.dart';

class DarkTheme {
  late ThemeData theme;

  DarkTheme() {
    theme = ThemeData(
      scaffoldBackgroundColor:
          const Color(0xFF121212), // Daha koyu arka plan rengi
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: AppStyle.textBodyLargeSize,
          color: Colors.white,
          shadows: [AppStyle().projectShadow],
        ),
        displayMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: AppStyle.textBodyMediumSize,
          color: Colors.white70,
          shadows: [AppStyle().projectShadow],
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: AppStyle.textBodySmallSize,
          color: Colors.white60,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: AppStyle.textBodyLargeSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: AppStyle.textBodyMediumSize,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: AppStyle.textBodySmallSize,
          color: Colors.white60,
        ),
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF1F1F1F), // Daha koyu kart rengi
        elevation: AppStyle.projectElevation,
        shadowColor: Colors.black54,
        shape: AppStyle.roundedRectangleBorder,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white70, // İkon rengi
        size: 40,
      ),
    );
  }
}
