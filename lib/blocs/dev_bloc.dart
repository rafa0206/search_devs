import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_devs/blocs/dev_events.dart';
import 'package:search_devs/blocs/dev_states.dart';
import 'package:search_devs/data/api/dev_api.dart';

class DevBloc extends Bloc<DevEvent, DevState> {
  final DevApi _devRepository;

  DevBloc(this._devRepository) : super(DevLoadingState()) {
    on<SearchDevEvent>((event, emit) async {
      emit(DevLoadingState());
      try {
        final dev = await _devRepository.getDev(event.query);
        emit(DevLoadedState(dev));
      } catch (e) {
        emit(DevErrorState(e.toString()));
      }
    });
  }

}
