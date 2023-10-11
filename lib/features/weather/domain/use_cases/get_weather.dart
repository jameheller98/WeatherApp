import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:core_flutter_bloc/core/error/failures.dart';
import 'package:core_flutter_bloc/core/use_cases/use_cases.dart';
import 'package:core_flutter_bloc/features/weather/domain/entities/entities.dart';
import 'package:core_flutter_bloc/features/weather/data/repositories/repositories.dart';

class GetWeather implements UseCase<Weather?, WeatherParams> {
  final WeatherRepository weatherRepository;

  const GetWeather(this.weatherRepository);

  @override
  Future<Either<Failure, Weather?>> call(WeatherParams params) async {
    return await weatherRepository.getWeather(params.location);
  }
}

class WeatherParams extends Equatable {
  final Location location;

  const WeatherParams(this.location);

  @override
  List<Object?> get props => [location];
}
