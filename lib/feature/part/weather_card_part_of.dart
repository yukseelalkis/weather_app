part of '../view/widget/weather_card_widget/weather_card_widget.dart';

class _WeatherDetailsRow extends StatelessWidget {
  const _WeatherDetailsRow({
    required WeatherModel? weatherItem,
  }) : _weatherItem = weatherItem;

  final WeatherModel? _weatherItem;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
