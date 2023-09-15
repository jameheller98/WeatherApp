import 'package:fpdart/fpdart.dart';

import 'package:core_flutter_bloc/core/error/exceptions.dart';
import 'package:core_flutter_bloc/core/error/failures.dart';
import 'package:core_flutter_bloc/core/network/network_info.dart';
import 'package:core_flutter_bloc/features/example/data/data_sources/data_sources.dart';
import 'package:core_flutter_bloc/features/example/domain/entities/entities.dart';

abstract class ExampleRepository {
  Future<Either<Failure, Example?>> getExample();
}

class ExampleRepositoryImpl implements ExampleRepository {
  final ExampleDataSource exampleDataSource;
  final NetworkInfo networkInfo;

  const ExampleRepositoryImpl({
    required this.exampleDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Example?>> getExample() async {
    if (await networkInfo.isConnected) {
      try {
        final example = await exampleDataSource.getExample();

        return Right(example);
      } on ExampleException {
        return Left(ExampleFailure());
      }
    } else {
      try {
        final example = await exampleDataSource.getExample();

        return Right(example);
      } on ExampleException {
        return Left(ExampleFailure());
      }
    }
  }
}
