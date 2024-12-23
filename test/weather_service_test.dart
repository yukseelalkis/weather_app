// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:package_weather/feature/model/weather_model.dart';
// import 'package:package_weather/feature/service/weather_service.dart';
// import 'package:package_weather/product/service/dio_network_manager.dart';

// void main() {
//   late IServiceWeather service;
//   setUp(
//     () {
//       service = ServiceWeather(DioManager.instance.service);
//     },
//   );
//   test(
//     'Weather Get Service',
//     () async {
//       final response = await service.fetchWeatherData();
//       expect(response, isA<List<WeatherModel>>());
//     },
//   );
// }
