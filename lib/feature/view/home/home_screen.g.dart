part of 'home_screen.dart';

class _Filter extends StatelessWidget {
  const _Filter();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: AppStyle.projectImageFilter,
      child: Container(),
    );
  }
}

class _TopContainer extends StatelessWidget {
  const _TopContainer();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, -1.2),
      child: Container(
          height: AppStyle.backroundContainerSize,
          width: AppStyle.backroundContainerSize,
          decoration: AppStyle.backroundFirstColor),
    );
  }
}

class _LeftContainer extends StatelessWidget {
  const _LeftContainer();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-4, -0.3),
      child: Container(
          height: AppStyle.backroundContainerSize,
          width: AppStyle.backroundContainerSize,
          decoration: AppStyle.backroundDarkColor),
    );
  }
}

class _RightContainer extends StatelessWidget {
  const _RightContainer();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AppStyle.aligmentGeometry,
      child: Container(
          height: AppStyle.backroundContainerSize,
          width: AppStyle.backroundContainerSize,
          decoration: AppStyle.backroundDarkColor),
    );
  }
}

class NewIconWeather extends StatelessWidget {
  final String iconCode;

  const NewIconWeather({
    super.key,
    required this.iconCode,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.shadoeDecoration,
      child: Image.asset(
        'assets/newIcon/$iconCode.png',
        scale: 3,
      ),
    );
  }
}

class WeatherInfoRow extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;

  const WeatherInfoRow({
    super.key,
    required this.iconPath,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(iconPath, scale: 8),
        Padding(
          padding: const PagePadding.home(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

////WIDGETS

///
////// **WeatherForecastSection**
///
/// Gün doğumu, gün batımı, maksimum ve minimum sıcaklık bilgilerini gösterir.
///
/// - `weatherItem`: Güncel hava durumu verilerini içeren model.
/// - Gün doğumu ve gün batımı saatlerini `formatTime` metodu ile gösterir.
/// - Maksimum ve minimum sıcaklığı Celsius cinsine dönüştürmek için `convertToCelsius` metodunu kullanır.
/// - Bilgi yoksa `_Unknow` değeri gösterilir.

class WeatherForecastSection extends StatelessWidget
    with FormatTime, ConvertCelvin {
  final WeatherModel? weatherItem;

  const WeatherForecastSection({super.key, required this.weatherItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherInfoRow(
              iconPath: ProjectStringItems.sunrisePath,
              title: ProjectStringItems.sunrise,
              value: weatherItem?.sys?.sunrise != null
                  ? formatTime(weatherItem!.sys!.sunrise!)
                  : ProjectStringItems.unknow,
            ),
            WeatherInfoRow(
              iconPath: ProjectStringItems.sunsetPath,
              title: ProjectStringItems.sunset,
              value: weatherItem?.sys?.sunset != null
                  ? formatTime(weatherItem!.sys!.sunset!)
                  : ProjectStringItems.unknow,
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
              iconPath: ProjectStringItems.maxTempPath,
              title: ProjectStringItems.maxTemp,
              value: weatherItem?.main?.tempMax != null
                  ? '${convertToCelsius(weatherItem!.main!.tempMax!)}°C'
                  : ProjectStringItems.unknow,
            ),
            WeatherInfoRow(
              iconPath: ProjectStringItems.minTempPath,
              title: ProjectStringItems.minTemp,
              value: weatherItem?.main?.tempMin != null
                  ? '${convertToCelsius(weatherItem!.main!.tempMin!)}°C'
                  : ProjectStringItems.unknow,
            ),
          ],
        ),
      ],
    );
  }
}

/// **WeatherInfoSection**
///
/// Anlık hava durumu bilgisini ve hava durumu ikonunu gösterir.
///
/// - `weatherItem`: Güncel hava durumu verilerini içeren model.
/// - Null olduğunda yükleme göstergesi (`CircularProgressIndicator`) görüntülenir.
/// - Hava durumu ikonunu belirlemek için `getWeatherIcon` metodunu kullanır.
/// - Sıcaklık değerini Celsius cinsine dönüştürmek için `convertToCelsius` metodunu kullanır.

class WeatherInfoSection extends StatelessWidget with ConvertCelvin {
  final WeatherModel? weatherItem;

  const WeatherInfoSection({super.key, required this.weatherItem});

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

/// **ForecastListSection**
///
/// Hava tahmini verilerini yatay kaydırılabilir bir liste olarak gösterir.
///
/// - `forecastItem`: Hava tahmin verilerini içeren model.
/// - Boş veya null olduğunda bir yükleme göstergesi (CircularProgressIndicator) görüntülenir.
/// - İçerisindeki kartlar `ForecastCardWidget` ile oluşturulur.

class ForecastListSection extends StatelessWidget with FormatTime {
  final ForeCastModel? forecastItem;

  const ForecastListSection({super.key, required this.forecastItem});

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

mixin FormatTime {
  /// Verilen Unix zaman damgasını 'HH:mm' formatına çevirir.
  ///
  /// [timestamp]: Saniye cinsinden Unix zaman damgası.
  /// Dönen değer: Saat ve dakika bilgisini içeren bir `String`.
  String formatTime(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('HH:mm').format(date);
  }
}

mixin ConvertCelvin {
  /// Kelvin cinsinden verilen sıcaklığı Celsius'a çevirir.
  ///
  /// [kelvin]: Kelvin cinsinden sıcaklık değeri.
  /// Dönen değer: Ondalık hassasiyetli Celsius sıcaklık değeri (`String`).
  String convertToCelsius(double kelvin) {
    return (kelvin - 273.15).toStringAsFixed(1);
  }
}
