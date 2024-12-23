import 'dart:io';
import 'package:dio/dio.dart';

// Generic Servis Interface
abstract class IService {
  final Dio dio;
  IService(this.dio);

  Future<T?> fetchData<T>(
      String path, T Function(Map<String, dynamic>) fromJson);
}

// Generic Servis Implementation
class ServiceWeather extends IService {
  ServiceWeather(super.dio);

  @override
  Future<T?> fetchData<T>(
      String path, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await dio.get(path);
      if (response.statusCode == HttpStatus.ok) {
        return fromJson(response.data); // JSON'u modele dönüştür
      }
    } catch (e) {
      ('Error fetching data: $e');
    }
    return null;
  }
}
