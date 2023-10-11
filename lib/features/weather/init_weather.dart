import 'package:get_it/get_it.dart';

import 'package:core_flutter_bloc/features/weather/data/data_sources/data_sources.dart';
import 'package:core_flutter_bloc/features/weather/data/repositories/repositories.dart';
import 'package:core_flutter_bloc/features/weather/domain/use_cases/use_cases.dart';
import 'package:core_flutter_bloc/features/weather/presentation/blocs/blocs.dart';

Future<void> initWeather(GetIt sl) async {
  // Blocs
  sl.registerFactory(
    () => ListLocationBloc(
      getLocation: sl(),
    ),
  );
  sl.registerFactory(
    () => WeatherBloc(
      getLocation: sl(),
      getWeather: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetLocation(sl()));
  sl.registerLazySingleton(() => GetWeather(sl()));

  // Repository
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      geocodingDataSource: sl(),
      weatherDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GeocodingDataSource>(
    () => GeocodingDataSourceImpl(
      dio: sl.get(instanceName: 'dioGeocoding'),
    ),
  );
  sl.registerLazySingleton<WeatherDataSource>(
    () => WeatherDataSourceImpl(
      dio: sl.get(instanceName: 'dioCommon'),
    ),
  );
}
