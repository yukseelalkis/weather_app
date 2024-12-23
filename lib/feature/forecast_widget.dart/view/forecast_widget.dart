import 'package:flutter/material.dart';
import 'package:package_weather/feature/forecast_widget.dart/model/weather_forest_model.dart';
import 'package:package_weather/product/service/weather_service.dart';
import 'package:package_weather/product/service/dio_network_manager.dart';
import 'package:package_weather/product/utitility/constant/app_style.dart/app_style.dart';
import 'package:package_weather/product/utitility/constant/enum/dio_manager_enum.dart';
import 'package:package_weather/product/utitility/constant/enum/network_manager_enum.dart';
import 'package:package_weather/product/utitility/constant/padding/project_padding.dart';
import 'package:package_weather/product/utitility/constant/widget/icon_widget.dart';

class ForeCastWidget extends StatefulWidget {
  const ForeCastWidget({super.key});

  @override
  State<ForeCastWidget> createState() => _ForeCastWidget();
}

class _ForeCastWidget extends State<ForeCastWidget> {
  late final IService service;
  ForeCastModel? _forecastItem;

  @override
  void initState() {
    super.initState();
    //service = ServiceWeather(DioManager.instance.service);
    final dio = DioManager().getService(DioManagerPath.weather.name);
    service = ServiceWeather(dio);
    //service = ServiceWeather(DioManager().getService('weather'));
    fetchForeCastherData();
  }

  Future<void> fetchForeCastherData() async {
    final item = await service.fetchData(
      WeatherServicePath.forecast.path,
      (json) => ForeCastModel.fromJson(json),
    );
    setState(() {
      _forecastItem = item;
    });
  }

  String _formatDate(String? dateTime) {
    if (dateTime == null) return '--'; // Tarih null ise '--' döner
    final date = DateTime.parse(dateTime);
    return '${date.day}.${date.month}.${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // 5 tane kart olacak
        itemCount: _forecastItem?.cnt ?? 0,
        itemBuilder: (context, index) {
          return Padding(
              padding: const PagePadding.vertical(),
              child: Card(
                child: SizedBox(
                  width: AppStyle.projectFutureWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconWeather(
                        iconCode:
                            _forecastItem?.list?[index].weather?.first.icon ??
                                '01d',
                      ),
                      // Sıcaklık Bilgisi
                      Text(
                        '${_forecastItem?.list?[index].main?.temp?.toStringAsFixed(1) ?? '--'}°C',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),

                      // Ana Hava Durumu (örneğin: Clear)
                      Text(
                        _forecastItem?.list?[index].weather?.first.main ??
                            'No Data',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      // Hava Durumu Açıklaması (örneğin: clear sky)
                      Text(
                        _forecastItem
                                ?.list?[index].weather?.first.description ??
                            'No Description',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),

                      // Tarih Bilgisi
                      Text(
                        _formatDate(_forecastItem?.list?[index].dtTxt),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),

                      // Rüzgar Hızı
                      Text(
                        'Rüzgar: ${_forecastItem?.list?[index].wind?.speed?.toStringAsFixed(1) ?? '--'} km/s',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),

                      // Nem Oranı
                      Text(
                        'Nem: ${_forecastItem?.list?[index].main?.humidity ?? '--'}%',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}

// servisten gelecek degerler var.