import 'package:equatable/equatable.dart';

abstract class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();
}

class SearchRepositoriesEvent extends RepositoriesEvent {
  final String query;
  const SearchRepositoriesEvent(this.query);

  @override
  List<Object?> get props => [];
}