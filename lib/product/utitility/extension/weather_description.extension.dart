import 'package:package_weather/feature/weather_card/model/weather_model.dart';
import 'package:package_weather/product/utitility/constant/enum/image_enum.dart';

extension WeatherModelExtension on WeatherModel {
  String? get description =>
      weather?.isNotEmpty == true ? weather![0].description : null;
}

// burayi kullanabiliriz kalsin
ImagePath getImagePathFromDescription(String? description) {
  switch (description?.toLowerCase()) {
    case 'clear sky':
      return ImagePath.clearDay;
    case 'few clouds':
      return ImagePath.fewCloudsDay;
    case 'scattered clouds':
      return ImagePath.scatteredClouds;
    case 'broken clouds':
      return ImagePath.brokenCloudsDay;
    case 'shower rain':
      return ImagePath.showerRain;
    case 'rain':
      return ImagePath.rainDay;
    case 'thunderstorm':
      return ImagePath.thunderstorm;
    case 'snow':
      return ImagePath.snow;
    case 'mist':
      return ImagePath.mist;
    default:
      return ImagePath.fewCloudsDay; // Varsayılan değer
  }
}
