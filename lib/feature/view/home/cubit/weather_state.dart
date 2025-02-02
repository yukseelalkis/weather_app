import 'package:equatable/equatable.dart';
import 'package:package_weather/feature/model/weather_forest_model.dart';
import 'package:package_weather/feature/model/weather_model.dart';

class WeatherState extends Equatable {
  final bool isLoading;
  final WeatherModel? weatherModel;
  final ForeCastModel? foreCastModel;
  final String? errorMessage;

  const WeatherState({
    this.isLoading = false,
    this.weatherModel,
    this.foreCastModel,
    this.errorMessage,
  });

  @override
  List<Object?> get props =>
      [isLoading, weatherModel, foreCastModel, errorMessage];

  WeatherState copyWith({
    bool? isLoading,
    WeatherModel? weatherModel,
    ForeCastModel? foreCastModel,
    String? errorMessage,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      weatherModel: weatherModel ?? this.weatherModel,
      foreCastModel: foreCastModel ?? this.foreCastModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
