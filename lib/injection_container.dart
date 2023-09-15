import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:core_flutter_bloc/core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
