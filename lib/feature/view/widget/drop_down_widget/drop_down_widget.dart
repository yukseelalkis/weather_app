import 'package:flutter/material.dart';
import 'package:package_weather/feature/mixin/drop_down_mixin.dart';
import 'package:package_weather/feature/model/cities_model.dart';
import 'package:package_weather/feature/view/weather_view.dart';
import 'package:package_weather/product/global/theme_notifider.dart';
import 'package:package_weather/product/init/theme/project_color/color_items.dart';
import 'package:package_weather/product/utilitiy/app_style.dart/app_style.dart';
import 'package:package_weather/product/utilitiy/constants/padding/project_padding.dart';
import 'package:package_weather/product/init/language/project_items_string.dart';
import 'package:provider/provider.dart';

part '../../../part/drop_down_part_of.dart';

class CitiesDropdownWidget extends StatefulWidget {
  final Function(String) onCitySelected;
  const CitiesDropdownWidget({super.key, required this.onCitySelected});
  @override
  State<CitiesDropdownWidget> createState() => _CitiesDropdownWidgetState();
}

class _CitiesDropdownWidgetState extends State<CitiesDropdownWidget>
    with DropDownMixin {
  String? _selectedCity = ProjectStringItems.baseCity;

  void closeDropdown() {
    setState(() {
      isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Padding(
            padding: const  PagePadding.top4x(),
            child: _DropdownHeaderWidget(selectedCity: _selectedCity),
          ),
        ),
        if (isExpanded)
          _DropdownListWidget(
            cities: cities,
            onCitySelected: (selectedCity) {
              setState(() {
                _selectedCity = selectedCity;
              });
              widget.onCitySelected(selectedCity);
            },
            closeDropdown: closeDropdown,
          ),
      ],
    );
  }
}
