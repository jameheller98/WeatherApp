import 'package:core_flutter_bloc/features/example/data/data_sources/data_sources.dart';
import 'package:core_flutter_bloc/features/example/data/repositories/repositories.dart';
import 'package:core_flutter_bloc/features/example/domain/use_cases/use_cases.dart';
import 'package:core_flutter_bloc/features/example/presentation/blocs/blocs.dart';
import 'package:get_it/get_it.dart';

Future<void> initAuth(GetIt sl) async {
  // Blocs
  sl.registerFactory(
    () => ExampleBloc(
      getExample: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetExample(sl()));

  // Repository
  sl.registerLazySingleton<ExampleRepository>(
    () => ExampleRepositoryImpl(
      exampleDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ExampleDataSource>(
    () => ExampleDataSourceImpl(
      dio: sl(),
    ),
  );
}
