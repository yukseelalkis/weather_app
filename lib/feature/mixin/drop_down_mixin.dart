import 'package:flutter/material.dart';
import 'package:package_weather/feature/model/cities_model.dart';
import 'package:package_weather/feature/view/widget/drop_down_widget/view/drop_down_widget.dart';
import 'package:package_weather/product/service/dio_network_manager.dart';
import 'package:package_weather/product/service/weather_service.dart';
import 'package:package_weather/product/utilitiy/enum/dio_manager_enum.dart';
import 'package:package_weather/product/utilitiy/enum/network_manager_enum.dart';

mixin DropDownMixin on State<CitiesDropdownWidget> {
  // bunda bir tik sikinti var bakacaz
  CitiesModel? cities;

  late final IService service;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    final dio = DioManager().getService(DioManagerPath.turkey.name);
    service = ServiceWeather(dio);
    fetchCitiesData();
  }

  Future<void> fetchCitiesData() async {
    final item = await service.fetchData(
        WeatherServicePath.cities.path, (json) => CitiesModel.fromJson(json));
    setState(() {
      cities = item;
    });
  }
}
