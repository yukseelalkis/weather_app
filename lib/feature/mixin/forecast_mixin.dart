import 'package:flutter/material.dart';
import 'package:package_weather/feature/model/weather_forest_model.dart';
import 'package:package_weather/feature/view/widget/forecast_widget.dart/forecast_widget.dart';
import 'package:package_weather/product/service/dio_network_manager.dart';
import 'package:package_weather/product/service/weather_service.dart';
import 'package:package_weather/product/utilitiy/enum/dio_manager_enum.dart';
import 'package:package_weather/product/utilitiy/enum/network_manager_enum.dart';

mixin ForecastMixin on State<ForeCastWidget> {
  late final IService service;
  ForeCastModel? forecastItem;

  @override
  void initState() {
    super.initState();
    final dio = DioManager().getService(DioManagerPath.weather.name);
    service = ServiceWeather(dio);
    fetchForeCastherData(widget.selectedCity);
  }

  @override
  void didUpdateWidget(covariant ForeCastWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedCity != widget.selectedCity) {
      fetchForeCastherData(widget.selectedCity);
    }
  }

  Future<void> fetchForeCastherData(String selectedCity) async {
    final item = await service.fetchData(
      '${WeatherServicePath.forecast.path}q=$selectedCity&units=metric${WeatherServicePath.appid.path}',
      (json) => ForeCastModel.fromJson(json),
    );
    setState(() {
      forecastItem = item;
    });
  }

  String formatDate(String? dateTime) {
    if (dateTime == null) return 'No Date';
    final date = DateTime.parse(dateTime);
    return '${date.day}/${date.month}/${date.year}';
  }
}
