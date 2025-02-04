import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_devs/blocs/filter_events.dart';
import 'package:search_devs/blocs/filter_states.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState()){
    on<FilterUpdateEvent>((event, emit) {
      emit(FilterState(selectType: event.selectType, selectSort: event.selectSort, selectDirection: event.selectDirection));
    });
  }
}