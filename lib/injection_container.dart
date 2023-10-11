import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:core_flutter_bloc/features/weather/init_weather.dart';
import 'package:core_flutter_bloc/core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features
  initWeather(sl);

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(
    () {
      final options = BaseOptions(
        baseUrl: 'https://api.open-meteo.com/v1',
      );

      return Dio(options);
    },
    instanceName: 'dioCommon',
  );
  sl.registerLazySingleton(
    () {
      final options = BaseOptions(
        baseUrl: 'https://geocoding-api.open-meteo.com/v1/',
      );

      return Dio(options);
    },
    instanceName: 'dioGeocoding',
  );
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
