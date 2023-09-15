import 'package:fpdart/fpdart.dart';

import 'package:core_flutter_bloc/core/error/failures.dart';
import 'package:core_flutter_bloc/core/use_cases/use_cases.dart';
import 'package:core_flutter_bloc/features/example/domain/entities/entities.dart';
import 'package:core_flutter_bloc/features/example/data/repositories/repositories.dart';

class GetExample implements UseCase<Example?, NoParams> {
  final ExampleRepository exampleRepository;

  const GetExample(this.exampleRepository);

  @override
  Future<Either<Failure, Example?>> call(NoParams params) async {
    return await exampleRepository.getExample();
  }
}
