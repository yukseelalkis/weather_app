class ForeCastModel {
  String? cod;
  int? message;
  int? cnt;
  List<ForecastItem>? list;
  City? city;

  ForeCastModel({this.cod, this.message, this.cnt, this.list, this.city});

  factory ForeCastModel.fromJson(Map<String, dynamic> json) {
    return ForeCastModel(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: json['list'] != null
          ? (json['list'] as List).map((e) => ForecastItem.fromJson(e)).toList()
          : null,
      city: json['city'] != null ? City.fromJson(json['city']) : null,
    );
  }
}

class ForecastItem {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Rain? rain;
  Sys? sys;
  String? dtTxt;

  ForecastItem({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      dt: json['dt'],
      main: json['main'] != null ? Main.fromJson(json['main']) : null,
      weather: json['weather'] != null
          ? (json['weather'] as List).map((e) => Weather.fromJson(e)).toList()
          : null,
      clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
      wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
      visibility: json['visibility'],
      pop: json['pop']?.toDouble(),
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
      dtTxt: json['dt_txt'],
    );
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp']?.toDouble(),
      feelsLike: json['feels_like']?.toDouble(),
      tempMin: json['temp_min']?.toDouble(),
      tempMax: json['temp_max']?.toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all']);
  }
}

class Wind {
  double? speed;
  int? deg;

  Wind({this.speed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed']?.toDouble(),
      deg: json['deg'],
    );
  }
}

class Rain {
  double? d3h;

  Rain({this.d3h});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(d3h: json['3h']?.toDouble());
  }
}

class Sys {
  String? pod;

  Sys({this.pod});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(pod: json['pod']);
  }
}

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;

  City({this.id, this.name, this.coord, this.country});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
      country: json['country'],
    );
  }
}

class Coord {
  double? lat;
  double? lon;

  Coord({this.lat, this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat']?.toDouble(),
      lon: json['lon']?.toDouble(),
    );
  }
}
