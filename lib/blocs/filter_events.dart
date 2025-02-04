import 'package:equatable/equatable.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();
}

class FilterUpdateEvent extends FilterEvent {
  final String? selectType;
  final String? selectSort;
  final String? selectDirection;

  const FilterUpdateEvent({
    this.selectType,
    this.selectSort,
    this.selectDirection,
  });

  @override
  List<Object> get props => [];
}