// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      weatherCode:
          (json['weathercode'] as List<dynamic>).map((e) => e as int).toList(),
      temperatureMax: (json['temperature_2m_max'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      temperatureMin: (json['temperature_2m_min'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'weathercode': instance.weatherCode,
      'temperature_2m_max': instance.temperatureMax,
      'temperature_2m_min': instance.temperatureMin,
    };
