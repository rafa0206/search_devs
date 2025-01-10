import 'package:equatable/equatable.dart';

abstract class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();
}

class LoadRepositoriesEvent extends RepositoriesEvent {

  @override
  List<Object?> get props => [];
}