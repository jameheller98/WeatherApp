import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends Equatable {
  final int id;
  final String name;
  @JsonKey(name: 'country_code')
  final String countryCode;
  final double latitude;
  final double longitude;

  const Location({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object> get props => [id, name, countryCode, latitude, longitude];

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
