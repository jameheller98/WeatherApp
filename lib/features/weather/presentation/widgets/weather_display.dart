import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:core_flutter_bloc/features/weather/presentation/blocs/blocs.dart';
import 'package:core_flutter_bloc/core/utils/weather_helper.dart';

final dateFormat = DateFormat('HH:mm');

class WeatherDisplay extends StatelessWidget {
  const WeatherDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
        child: Column(
          children: [
            BlocSelector<WeatherBloc, WeatherState, String>(
              selector: (state) => state.currentLocation?.name ?? 'undefined',
              builder: (context, state) => Text(
                state,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              buildWhen: (previous, current) =>
                  previous.timeUpdated != current.timeUpdated ||
                  previous.currentLocation != current.currentLocation,
              builder: (context, state) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Updated at: ${state.timeUpdated != null ? dateFormat.format(state.timeUpdated!) : ''}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<WeatherBloc>().add(
                            GetCurrentWeather(state.currentLocation!),
                          );
                    },
                    icon: const Icon(Icons.refresh),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherBloc, WeatherState>(
              buildWhen: (previous, current) =>
                  previous.currentWeather != current.currentWeather,
              builder: (context, state) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    getConditionByWeatherCode(
                      state.currentWeather?.daily.weatherCode[0] ?? -1,
                    ).toEmoji,
                    style: const TextStyle(fontSize: 100),
                  ),
                  Column(
                    children: [
                      Text(
                        '${state.currentWeather?.temperature.temperature.toStringAsFixed(0)}${state.currentWeather?.unit.unit}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '🔥${state.currentWeather?.daily.temperatureMax[0].toStringAsFixed(0)}${state.currentWeather?.unit.unit}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            '❄${state.currentWeather?.daily.temperatureMin[0].toStringAsFixed(0)}${state.currentWeather?.unit.unit}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on WeatherCondition {
  String get toEmoji {
    switch (this) {
      case WeatherCondition.clear:
        return '☀️';
      case WeatherCondition.rainy:
        return '🌧️';
      case WeatherCondition.cloudy:
        return '☁️';
      case WeatherCondition.snowy:
        return '🌨️';
      case WeatherCondition.unknown:
        return '❓';
    }
  }
}
