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
import 'package:flutter/services.dart';
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

/// Custom Theme
class CustomTheme {
  late ThemeData customDarkTheme;
  late ThemeData customLigthTheme;
  CustomTheme() {
    customDarkTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          //AppBar'ın üstünde bulunan durum çubuğunun (status bar) ikonlarının ve yazılarının rengini kontrol etmeye yarar.
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)),

      // **Dropdown Arka Planını Siyah Yap**
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Kenarları yuvarlat
            ),
          ),
        ),
      ),

      // Uygulamanın genelinde geçerli olacak yazı stilleri
      textTheme: const TextTheme(
        // Büyük başlık (Örnek: '22°C' gibi)
        headlineLarge: TextStyle(
          fontSize: 55,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        // Orta başlık (Örnek: 'THUNDERSTORM' gibi)
        headlineMedium: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        // Alt başlık (Örnek: 'GoodMorning' gibi)
        headlineSmall: TextStyle(
          fontSize: 64,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        // Açıklama metinleri (Örnek: 'Friday 16- 09.41am' gibi)
        titleMedium: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
        // Temel ince metin (Örnek: 'Aix-en-Provence' gibi)
        bodyLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
        // Temel kalın metin
        bodyMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),

        // Küçük ek açıklama metinleri (Örnek: 'Sunrise', 'Sunset' vb.)
        bodySmall: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
    );

    ////****Ligth Theme */
    customLigthTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          //AppBar'ın üstünde bulunan durum çubuğunun (status bar) ikonlarının ve yazılarının rengini kontrol etmeye yarar.
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)),

      // **Dropdown Arka Planını Siyah Yap**
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Kenarları yuvarlat
            ),
          ),
        ),
      ),
//                style: Theme.of(context).textTheme.bodySmall,

      // Uygulamanın genelinde geçerli olacak yazı stilleri
      textTheme: const TextTheme(
        // Büyük başlık (Örnek: '22°C' gibi)
        headlineLarge: TextStyle(
          fontSize: 55,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        // Orta başlık (Örnek: 'THUNDERSTORM' gibi)
        headlineMedium: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        // Alt başlık (Örnek: 'GoodMorning' gibi)
        headlineSmall: TextStyle(
          fontSize: 64,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        // Açıklama metinleri (Örnek: 'Friday 16- 09.41am' gibi)
        titleMedium: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        // Temel ince metin (Örnek: 'Aix-en-Provence' gibi)
        bodyLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        // Temel kalın metin
        bodyMedium: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        // Küçük ek açıklama metinleri (Örnek: 'Sunrise', 'Sunset' vb.)
        bodySmall: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
