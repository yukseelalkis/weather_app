part of '../view/widget/forecast_widget.dart/forecast_widget.dart';

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


  // daha global yapacaz
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        /// light ve dark icin ayar yapacaz
        color: context.watch<ThemeNotifer>().isLighTheme
            ? Colors.black
            : Colors.white,

        child: SizedBox(
          width: AppStyle.projectFutureWidth,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getWeatherIcon(int.parse(iconCode)),
              Text('$temperature°C',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text(
                weatherMain,
                style: Theme.of(context).textTheme.bodySmall,
              ),
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
      ),
    );
  }
}
