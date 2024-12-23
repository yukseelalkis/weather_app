import 'package:flutter/material.dart';
import 'package:package_weather/product/utitility/constant/app_style.dart/app_style.dart';
import 'package:package_weather/product/utitility/constant/padding/project_padding.dart';
import 'package:package_weather/product/utitility/constant/project_color/color_items.dart';
import 'package:package_weather/product/utitility/constant/widget/appbar_logo_widget.dart';
import 'package:package_weather/feature/alert_dialog/view/show_dialog.dart';
import 'package:package_weather/feature/weather_card/view/weather_card_widget.dart';
import 'package:package_weather/feature/forecast_widget.dart/view/forecast_widget.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final String _logoName = 'logo_weather';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // BUNU BELKIDE PRIVATE SEKLINDE YAZABILIRIZ
        title: LogoAppbarWidget(
          name: _logoName,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                final selectedCity = await showDialog(
                  context: context,
                  builder: (context) => const ShowDialogWidget(),
                );
                if (selectedCity != null) {
                  ("Seçilen şehir: ${selectedCity.name}");
                }
              },
              icon: const Icon(Icons.search_outlined)),
        ],
      ),
      body: Container(
        decoration: AppStyle.gradientBoxDecoration,
        child: Center(
          child: Column(
            children: [
              // SEHIR ISMI SERVISTEN DONECEK
              Padding(
                padding: const PagePadding.all(),
                // bloc ile haberlesme yapacazzz
                child: Text('Bodrum',
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              const Padding(
                padding: PagePadding.all(),
                child: WeatherCardWidget(),
              ),
              const Divider(
                color: ProjectItemColors.blackColor,
                thickness: AppStyle.thihknes,
              ),
              const Expanded(child: ForeCastWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
