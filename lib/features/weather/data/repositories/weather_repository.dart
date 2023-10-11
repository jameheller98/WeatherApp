import 'package:fpdart/fpdart.dart';

import 'package:core_flutter_bloc/core/error/exceptions.dart';
import 'package:core_flutter_bloc/core/error/failures.dart';
import 'package:core_flutter_bloc/core/network/network_info.dart';
import 'package:core_flutter_bloc/features/weather/data/data_sources/data_sources.dart';
import 'package:core_flutter_bloc/features/weather/domain/entities/entities.dart';

abstract class WeatherRepository {
  Future<Either<Failure, List<Location>>> getLocation(String nameOrCode);
  Future<Either<Failure, Weather?>> getWeather(Location location);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final GeocodingDataSource geocodingDataSource;
  final WeatherDataSource weatherDataSource;
  final NetworkInfo networkInfo;

  const WeatherRepositoryImpl({
    required this.geocodingDataSource,
    required this.weatherDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Location>>> getLocation(String nameOrCode) async {
    if (await networkInfo.isConnected) {
      try {
        final locations = await geocodingDataSource.getLocation(nameOrCode);

        return Right(locations);
      } on GeocodingException {
        return Left(GeocodingFailure());
      }
    } else {
      return Left(GeocodingFailure());
    }
  }

  @override
  Future<Either<Failure, Weather?>> getWeather(Location location) async {
    if (await networkInfo.isConnected) {
      try {
        final weather = await weatherDataSource.getWeather(location);
        print(weather);
        return Right(weather);
      } on WeatherException {
        return Left(WeatherFailure());
      }
    } else {
      return Left(WeatherFailure());
    }
  }
}
