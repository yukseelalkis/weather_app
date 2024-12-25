import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:package_weather/feature/mixin/weather_view_mixin.dart';
import 'package:package_weather/feature/view/widget/drop_down_widget/view/drop_down_widget.dart';
import 'package:package_weather/product/global/theme_notifider.dart';
import 'package:package_weather/product/utilitiy/app_style.dart/app_style.dart';
import 'package:package_weather/product/utilitiy/constants/padding/project_padding.dart';
import 'package:package_weather/product/init/theme/project_color/color_items.dart';
import 'package:package_weather/feature/view/widget/appbar_logo_widget.dart';
import 'package:package_weather/feature/view/widget/weather_card_widget/view/weather_card_widget.dart';
import 'package:package_weather/feature/view/widget/forecast_widget.dart/view/forecast_widget.dart';
import 'package:provider/provider.dart';
// part
part '../part/weather_view_part_of.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView>
    with WeatherViewMixin, TickerProviderStateMixin {
  final String _logoName = 'logo_weather';
  static const String _lottieButton = 'assets/lottie/lottie_theme_change.json';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LogoAppbarWidget(
          name: _logoName,
        ),
        actions: const [
          ThemeToggleButton(lottiePath: _lottieButton),
        ],
      ),
      body: Container(
        decoration: AppStyle.getGradientBoxDecoration(!isLigth),
        child: Center(
          child: Column(
            children: [
              CitiesDropdownWidget(
                onCitySelected: updateSelectedCity,
              ),
              Padding(
                padding: const PagePadding.all(),
                child: Text(selectedCity,
                    style: Theme.of(context).textTheme.displayLarge),
              ),
              Padding(
                padding: const PagePadding.all(),
                child: WeatherCardWidget(
                  selectedCity: selectedCity,
                ),
              ),
              const Divider(
                color: ProjectItemColors.textColor,
                thickness: AppStyle.thihknes,
              ),
              Expanded(
                  child: ForeCastWidget(
                selectedCity: selectedCity,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

