import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:core_flutter_bloc/core/use_cases/use_cases.dart';
import 'package:core_flutter_bloc/features/example/domain/entities/entities.dart';
import 'package:core_flutter_bloc/features/example/domain/use_cases/use_cases.dart';

part 'example_event.dart';
part 'example_state.dart';

enum Status { idle, loading, success, failure }

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  final GetExample getExample;

  ExampleBloc({
    required this.getExample,
  }) : super(
          const ExampleState(),
        ) {
    on<HandleExample>(onGetExample);
  }

  Future<void> onGetExample(
    HandleExample event,
    Emitter<ExampleState> emit,
  ) async {
    emit(
      state.copyWith(status: Status.loading),
    );

    try {
      await getExample.call(NoParams());

      emit(
        state.copyWith(status: Status.success),
      );
    } catch (_) {
      emit(
        state.copyWith(status: Status.failure),
      );
    }
  }
}
