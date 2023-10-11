import 'package:dio/dio.dart';

import 'package:core_flutter_bloc/core/error/exceptions.dart';
import 'package:core_flutter_bloc/features/weather/domain/entities/entities.dart';

abstract class GeocodingDataSource {
  Future<List<Location>> getLocation(String nameOrCode);
}

class GeocodingDataSourceImpl implements GeocodingDataSource {
  final Dio dio;

  const GeocodingDataSourceImpl({required this.dio});

  @override
  Future<List<Location>> getLocation(String nameOrCode) async {
    final response = await dio.get(
      '/search',
      queryParameters: {
        'name': nameOrCode,
      },
    );

    if (response.statusCode == 200) {
      if (response.data['results'] == null) return [];

      return (response.data['results'] as List)
          .map(
            (location) => Location.fromJson(location),
          )
          .toList();
    } else {
      throw GeocodingException();
    }
  }
}
