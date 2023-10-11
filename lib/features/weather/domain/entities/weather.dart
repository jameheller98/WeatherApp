import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:core_flutter_bloc/features/weather/domain/entities/daily.dart';
import 'package:core_flutter_bloc/features/weather/domain/entities/temperature.dart';
import 'package:core_flutter_bloc/features/weather/domain/entities/unit.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  @JsonKey(name: 'current_units')
  final Unit unit;
  @JsonKey(name: 'current')
  final Temperature temperature;
  @JsonKey(name: 'daily')
  final Daily daily;

  const Weather({
    required this.unit,
    required this.temperature,
    required this.daily,
  });

  @override
  List<Object> get props => [unit, temperature, daily];

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
