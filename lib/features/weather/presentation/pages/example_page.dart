import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core_flutter_bloc/features/weather/presentation/widgets/weather_display.dart';
import 'package:core_flutter_bloc/features/weather/presentation/widgets/search_bottom_sheet.dart';
import 'package:core_flutter_bloc/features/weather/presentation/blocs/blocs.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  void initState() {
    super.initState();
    context
        .read<WeatherBloc>()
        .add(const GetFirstCurrentLocation('Ho Chi Minh City'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => const SearchBottomSheet(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) => state.status == StatusFetchWeather.loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              )
            : state.status == StatusFetchWeather.failure
                ? Center(
                    child: Text(
                      'System is busy, please comback later!',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  )
                : const WeatherDisplay(),
      ),
    );
  }
}
