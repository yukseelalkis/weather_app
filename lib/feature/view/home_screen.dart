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
  static const String _SunrisePath = 'assets/newIcon/eleven.png';
  static const String _Sunrise = 'Sunrise';
  static const String _SunsetPath = 'assets/newIcon/twelve.png';
  static const String _Sunset = 'Sunset';
  static const String _Unknow = 'Bilinmiyor';
  static const String _MaxTempPath = 'assets/newIcon/thirteen.png';
  static const String _MaxTemp = 'Max Temp: ';
  static const String _MinTemp = 'Min Temp';
  static const String _MinTempPath = 'assets/newIcon/fourteen.png';

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

  /// **Hava durumu koduna göre ikon getirme**
  Widget getWeatherIcon(int code) {
    if (code >= 200 && code < 300) {
      return const NewIconWeather(iconCode: 'one');
    } else if (code >= 300 && code < 400) {
      return const NewIconWeather(iconCode: 'two');
    } else if (code >= 500 && code < 600) {
      return const NewIconWeather(iconCode: 'three');
    } else if (code >= 600 && code < 700) {
      return const NewIconWeather(iconCode: 'four');
    } else if (code >= 700 && code < 800) {
      return const NewIconWeather(iconCode: 'five');
    } else if (code == 800) {
      return const NewIconWeather(iconCode: 'six');
    } else if (code > 800 && code <= 804) {
      return const NewIconWeather(iconCode: 'seven');
    } else {
      return const NewIconWeather(iconCode: 'seven');
    }
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

////WIDGETS
///
///
///Ortadaki widgets  min max sunrise sunset
class WeatherForecastSection extends StatelessWidget {
  final WeatherModel? weatherItem;

  const WeatherForecastSection({super.key, required this.weatherItem});

  @override
  Widget build(BuildContext context) {
    const String _SunrisePath = 'assets/newIcon/eleven.png';
    const String _Sunrise = 'Sunrise';
    const String _SunsetPath = 'assets/newIcon/twelve.png';
    const String _Sunset = 'Sunset';
    const String _Unknow = 'Bilinmiyor';
    const String _MaxTempPath = 'assets/newIcon/thirteen.png';
    const String _MaxTemp = 'Max Temp: ';
    const String _MinTemp = 'Min Temp';
    const String _MinTempPath = 'assets/newIcon/fourteen.png';

    String formatTime(int timestamp) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      return DateFormat('HH:mm').format(date);
    }

    String convertToCelsius(double kelvin) {
      return (kelvin - 273.15).toStringAsFixed(1);
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherInfoRow(
              iconPath: _SunrisePath,
              title: _Sunrise,
              value: weatherItem?.sys?.sunrise != null
                  ? formatTime(weatherItem!.sys!.sunrise!)
                  : _Unknow,
            ),
            WeatherInfoRow(
              iconPath: _SunsetPath,
              title: _Sunset,
              value: weatherItem?.sys?.sunset != null
                  ? formatTime(weatherItem!.sys!.sunset!)
                  : _Unknow,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherInfoRow(
              iconPath: _MaxTempPath,
              title: _MaxTemp,
              value: weatherItem?.main?.tempMax != null
                  ? '${convertToCelsius(weatherItem!.main!.tempMax!)}°C'
                  : _Unknow,
            ),
            WeatherInfoRow(
              iconPath: _MinTempPath,
              title: _MinTemp,
              value: weatherItem?.main?.tempMin != null
                  ? '${convertToCelsius(weatherItem!.main!.tempMin!)}°C'
                  : _Unknow,
            ),
          ],
        ),
      ],
    );
  }
}

class WeatherInfoSection extends StatelessWidget {
  final WeatherModel? weatherItem;

  const WeatherInfoSection({super.key, required this.weatherItem});

  String convertToCelsius(double kelvin) {
    return (kelvin - 273.15).toStringAsFixed(1);
  }

  Widget getWeatherIcon(int code) {
    if (code >= 200 && code < 300) {
      return const NewIconWeather(iconCode: 'one');
    } else if (code >= 300 && code < 400) {
      return const NewIconWeather(iconCode: 'two');
    } else if (code >= 500 && code < 600) {
      return const NewIconWeather(iconCode: 'three');
    } else if (code >= 600 && code < 700) {
      return const NewIconWeather(iconCode: 'four');
    } else if (code >= 700 && code < 800) {
      return const NewIconWeather(iconCode: 'five');
    } else if (code == 800) {
      return const NewIconWeather(iconCode: 'six');
    } else {
      return const NewIconWeather(iconCode: 'seven');
    }
  }

  @override
  Widget build(BuildContext context) {
    return weatherItem == null
        ? const CircularProgressIndicator()
        : Column(
            children: [
              /// **Hava Durumu İkonu**
              Center(
                child: getWeatherIcon(weatherItem!.weather!.first.id!),
              ),

              /// **Sıcaklık Bilgisi**
              Text(
                '${convertToCelsius(weatherItem!.main!.temp!)}°C',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          );
  }
}

class ForecastListSection extends StatelessWidget {
  final ForeCastModel? forecastItem;

  const ForecastListSection({super.key, required this.forecastItem});

  String formatTime(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return forecastItem == null
        ? const CircularProgressIndicator()
        : Expanded(
            child: SizedBox(
              height: 150, // Kartların daha iyi görünmesi için sabit yükseklik
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: forecastItem!.list?.length ?? 0,
                itemBuilder: (context, index) {
                  final forecast = forecastItem!.list![index];
                  return ForecastCardWidget(
                    iconCode: forecast.weather!.first.id!.toString(),
                    temperature: forecast.main!.temp!.toString(),
                    weatherMain: forecast.weather!.first.main!,
                    weatherDescription: forecast.weather!.first.description!,
                    date: formatTime(forecast.dt!),
                    windSpeed: '${forecast.wind!.speed!}',
                    humidity: '${forecast.main!.humidity!}%',
                  );
                },
              ),
            ),
          );
  }
}
