import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:core_flutter_bloc/core/error/exceptions.dart';
import 'package:core_flutter_bloc/features/example/domain/entities/entities.dart';

abstract class ExampleDataSource {
  Future<Example?> getExample();
}

class ExampleDataSourceImpl implements ExampleDataSource {
  final Dio dio;

  const ExampleDataSourceImpl({required this.dio});

  @override
  Future<Example?> getExample() async {
    final response = Response(
      requestOptions: RequestOptions(),
      data: '{"id": "0"}',
    );

    await Future.delayed(const Duration(milliseconds: 300));

    if (response.statusCode == 200) {
      return response.data != null
          ? Example.fromJson(json.decode(response.data!))
          : null;
    } else {
      throw ExampleException();
    }
  }
}
