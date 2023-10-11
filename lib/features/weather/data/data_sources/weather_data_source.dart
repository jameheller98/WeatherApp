import 'package:dio/dio.dart';

import 'package:core_flutter_bloc/core/error/exceptions.dart';
import 'package:core_flutter_bloc/features/weather/domain/entities/entities.dart';

abstract class WeatherDataSource {
  Future<Weather?> getWeather(Location location);
}

class WeatherDataSourceImpl implements WeatherDataSource {
  final Dio dio;

  const WeatherDataSourceImpl({required this.dio});

  @override
  Future<Weather?> getWeather(Location location) async {
    final response = await dio.get(
      '/forecast',
      queryParameters: {
        'latitude': location.latitude,
        'longitude': location.longitude,
        'current': ['temperature_2m'],
        'daily': ['weathercode', 'temperature_2m_max', 'temperature_2m_min'],
        'timezone': 'Asia/Singapore',
        'forecast_days': 1,
      },
    );

    if (response.statusCode == 200) {
      if (response.data == null) return null;

      return Weather.fromJson(response.data);
    } else {
      throw WeatherException();
    }
  }
}
