part of 'list_location_bloc.dart';

enum StatusLocation { idle, loading, success, failure }

class ListLocationState extends Equatable {
  final List<Location> locations;
  final StatusLocation status;

  const ListLocationState({
    this.locations = const [],
    this.status = StatusLocation.idle,
  });

  ListLocationState copyWith({
    List<Location>? locations,
    StatusLocation? status,
  }) {
    return ListLocationState(
      locations: locations ?? this.locations,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [locations, status];
}
