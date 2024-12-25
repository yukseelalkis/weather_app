part of '../view/widget/forecast_widget.dart/view/forecast_widget.dart';

class ForecastCardWidget extends StatelessWidget {
  final String iconCode;
  final String temperature;
  final String weatherMain;
  final String weatherDescription;
  final String date;
  final String windSpeed;
  final String humidity;

  const ForecastCardWidget({
    required this.iconCode,
    required this.temperature,
    required this.weatherMain,
    required this.weatherDescription,
    required this.date,
    required this.windSpeed,
    required this.humidity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: AppStyle.projectFutureWidth,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconWeather(iconCode: iconCode),
            Text('$temperature°C',
                style: Theme.of(context).textTheme.bodyLarge),
            Text(weatherMain, style: Theme.of(context).textTheme.bodyMedium),
            Text(weatherDescription,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall),
            Text(date, style: Theme.of(context).textTheme.bodySmall),
            Text('Rüzgar: $windSpeed km/s',
                style: Theme.of(context).textTheme.bodySmall),
            Text('Nem: $humidity%',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
