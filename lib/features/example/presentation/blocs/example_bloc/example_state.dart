part of 'example_bloc.dart';

class ExampleState extends Equatable {
  final Example? example;
  final Status status;

  const ExampleState({
    this.example,
    this.status = Status.idle,
  });

  ExampleState copyWith({
    Example? example,
    Status? status,
  }) {
    return ExampleState(
      example: example ?? this.example,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [example, status];
}
