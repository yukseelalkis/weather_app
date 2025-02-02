import 'package:bloc/bloc.dart';
import 'package:package_weather/feature/model/weather_forest_model.dart';
import 'package:package_weather/feature/model/weather_model.dart';
import 'package:package_weather/feature/view/home/cubit/weather_state.dart';
import 'package:package_weather/product/service/weather_service.dart';
import 'package:package_weather/product/utilitiy/enum/network_manager_enum.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final IService weatherService;

  WeatherCubit(this.weatherService) : super(const WeatherState());

  Future<void> fetchWeatherData(String city) async {
    emit(state.copyWith(isLoading: true));

    try {
      final weatherItem = await weatherService.fetchData(
        '${WeatherServicePath.weather.path}q=$city${WeatherServicePath.appid.path}',
        (json) => WeatherModel.fromJson(json),
      );

      final forecastItem = await weatherService.fetchData(
        '${WeatherServicePath.forecast.path}q=$city&units=metric${WeatherServicePath.appid.path}',
        (json) => ForeCastModel.fromJson(json),
      );

      emit(state.copyWith(
        isLoading: false,
        weatherModel: weatherItem,
        foreCastModel: forecastItem,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
