import 'package:package_weather/feature/weather_card/model/weather_model.dart';

extension WeatherModelExtension on WeatherModel {
  String? get getIcon => weather?.isNotEmpty == true ? weather![0].icon : null;
}
