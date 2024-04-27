part of 'update_trip_info_bloc.dart';

@immutable
sealed class UpdateTripInfoEvent {}

class UpdateTripInfo extends UpdateTripInfoEvent {
  final Map source;
  final Map destination;
  UpdateTripInfo({required this.source, required this.destination});
}

class NavigateEvent extends UpdateTripInfoEvent {
  NavigateEvent();
}
