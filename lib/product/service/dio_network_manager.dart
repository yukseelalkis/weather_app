// import 'package:dio/dio.dart';

// class DioManager {
//   DioManager._() {
//     _dio =
//         Dio(BaseOptions(baseUrl: 'https://api.openweathermap.org/data/2.5/'));
//   }
//   late final Dio _dio;
//   static DioManager instance = DioManager._();
//   Dio get service => _dio;
// }

// //https://turkiyeapi.dev/api/v1/

import 'package:dio/dio.dart';

class DioManager {
  DioManager._internal();

  static final DioManager _instance = DioManager._internal();

  factory DioManager() => _instance;

  final Map<String, Dio> _dioInstances = {
    'weather':
        Dio(BaseOptions(baseUrl: 'https://api.openweathermap.org/data/2.5/')),
    'turkey': Dio(BaseOptions(baseUrl: 'https://turkiyeapi.dev/api/v1/')),
  };

  Dio getService(String key) {
    if (!_dioInstances.containsKey(key)) {
      throw Exception('No Dio instance found for the given key: $key');
    }
    return _dioInstances[key]!;
  }
}
