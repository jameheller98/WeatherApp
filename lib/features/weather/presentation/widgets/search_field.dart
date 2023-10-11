import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core_flutter_bloc/features/weather/presentation/blocs/blocs.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _searchControl = TextEditingController();

  void handleChange(String value) {
    context.read<ListLocationBloc>().add(const ListLocationReset());
    context.read<ListLocationBloc>().add(ListLocationFetched(value));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchControl,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        labelStyle: TextStyle(
          fontSize: 14,
        ),
        labelText: 'Location',
        alignLabelWithHint: true,
        hintText: ' Input name or code location',
      ),
      style: const TextStyle(
        fontSize: 14,
      ),
      onChanged: handleChange,
    );
  }
}
