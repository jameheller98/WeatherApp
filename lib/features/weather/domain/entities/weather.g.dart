// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      unit: Unit.fromJson(json['current_units'] as Map<String, dynamic>),
      temperature:
          Temperature.fromJson(json['current'] as Map<String, dynamic>),
      daily: Daily.fromJson(json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'current_units': instance.unit,
      'current': instance.temperature,
      'daily': instance.daily,
    };
