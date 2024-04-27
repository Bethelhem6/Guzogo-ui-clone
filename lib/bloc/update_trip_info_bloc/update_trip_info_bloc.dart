import 'package:bloc/bloc.dart';
import 'package:guzo_go_clone/constants/constants.dart';
import 'package:meta/meta.dart';

part 'update_trip_info_event.dart';
part 'update_trip_info_state.dart';

class UpdateTripInfoBloc
    extends Bloc<UpdateTripInfoEvent, UpdateTripInfoState> {
  UpdateTripInfoBloc() : super(UpdateTripInfoInitial()) {
    on<UpdateTripInfo>((event, emit) {
      if (event.source["city"] != null) {
        tripInfo["source"] = event.source;
      }
      if (event.destination["city"] != null) {
        tripInfo["destination"] = event.destination;
      }
      emit(UpdateTripInfoSuccess(tripInfo: tripInfo));
    });
    on<NavigateEvent>((event, emit) {
      selectedIndex = 2;
      emit(NavigateStateSuccess(selectedIndex: selectedIndex));
    });
  }
}
