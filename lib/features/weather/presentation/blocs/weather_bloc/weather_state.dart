part of 'weather_bloc.dart';

enum StatusFetchWeather { idle, loading, success, failure }

class WeatherState extends Equatable {
  final Location? currentLocation;
  final StatusFetchWeather status;
  final Weather? currentWeather;
  final DateTime? timeUpdated;

  const WeatherState({
    this.currentLocation,
    this.currentWeather,
    this.status = StatusFetchWeather.idle,
    this.timeUpdated,
  });

  WeatherState copyWith({
    Location? currentLocation,
    StatusFetchWeather? status,
    Weather? currentWeather,
    DateTime? timeUpdated,
  }) {
    return WeatherState(
      currentLocation: currentLocation ?? this.currentLocation,
      status: status ?? this.status,
      currentWeather: currentWeather ?? this.currentWeather,
      timeUpdated: timeUpdated ?? this.timeUpdated,
    );
  }

  @override
  List<Object?> get props =>
      [currentLocation, status, currentWeather, timeUpdated];
}
