part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

final class GetCurrentLocation extends WeatherEvent {
  final Location currentLocation;

  const GetCurrentLocation(this.currentLocation);

  @override
  List<Object> get props => [currentLocation];
}

final class GetFirstCurrentLocation extends WeatherEvent {
  final String nameOrCode;

  const GetFirstCurrentLocation(this.nameOrCode);

  @override
  List<Object> get props => [nameOrCode];
}

final class GetCurrentWeather extends WeatherEvent {
  final Location location;

  const GetCurrentWeather(this.location);

  @override
  List<Object> get props => [location];
}
