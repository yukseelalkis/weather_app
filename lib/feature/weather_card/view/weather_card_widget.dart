import 'package:flutter/material.dart';
import 'package:package_weather/feature/weather_card/model/weather_model.dart';
import 'package:package_weather/product/service/weather_service.dart';
import 'package:package_weather/product/service/dio_network_manager.dart';
import 'package:package_weather/product/utitility/constant/app_style.dart/app_style.dart';
import 'package:package_weather/product/utitility/constant/enum/dio_manager_enum.dart';
import 'package:package_weather/product/utitility/constant/enum/network_manager_enum.dart';
import 'package:package_weather/product/utitility/constant/widget/icon_widget.dart';
import 'package:package_weather/product/utitility/extension/weather_icon_extension.dart';

class WeatherCardWidget extends StatefulWidget {
  const WeatherCardWidget({
    super.key,
  });

  @override
  State<WeatherCardWidget> createState() => _WeatherCardWidget();
}

class _WeatherCardWidget extends State<WeatherCardWidget> {
  late final IService service;
  WeatherModel? _weatherItem;

  @override
  void initState() {
    super.initState();
    //service = ServiceWeather(DioManager.instance.service);
    final dio = DioManager().getService(DioManagerPath.weather.name);
    service = ServiceWeather(dio);
    //service = ServiceWeather(DioManager().getService('weather'));
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final item = await service.fetchData(
      WeatherServicePath.weather.path,
      (json) => WeatherModel.fromJson(json),
    );
    setState(() {
      _weatherItem = item; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return _weatherItem == null
        ? const CircularProgressIndicator() 
        : Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  width: AppStyle.projectDailyCardWidth,
                  height: AppStyle.projectDailyCardHeigth,
                  decoration: AppStyle.procetBoxDeceration),
              Positioned(
                  top: -50,
                  left: -20,
                  // degisim
                  child: _weatherItem?.getIcon != null
                      ? IconWeather(
                          iconCode: _weatherItem!.getIcon!) // "icon" kullanılır
                      : const SizedBox() // Varsayılan ikon
                  ),
              Positioned(
                top: 20, // Dereceyi biraz yukarıda hizaladım
                right: 50,
                // servisten gelecek
                child: Text(
                    '${_weatherItem?.main?.temp != null ? (_weatherItem!.main!.temp! - 273.15).toStringAsFixed(1) : '--'}°C',
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              Positioned(
                bottom: 20,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherInfo(
                        icon: Icons.wind_power_outlined,
                        label:
                            '${_weatherItem?.wind?.speed?.toStringAsFixed(1) ?? '--'} km/s'),
                    WeatherInfo(
                        icon: Icons.water_drop_outlined,
                        label: '${_weatherItem?.main?.humidity ?? '--'}%'),
                    WeatherInfo(
                        icon: Icons.cloud_outlined,
                        label: '${_weatherItem?.clouds?.all ?? '--'}%'),
                  ],
                ),
              ),
            ],
          );
  }
}
