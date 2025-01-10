import 'package:equatable/equatable.dart';
import 'package:search_devs/domain/entities/dev.dart';

abstract class DevState extends Equatable {}

class DevLoadingState extends DevState {

  @override
  List<Object?> get props => [];
}

class DevLoadedState extends DevState {
  DevLoadedState(this.dev);
  final Dev dev;

  @override
  List<Object?> get props => [dev];
}

class DevErrorState extends DevState {
  DevErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}