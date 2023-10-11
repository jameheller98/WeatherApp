import 'package:core_flutter_bloc/features/weather/domain/use_cases/get_weather.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core_flutter_bloc/features/weather/domain/use_cases/use_cases.dart';
import 'package:core_flutter_bloc/features/weather/domain/entities/entities.dart';

part 'weather_state.dart';
part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetLocation _getLocation;
  final GetWeather _getWeather;

  WeatherBloc({
    required GetLocation getLocation,
    required GetWeather getWeather,
  })  : _getLocation = getLocation,
        _getWeather = getWeather,
        super(const WeatherState()) {
    on<GetCurrentLocation>(onGetCurrentLocation);
    on<GetFirstCurrentLocation>(onGetFirstCurrentLocation);
    on<GetCurrentWeather>(onGetCurrentWeather);
  }

  void onGetCurrentLocation(
    GetCurrentLocation event,
    Emitter<WeatherState> emit,
  ) {
    add(GetCurrentWeather(event.currentLocation));

    emit(
      state.copyWith(
        currentLocation: event.currentLocation,
      ),
    );
  }

  Future<void> onGetFirstCurrentLocation(
    GetFirstCurrentLocation event,
    Emitter<WeatherState> emit,
  ) async {
    emit(
      state.copyWith(status: StatusFetchWeather.loading),
    );

    final result = await _getLocation.call(LocationParams(event.nameOrCode));

    result.fold(
      (l) => emit(
        state.copyWith(
            status: StatusFetchWeather.failure, currentLocation: null),
      ),
      (locations) {
        emit(
          state.copyWith(
            status: StatusFetchWeather.success,
            currentLocation: locations[0],
          ),
        );
        add(GetCurrentWeather(locations[0]));
      },
    );
  }

  Future<void> onGetCurrentWeather(
    GetCurrentWeather event,
    Emitter<WeatherState> emit,
  ) async {
    emit(
      state.copyWith(status: StatusFetchWeather.loading),
    );

    final result = await _getWeather.call(WeatherParams(event.location));

    result.fold(
      (l) => emit(
        state.copyWith(
            status: StatusFetchWeather.failure, currentWeather: null),
      ),
      (weather) {
        emit(
          state.copyWith(
            status: StatusFetchWeather.success,
            currentWeather: weather,
            timeUpdated: DateTime.now(),
          ),
        );
      },
    );
  }
}
