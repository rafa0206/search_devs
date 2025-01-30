import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_devs/blocs/repositories_events.dart';
import 'package:search_devs/blocs/repositories_states.dart';
import 'package:search_devs/data/api/repositories_api.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  final RepositoriesApi _repositoriesRepository;

  RepositoriesBloc(this._repositoriesRepository)
      : super(RepositoriesLoadingState()) {
    on<SearchRepositoriesEvent>((event, emit) async {
      emit(RepositoriesLoadingState());
      try {
        final repositories =
            await _repositoriesRepository.getRepositoriesByUser(event.query, type: event.type, sort: event.sort, direction: event.direction);
        emit(RepositoriesLoadedState(repositories));
      } catch (e) {
        emit(RepositoriesErrorState(e.toString()));
      }
    });
  }
}
