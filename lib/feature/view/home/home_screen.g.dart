part of 'home_screen.dart';

class _Filter extends StatelessWidget {
  const _Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
      child: Container(),
    );
  }
}

class _TopContainer extends StatelessWidget {
  const _TopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, -1.2),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
      ),
    );
  }
}

class _LeftContainer extends StatelessWidget {
  const _LeftContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-4, -0.3),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xFF673AB7)),
      ),
    );
  }
}

class _RightContainer extends StatelessWidget {
  const _RightContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(3, -0.3),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Colors.deepPurple),
      ),
    );
  }
}

class NewIconWeather extends StatelessWidget {
  final String iconCode; // OpenWeather'dan gelen "icon" kodu

  const NewIconWeather({
    super.key,
    required this.iconCode,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.shadoeDecoration, // Gölge dekorasyonu
      child: Image.asset(
        'assets/newIcon/$iconCode.png',
        scale: 3,
      ),
    );
  }
}

/// **WeatherInfoRow**
///
/// Hava durumu bilgisini ikon ve metin formatında gösterir.
///
/// - `iconPath`: Gösterilecek hava durumu ikonunun yolu.
/// - `title`: Bilgi başlığı (örneğin: "Sunrise", "Max Temp").
/// - `value`: Gösterilecek değer (örneğin: "06:45", "24°C").
///
/// Kullanıcıya hava durumu detaylarını görsel ve metinsel olarak sunar.

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
          padding: const EdgeInsets.all(16.0),
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

/// **WeatherInfoSection**
///
/// Anlık hava durumu bilgisini ve hava durumu ikonunu gösterir.
///
/// - `weatherItem`: Güncel hava durumu verilerini içeren model.
/// - Null olduğunda yükleme göstergesi (`CircularProgressIndicator`) görüntülenir.
/// - Hava durumu ikonunu belirlemek için `getWeatherIcon` metodunu kullanır.
/// - Sıcaklık değerini Celsius cinsine dönüştürmek için `convertToCelsius` metodunu kullanır.

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

/// **ForecastListSection**
///
/// Hava tahmini verilerini yatay kaydırılabilir bir liste olarak gösterir.
///
/// - `forecastItem`: Hava tahmin verilerini içeren model.
/// - Boş veya null olduğunda bir yükleme göstergesi (CircularProgressIndicator) görüntülenir.
/// - İçerisindeki kartlar `ForecastCardWidget` ile oluşturulur.

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
