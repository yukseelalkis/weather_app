

class CitiesModel {
  String? status;
  List<Data>? data;

  CitiesModel({this.status, this.data});

  CitiesModel.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        data = (json['data'] as List<dynamic>?)
            ?.map((e) => Data.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

class Data {
  int? id;
  String? name;
  int? population;
  int? area;
  int? altitude;
  List<int>? areaCode;
  bool? isMetropolitan;
  Nuts? nuts;
  Coordinates? coordinates;
  Maps? maps;
  Name? region;
  List<District>? districts;

  Data({
    this.id,
    this.name,
    this.population,
    this.area,
    this.altitude,
    this.areaCode,
    this.isMetropolitan,
    this.nuts,
    this.coordinates,
    this.maps,
    this.region,
    this.districts,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        population = json['population'],
        area = json['area'],
        altitude = json['altitude'],
        areaCode = (json['areaCode'] as List<dynamic>?)?.cast<int>(),
        isMetropolitan = json['isMetropolitan'],
        nuts = json['nuts'] != null ? Nuts.fromJson(json['nuts']) : null,
        coordinates = json['coordinates'] != null
            ? Coordinates.fromJson(json['coordinates'])
            : null,
        maps = json['maps'] != null ? Maps.fromJson(json['maps']) : null,
        region = json['region'] != null ? Name.fromJson(json['region']) : null,
        districts = (json['districts'] as List<dynamic>?)
            ?.map((e) => District.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'population': population,
        'area': area,
        'altitude': altitude,
        'areaCode': areaCode,
        'isMetropolitan': isMetropolitan,
        'nuts': nuts?.toJson(),
        'coordinates': coordinates?.toJson(),
        'maps': maps?.toJson(),
        'region': region?.toJson(),
        'districts': districts?.map((e) => e.toJson()).toList(),
      };
}

class Nuts {
  Nuts1? nuts1;
  Nuts2? nuts2;
  String? nuts3;

  Nuts({this.nuts1, this.nuts2, this.nuts3});

  Nuts.fromJson(Map<String, dynamic> json)
      : nuts1 = json['nuts1'] != null ? Nuts1.fromJson(json['nuts1']) : null,
        nuts2 = json['nuts2'] != null ? Nuts2.fromJson(json['nuts2']) : null,
        nuts3 = json['nuts3'];

  Map<String, dynamic> toJson() => {
        'nuts1': nuts1?.toJson(),
        'nuts2': nuts2?.toJson(),
        'nuts3': nuts3,
      };
}

class Nuts1 {
  String? code;
  Name? name;

  Nuts1({this.code, this.name});

  Nuts1.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        name = json['name'] != null ? Name.fromJson(json['name']) : null;

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name?.toJson(),
      };
}

class Name {
  String? en;
  String? tr;

  Name({this.en, this.tr});

  Name.fromJson(Map<String, dynamic> json)
      : en = json['en'],
        tr = json['tr'];

  Map<String, dynamic> toJson() => {
        'en': en,
        'tr': tr,
      };
}

class Nuts2 {
  String? code;
  String? name;

  Nuts2({this.code, this.name});

  Nuts2.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
      };
}

class Coordinates {
  double? latitude;
  double? longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json)
      : latitude = (json['latitude'] as num?)?.toDouble(),
        longitude = (json['longitude'] as num?)?.toDouble();

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}

class Maps {
  String? googleMaps;
  String? openStreetMap;

  Maps({this.googleMaps, this.openStreetMap});

  Maps.fromJson(Map<String, dynamic> json)
      : googleMaps = json['googleMaps'],
        openStreetMap = json['openStreetMap'];

  Map<String, dynamic> toJson() => {
        'googleMaps': googleMaps,
        'openStreetMap': openStreetMap,
      };
}

class District {
  int? id;
  String? name;
  int? population;
  int? area;

  District({this.id, this.name, this.population, this.area});

  District.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        population = json['population'],
        area = json['area'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'population': population,
        'area': area,
      };
}
