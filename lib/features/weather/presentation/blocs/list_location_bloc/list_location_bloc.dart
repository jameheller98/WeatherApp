import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:core_flutter_bloc/features/weather/domain/entities/entities.dart';
import 'package:core_flutter_bloc/features/weather/domain/use_cases/use_cases.dart';

part 'list_location_event.dart';
part 'list_location_state.dart';

EventTransformer<Event> debounce<Event>({
  Duration duration = const Duration(milliseconds: 750),
}) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}

class ListLocationBloc extends Bloc<ListLocationEvent, ListLocationState> {
  final GetLocation _getLocation;

  ListLocationBloc({
    required GetLocation getLocation,
  })  : _getLocation = getLocation,
        super(
          const ListLocationState(),
        ) {
    on<ListLocationFetched>(onFetchListLocation, transformer: debounce());
    on<ListLocationReset>(onResetListLocation);
  }

  Future<void> onFetchListLocation(
    ListLocationFetched event,
    Emitter<ListLocationState> emit,
  ) async {
    emit(
      state.copyWith(status: StatusLocation.loading, locations: []),
    );

    final result = await _getLocation.call(LocationParams(event.nameOrCode));

    result.fold(
      (l) => emit(
        state.copyWith(status: StatusLocation.failure, locations: []),
      ),
      (locations) => emit(
        state.copyWith(status: StatusLocation.success, locations: locations),
      ),
    );
  }

  void onResetListLocation(
    ListLocationReset event,
    Emitter<ListLocationState> emit,
  ) {
    emit(const ListLocationState());
  }
}
