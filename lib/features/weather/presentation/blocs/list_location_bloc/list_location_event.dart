part of 'list_location_bloc.dart';

sealed class ListLocationEvent extends Equatable {
  const ListLocationEvent();

  @override
  List<Object> get props => [];
}

final class ListLocationFetched extends ListLocationEvent {
  final String nameOrCode;

  const ListLocationFetched(this.nameOrCode);

  @override
  List<Object> get props => [nameOrCode];
}

final class ListLocationReset extends ListLocationEvent {
  const ListLocationReset();
}
