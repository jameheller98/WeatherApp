import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:core_flutter_bloc/features/weather/presentation/blocs/blocs.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return BlocBuilder<ListLocationBloc, ListLocationState>(
      builder: (context, state) {
        return state.status == StatusLocation.loading
            ? Container(
                padding: const EdgeInsets.only(bottom: 300),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : state.status == StatusLocation.success &&
                    state.locations.isNotEmpty
                ? ListView(
                    padding: EdgeInsets.only(bottom: bottom),
                    children: [
                      for (int i = 0; i < state.locations.length; i++)
                        ListTile(
                          onTap: () {
                            context.pop();
                            context
                                .read<ListLocationBloc>()
                                .add(const ListLocationReset());
                            context.read<WeatherBloc>().add(
                                  GetCurrentLocation(
                                    state.locations[i],
                                  ),
                                );
                          },
                          leading: CountryFlag.fromCountryCode(
                            state.locations[i].countryCode,
                            height: 20,
                            width: 30,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(state.locations[i].name),
                          ),
                        ),
                    ],
                  )
                : state.status == StatusLocation.failure ||
                        (state.locations.isEmpty &&
                            state.status == StatusLocation.success)
                    ? Container(
                        padding: const EdgeInsets.only(top: 200),
                        child: Text(
                          'No location available!',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
      },
    );
  }
}
