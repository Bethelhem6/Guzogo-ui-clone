part of 'update_trip_info_bloc.dart';

@immutable
sealed class UpdateTripInfoState {}

final class UpdateTripInfoInitial extends UpdateTripInfoState {}

final class UpdateTripInfoLoading extends UpdateTripInfoState {}

final class UpdateTripInfoSuccess extends UpdateTripInfoState {
  final Map tripInfo;
   UpdateTripInfoSuccess({required this.tripInfo});
}

final class UpdateTripInfoError extends UpdateTripInfoState {}
final class NavigateStateSuccess extends UpdateTripInfoState {
  final int selectedIndex;
   NavigateStateSuccess({required this.selectedIndex});
}
