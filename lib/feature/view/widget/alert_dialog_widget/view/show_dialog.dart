import 'package:flutter/material.dart';
import 'package:package_weather/feature/model/cities_model.dart';
import 'package:package_weather/product/service/weather_service.dart';
import 'package:package_weather/product/init/language/project_items_string.dart';
import 'package:package_weather/product/service/dio_network_manager.dart';
import 'package:package_weather/product/utilitiy/enum/dio_manager_enum.dart';
import 'package:package_weather/product/utilitiy/enum/network_manager_enum.dart';

class ShowDialogWidget extends StatefulWidget {
  const ShowDialogWidget({super.key});

  @override
  State<ShowDialogWidget> createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialogWidget> {
  late final IService service;
  CitiesModel? _cities;

  @override
  void initState() {
    super.initState();
    final dio = DioManager().getService(DioManagerPath.turkey.name);
    service = ServiceWeather(dio);
    fetchCitiesData();
  }

  Future<void> fetchCitiesData() async {
    final item = await service.fetchData(
        WeatherServicePath.cities.path, (json) => CitiesModel.fromJson(json));
    setState(() {
      _cities = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(ProjectStringItems.alertTitle),
      content: _cities == null
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _cities?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final city = _cities!.data![index];
                  return ListTile(
                    title: Text(city.name ?? ""),
                    onTap: () {
                      Navigator.pop(context, city);
                      ("Seçilen şehir: ${city.name}");
                    },
                  );
                },
              ),
            ),
    );
  }
}
