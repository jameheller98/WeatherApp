import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

@JsonSerializable()
class Example extends Equatable {
  final String id;

  const Example({required this.id});

  @override
  List<Object> get props => [id];

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleToJson(this);
}
