import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:core_flutter_bloc/features/weather/presentation/blocs/blocs.dart';
import 'package:core_flutter_bloc/features/weather/presentation/widgets/search_field.dart';
import 'package:core_flutter_bloc/features/weather/presentation/widgets/search_list.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search location',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.pop();
                    context
                        .read<ListLocationBloc>()
                        .add(const ListLocationReset());
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SearchField(),
                  SizedBox(height: 10),
                  Expanded(
                    child: SearchList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
