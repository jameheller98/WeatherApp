import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable()
class Temperature extends Equatable {
  @JsonKey(name: 'temperature_2m')
  final double temperature;

  const Temperature({
    required this.temperature,
  });

  @override
  List<Object> get props => [temperature];

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}
