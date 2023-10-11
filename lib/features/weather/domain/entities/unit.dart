import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unit.g.dart';

@JsonSerializable()
class Unit extends Equatable {
  @JsonKey(name: 'temperature_2m')
  final String unit;

  const Unit({
    required this.unit,
  });

  @override
  List<Object> get props => [unit];

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
