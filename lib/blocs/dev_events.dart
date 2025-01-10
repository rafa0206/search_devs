import 'package:equatable/equatable.dart';

abstract class DevEvent extends Equatable {
  const DevEvent();
}

class LoadDevEvent extends DevEvent {

  @override
  List<Object?> get props => [];
}