// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:package_weather/product/utilitiy/app_style.dart/app_style.dart';
// import 'package:package_weather/product/init/theme/project_color/color_items.dart';

// class LigthTheme {
//   late ThemeData theme;

//   LigthTheme() {
//     theme = ThemeData(
//       appBarTheme: const AppBarTheme(
//           centerTitle: true,
//           backgroundColor: ProjectItemColors.mainColor,
//           foregroundColor: ProjectItemColors.appBarForeColor),
//       textTheme: TextTheme(
//           displayLarge: GoogleFonts.poppins(
//             fontWeight: FontWeight.bold,
//             //Color duzenlemesi yapinca duzelecek
//             color: Colors.black,
//             shadows: [AppStyle().projectShadow],
//           ),
//           displayMedium: GoogleFonts.poppins(
//             fontWeight: FontWeight.bold,
//             //fontSize: 40, bakacaz
//             color: Colors.black,
//             shadows: [AppStyle().projectShadow],
//           ),
//           displaySmall: GoogleFonts.poppins(
//             fontSize: 18,
//             color: Colors.black,
//           ),
//           bodyLarge: const TextStyle(
//             fontSize: AppStyle.textBodyLargeSize,
//             fontWeight: FontWeight.bold,
//           ),
//           bodyMedium: const TextStyle(
//               // mixin yaptiik ama kullanimi neden farkli bunu sorusturacaz
//               fontSize: AppStyle.textBodyMediumSize,
//               fontWeight: FontWeight.bold,
//               color: ProjectItemColors.shadowColor),
//           bodySmall: const TextStyle(
//               fontSize: AppStyle.textBodySmallSize,
//               color: ProjectItemColors.shadowColor)),
//       cardTheme: CardTheme(
//         elevation: AppStyle.projectElevation,
//         shape: AppStyle.roundedRectangleBorder,
//       ),
//       iconTheme: const IconThemeData(color: Colors.blue, size: 40),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_weather/product/utilitiy/app_style.dart/app_style.dart';
import 'package:package_weather/product/init/theme/project_color/color_items.dart';

class LigthTheme {
  late ThemeData theme;

  LigthTheme() {
    theme = ThemeData(
      scaffoldBackgroundColor:
          ProjectItemColors.scafoldBackRoundColor, // Arka plan rengi
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: ProjectItemColors.appBarBackRound,
        foregroundColor: ProjectItemColors.appBarForeColor,
        elevation: 4,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: AppStyle.textBodyLargeSize,
          color: ProjectItemColors.textColor,
          shadows: [AppStyle().projectShadow],
        ),
        displayMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: AppStyle.textBodyLargeSize,
          color: ProjectItemColors.textColor,
          shadows: [AppStyle().projectShadow],
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: AppStyle.textBodySmallSize,
          color: ProjectItemColors.textColor,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: AppStyle.textBodyLargeSize,
          fontWeight: FontWeight.bold,
          color: ProjectItemColors.textColor,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: AppStyle.textBodyMediumSize,
          fontWeight: FontWeight.bold,
          color: ProjectItemColors.shadowColor,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: AppStyle.textBodySmallSize,
          color: ProjectItemColors.shadowColor,
        ),
      ),
      cardTheme: CardTheme(
        color: ProjectItemColors.cardColor,
        elevation: AppStyle.projectElevation,
        shadowColor: ProjectItemColors.shadowColor,
        shape: AppStyle.roundedRectangleBorder,
      ),
      iconTheme: const IconThemeData(
        color: ProjectItemColors.accentColor,
        size: 40,
      ),
    );
  }
}
