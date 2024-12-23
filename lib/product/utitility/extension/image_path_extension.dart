import 'package:package_weather/product/utitility/constant/enum/image_enum.dart';

extension ImagePathsExtension on ImagePath {
  String get path {
    return 'assets/Icon/${name()}.png';
  }

  String name() {
    switch (this) {
      case ImagePath.clearDay:
        return "01d";
      case ImagePath.clearNight:
        return "01n";
      case ImagePath.fewCloudsDay:
        return "02d";
      case ImagePath.fewCloudsNight:
        return "02n";
      case ImagePath.scatteredClouds:
        return "03d";
      case ImagePath.brokenCloudsDay:
        return "04d";
      case ImagePath.brokenCloudsNight:
        return "04n";
      case ImagePath.showerRain:
        return "09d";
      case ImagePath.rainDay:
        return "10d";
      case ImagePath.rainNight:
        return "10n";
      case ImagePath.thunderstorm:
        return "11d";
      case ImagePath.snow:
        return "13d";
      case ImagePath.mist:
        return "50d";
      default:
        throw Exception("Bilinmeyen ikon adı!");
    }
  }
}
