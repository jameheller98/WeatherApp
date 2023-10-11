import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:core_flutter_bloc/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
