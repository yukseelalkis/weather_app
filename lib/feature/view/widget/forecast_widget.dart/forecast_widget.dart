import 'package:flutter/material.dart';
import 'package:package_weather/feature/mixin/forecast_mixin.dart';
import 'package:package_weather/product/global/theme_notifider.dart';
import 'package:package_weather/product/utilitiy/app_style.dart/app_style.dart';
import 'package:package_weather/product/utilitiy/constants/padding/project_padding.dart';
import 'package:package_weather/feature/view/widget/icon_widget.dart';
import 'package:provider/provider.dart';

part '../../../part/forecast_part_of.dart';

class ForeCastWidget extends StatefulWidget {
  final String selectedCity;

  const ForeCastWidget({required this.selectedCity, super.key});

  @override
  State<ForeCastWidget> createState() => _ForeCastWidget();
}

class _ForeCastWidget extends State<ForeCastWidget> with ForecastMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: forecastItem?.cnt ?? 0,
        itemBuilder: (context, index) {
          final item = forecastItem?.list?[index];
          return Padding(
            padding: const PagePadding.vertical(),
            child: ForecastCardWidget(
              iconCode: item?.weather?.first.icon ?? '01d',
              temperature: item?.main?.temp?.toStringAsFixed(1) ?? '--',
              weatherMain: item?.weather?.first.main ?? 'No Data',
              weatherDescription:
                  item?.weather?.first.description ?? 'No Description',
              date: formatDate(item?.dtTxt),
              windSpeed: item?.wind?.speed?.toStringAsFixed(1) ?? '--',
              humidity: item?.main?.humidity?.toString() ?? '--',
            ),
          );
        },
      ),
    );
  }
}
