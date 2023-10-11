import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily.g.dart';

@JsonSerializable()
class Daily extends Equatable {
  @JsonKey(name: 'weathercode')
  final List<int> weatherCode;
  @JsonKey(name: 'temperature_2m_max')
  final List<double> temperatureMax;
  @JsonKey(name: 'temperature_2m_min')
  final List<double> temperatureMin;

  const Daily({
    required this.weatherCode,
    required this.temperatureMax,
    required this.temperatureMin,
  });

  @override
  List<Object> get props => [weatherCode];

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}
