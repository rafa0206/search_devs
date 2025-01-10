import 'package:equatable/equatable.dart';

abstract class DevEvent extends Equatable {
  const DevEvent();
}

class SearchDevEvent extends DevEvent {
  final String query;
  const SearchDevEvent(this.query);

  @override
  List<Object?> get props => [];
}