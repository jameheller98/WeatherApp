import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:core_flutter_bloc/core/error/failures.dart';
import 'package:core_flutter_bloc/core/use_cases/use_cases.dart';
import 'package:core_flutter_bloc/features/weather/domain/entities/entities.dart';
import 'package:core_flutter_bloc/features/weather/data/repositories/repositories.dart';

class GetLocation implements UseCase<List<Location>, LocationParams> {
  final WeatherRepository weatherRepository;

  const GetLocation(this.weatherRepository);

  @override
  Future<Either<Failure, List<Location>>> call(LocationParams params) async {
    return await weatherRepository.getLocation(params.nameOrCode);
  }
}

class LocationParams extends Equatable {
  final String nameOrCode;

  const LocationParams(this.nameOrCode);

  @override
  List<Object?> get props => [nameOrCode];
}
