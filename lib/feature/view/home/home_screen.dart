import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_weather/feature/model/weather_forest_model.dart';
import 'package:package_weather/feature/model/weather_model.dart';
import 'package:package_weather/feature/view/home/cubit/weather_cubit.dart';
import 'package:package_weather/feature/view/home/cubit/weather_state.dart';
import 'package:package_weather/feature/view/weather_view.dart';
import 'package:package_weather/feature/view/widget/drop_down_widget/drop_down_widget.dart';
import 'package:package_weather/feature/view/widget/forecast_widget.dart/forecast_widget.dart';
import 'package:package_weather/product/init/language/project_items_string.dart';
import 'package:package_weather/product/service/dio_network_manager.dart';
import 'package:package_weather/product/service/weather_service.dart';
import 'package:package_weather/product/utilitiy/app_style.dart/app_style.dart';
import 'package:package_weather/product/utilitiy/constants/padding/project_padding.dart';
import 'package:package_weather/product/utilitiy/enum/dio_manager_enum.dart';
import 'package:intl/intl.dart';

part 'home_screen.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final IService service;
  String selectedCity = "Ankara"; // Varsayılan şehir
  static const String _lottieButtonPath =
      'assets/lottie/lottie_theme_change.json';

  late final WeatherCubit weatherCubit;

  @override
  void initState() {
    super.initState();
    final dio = DioManager().getService(DioManagerPath.weather.name);
    service = ServiceWeather(dio);
    weatherCubit = WeatherCubit(service);
    weatherCubit.fetchWeatherData(selectedCity);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => weatherCubit,
      child: Scaffold(
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

                BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// **Dropdown ve Hava Durumu Verileri**
                            CitiesDropdownWidget(
                              onCitySelected: (city) {
                                weatherCubit.fetchWeatherData(city);
                              },
                            ),

                            /// * Thema degisikligi
                            const Padding(
                              padding: PagePadding.top4xRight(),
                              child: ThemeToggleButton(
                                  lottiePath: _lottieButtonPath),
                            ),
                          ],
                        ),
                        WeatherInfoSection(weatherItem: state.weatherModel),
                        WeatherForecastSection(weatherItem: state.weatherModel),
                        ForecastListSection(forecastItem: state.foreCastModel)
                      ],
                    );
                  },
                ),
              ],
            ),
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
