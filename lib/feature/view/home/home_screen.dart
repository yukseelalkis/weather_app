import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:package_weather/feature/model/weather_forest_model.dart';
import 'package:package_weather/feature/model/weather_model.dart';
import 'package:package_weather/feature/view/weather_view.dart';
import 'package:package_weather/feature/view/widget/drop_down_widget/drop_down_widget.dart';
import 'package:package_weather/feature/view/widget/forecast_widget.dart/forecast_widget.dart';
import 'package:package_weather/product/service/dio_network_manager.dart';
import 'package:package_weather/product/service/weather_service.dart';
import 'package:package_weather/product/utilitiy/app_style.dart/app_style.dart';
import 'package:package_weather/product/utilitiy/constants/padding/project_padding.dart';
import 'package:package_weather/product/utilitiy/enum/dio_manager_enum.dart';
import 'package:package_weather/product/utilitiy/enum/network_manager_enum.dart';
import 'package:intl/intl.dart';

part 'home_screen.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? weatherItem;
  ForeCastModel? forecastItem;
  late final IService service;
  String selectedCity = "Ankara"; // Varsayılan şehir
  static const String _LottieButtonPath =
      'assets/lottie/lottie_theme_change.json';

  @override
  void initState() {
    super.initState();
    final dio = DioManager().getService(DioManagerPath.weather.name);
    service = ServiceWeather(dio);
    fetchWeatherData(selectedCity);
    fetchForeCastherData(selectedCity);
  }

  /// **Yeni şehir seçildiğinde burası çağrılacak**
  void updateSelectedCity(String newCity) {
    setState(() {
      selectedCity = newCity;
    });
    fetchWeatherData(newCity);
    fetchForeCastherData(newCity);
  }

  /// **Anlık hava durumunu API'den çek**
  Future<void> fetchWeatherData(String city) async {
    final item = await service.fetchData(
      '${WeatherServicePath.weather.path}q=$city${WeatherServicePath.appid.path}',
      (json) => WeatherModel.fromJson(json),
    );
    setState(() {
      weatherItem = item;
    });
  }

  /// **Hava durumu tahminlerini API'den çek**
  Future<void> fetchForeCastherData(String city) async {
    final item = await service.fetchData(
      '${WeatherServicePath.forecast.path}q=$city&units=metric${WeatherServicePath.appid.path}',
      (json) => ForeCastModel.fromJson(json),
    );
    setState(() {
      forecastItem = item;
    });
  }

  String formatTime(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('HH:mm').format(date);
  }

  String convertToCelsius(double kelvin) {
    return (kelvin - 273.15).toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              /// ARKA PLAN
              const _RightContainer(),
              const _LeftContainer(),
              const _TopContainer(),
              const _Filter(),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// **Dropdown ve Hava Durumu Verileri**
                      CitiesDropdownWidget(
                        onCitySelected: updateSelectedCity,
                      ),

                      /// * Thema degisikligi
                      const Padding(
                        padding: PagePadding.top4xRight(),
                        child: ThemeToggleButton(lottiePath: _LottieButtonPath),
                      ),
                    ],
                  ),
                  WeatherInfoSection(weatherItem: weatherItem),
                  WeatherForecastSection(weatherItem: weatherItem),
                  ForecastListSection(forecastItem: forecastItem)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// color: context.watch<ThemeNotifer>().isLighTheme
//             ? Colors.black
//
//
//
//       : Colors.white,
