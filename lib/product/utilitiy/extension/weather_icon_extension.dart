import 'package:package_weather/feature/model/weather_model.dart';

extension WeatherModelExtension on WeatherModel {
  String? get getIcon => weather?.isNotEmpty == true ? weather![0].icon : null;
}
