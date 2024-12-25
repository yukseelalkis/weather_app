import 'package:flutter/material.dart';
import 'package:package_weather/feature/model/weather_model.dart';
import 'package:package_weather/feature/view/widget/weather_card_widget/view/weather_card_widget.dart';
import 'package:package_weather/product/service/dio_network_manager.dart';
import 'package:package_weather/product/service/weather_service.dart';
import 'package:package_weather/product/utilitiy/enum/dio_manager_enum.dart';
import 'package:package_weather/product/utilitiy/enum/network_manager_enum.dart';

mixin WeatherCardMixin on State<WeatherCardWidget> {
  WeatherModel? weatherItem;
  late final IService service;

  @override
  void initState() {
    super.initState();
    final dio = DioManager().getService(DioManagerPath.weather.name);
    service = ServiceWeather(dio);
    fetchWeatherData(widget.selectedCity);
  }

  // guncelleme durumu
  @override
  void didUpdateWidget(covariant WeatherCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedCity != widget.selectedCity) {
      fetchWeatherData(widget.selectedCity);
    }
  }

  Future<void> fetchWeatherData(String selectedCity) async {
    final item = await service.fetchData(
      '${WeatherServicePath.weather.path}q=${widget.selectedCity}${WeatherServicePath.appid.path}',
      (json) => WeatherModel.fromJson(json),
    );
    setState(() {
      weatherItem = item;
    });
  }
}
