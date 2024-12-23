import 'package:flutter/material.dart';
import 'package:package_weather/product/utitility/constant/project_color/color_items.dart';

class AppStyle with ProjectItemColors {
  // sabit degerler
  static const double textBodyLargeSize = 24;
  static const double textBodyMediumSize = 16;
  static const double textBodySmallSize = 14;
  static const double thihknes = 4;
  static const double projectElevation = 6;
  static const double projectBlurRadius = 4;
  static const double projectBorderCircular = 16;
  static const double projectDailyCardWidth = 500;
  static const double projectDailyCardHeigth = 200;
  static const double projectFutureWidth = 150;
  static const double projectOpacity = 0.5;
  static const double projectIconWeatherWidth = 150;
  static const double projectIconWeatherHeigth = 100;
  static const Offset projectOffSet = Offset(2, 2);
  // Border

  static BorderRadius get borderRadius =>
      BorderRadius.circular(projectBorderCircular);

  static RoundedRectangleBorder get roundedRectangleBorder =>
      RoundedRectangleBorder(borderRadius: borderRadius);

  // Box Decerotaion

  static BoxDecoration procetBoxDeceration =
      BoxDecoration(color: Colors.white, borderRadius: borderRadius);

// Shadow
  Shadow get projectShadow => Shadow(
        offset: projectOffSet,
        blurRadius: projectBlurRadius,
        color: ProjectItemColors.shadowColor.withOpacity(projectOpacity),
      );

  // icon shadow

  static BoxDecoration shadoeDecoration = BoxDecoration(boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.2), // Gölge rengi ve opaklığı
      spreadRadius: 0.5, // Gölgenin yayılma genişliği
      blurRadius: 200, // Gölgenin bulanıklık derecesi
      offset: const Offset(0, 4), // Gölgenin konumu (x, y)
    )
  ]);
  //Scafold
  static BoxDecoration gradientBoxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.yellow,
        ProjectItemColors.scafoldBackRoundColor,
      ],
    ),
  );
}
