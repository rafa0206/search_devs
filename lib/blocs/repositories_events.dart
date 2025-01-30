import 'package:equatable/equatable.dart';

abstract class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();
}

class SearchRepositoriesEvent extends RepositoriesEvent {
  final String? query;
  final String? type;
  final String? sort;
  final String? direction;

  const SearchRepositoriesEvent(
      {this.query, this.type, this.sort, this.direction});

  @override
  List<Object?> get props => [];
}