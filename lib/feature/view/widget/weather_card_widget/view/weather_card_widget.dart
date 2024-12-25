import 'package:flutter/material.dart';
import 'package:package_weather/feature/mixin/weather_card_mixin.dart';
import 'package:package_weather/feature/model/weather_model.dart';
import 'package:package_weather/product/utilitiy/app_style.dart/app_style.dart';
import 'package:package_weather/feature/view/widget/icon_widget.dart';
import 'package:package_weather/product/utilitiy/extension/weather_icon_extension.dart';

part '../../../../part/weather_card_part_of.dart';

class WeatherCardWidget extends StatefulWidget {
  final String selectedCity;
  const WeatherCardWidget({
    required this.selectedCity,
    super.key,
  });

  @override
  State<WeatherCardWidget> createState() => _WeatherCardWidget();
}

class _WeatherCardWidget extends State<WeatherCardWidget> with WeatherCardMixin {
  @override
  Widget build(BuildContext context) {
    return weatherItem == null
        ? const CircularProgressIndicator()
        : Stack(
            clipBehavior: Clip.none,
            children: [
              const SizedBox(
                width: AppStyle.projectDailyCardWidth,
                height: AppStyle.projectDailyCardHeigth,
                child: Card(),
              ),
              Positioned(
                  top: -50,
                  left: -20,
                  child: weatherItem?.getIcon != null
                      ? IconWeather(iconCode: weatherItem!.getIcon!)
                      : const SizedBox()),
              Positioned(
                top: 20,
                right: 50,
                child: Text(
                    '${weatherItem?.main?.temp != null ? (weatherItem!.main!.temp! - 273.15).toStringAsFixed(1) : '--'}°C',
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              Positioned(
                bottom: 20,
                left: 10,
                right: 10,
                child: _WeatherDetailsRow(weatherItem: weatherItem),
              ),
            ],
          );
  }
}
