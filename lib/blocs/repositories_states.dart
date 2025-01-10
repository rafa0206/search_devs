import 'package:equatable/equatable.dart';
import 'package:search_devs/domain/entities/repository.dart';

abstract class RepositoriesState extends Equatable {}

class RepositoriesLoadingState extends RepositoriesState {

  @override
  List<Object?> get props => [];
}

class RepositoriesLoadedState extends RepositoriesState {
  RepositoriesLoadedState(this.repositories);
  final List<Repository> repositories;

  @override
  List<Object?> get props => [repositories];
}

class RepositoriesErrorState extends RepositoriesState {
  RepositoriesErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}