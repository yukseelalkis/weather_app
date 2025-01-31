import 'package:flutter/material.dart';
import 'package:package_weather/product/utilitiy/app_style.dart/app_style.dart';
import 'package:package_weather/product/utilitiy/constants/padding/project_padding.dart';

class IconWeather extends StatelessWidget {
  final String iconCode; // OpenWeather'dan gelen "icon" kodu

  const IconWeather({
    super.key,
    required this.iconCode,
  });

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/1.png');
      case >= 300 && < 400:
        return Image.asset('assets/2.png');
      case >= 500 && < 600:
        return Image.asset('assets/3.png');
      case >= 600 && < 700:
        return Image.asset('assets/4.png');
      case >= 700 && < 800:
        return Image.asset('assets/5.png');
      case == 800:
        return Image.asset('assets/6.png');
      case > 800 && <= 804:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/7.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.shadoeDecoration, // Gölge dekorasyonu
      child: Image.asset(
        'assets/newIcon/$iconCode.png',
        width: AppStyle.projectIconWeatherWidth,
        height: AppStyle.projectIconWeatherHeigth,
        fit: BoxFit.contain, // Görüntü bozulmadan kapsar
      ),
    );
  }
}

// descriptionu vermeme yardimci olabiliyor bu
// class IconWeather extends StatelessWidget {
//   final ImagePath imagePath;
//   const IconWeather({
//     super.key,
//     required this.imagePath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: AppStyle.shadoeDecoration,
//       child: Image.asset(
//         width: AppStyle.projectIconWeatherWidth,
//         height: AppStyle.projectIconWeatherHeigth,
//         imagePath.path, // Enum üzerinden path çağrılır
//         fit: BoxFit.fitWidth,
//       ),
//     );
//   }
// }

// class IconWeather extends StatelessWidget {
//   final ImagePath imagePath;
//   const IconWeather({
//     super.key,
//     required this.imagePath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: AppStyle.projectIconWeatherWidth,
//       height: AppStyle.projectIconWeatherHeigth,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2), // Gölge rengi ve opaklığı
//             spreadRadius: 1, // Gölgenin yayılma genişliği
//             blurRadius: 10, // Gölgenin bulanıklık derecesi
//             offset: const Offset(0, 4), // Gölgenin konumu (x, y)
//           ),
//         ],
//       ),
//       child: Image.asset(
//         imagePath.path, // Enum üzerinden path çağrılır
//         fit: BoxFit.contain,
//       ),
//     );
//   }
// }

class WeatherInfo extends StatelessWidget {
  final IconData icon;
  final String label;

  const WeatherInfo({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.halfAll(),
      child: Column(
        children: [
          Icon(icon),
          Padding(
            padding: const PagePadding.top(),
            child: Text(label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall),
          ),
        ],
      ),
    );
  }
}

class NewIconWeather extends StatelessWidget {
  final String iconCode; // OpenWeather'dan gelen "icon" kodu


  const NewIconWeather({
    super.key,
    required this.iconCode,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.shadoeDecoration, // Gölge dekorasyonu
      child: Image.asset(
        'assets/newIcon/$iconCode.png',
        scale: 6,
      ),
    );
  }
}
