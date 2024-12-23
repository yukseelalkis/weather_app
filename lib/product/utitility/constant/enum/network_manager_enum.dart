enum WeatherServicePath {
  // bunlari parcalamamiz gerecek!
  weather('weather?q=Bodrum&appid=6d6172a1f902294241a3720afd511079'),
  forecast(
      'forecast?q=bodrum&units=metric&appid=6d6172a1f902294241a3720afd511079'),

  cities('provinces?');

  final String path;
  const WeatherServicePath(this.path);

  /// Enum değerine karşılık gelen path'i döner
  String get value => path;
}
