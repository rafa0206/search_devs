class FilterState {
  final List<String>? types = ['all', 'owner', 'member'];
  final List<String>? sorts = ['created', 'updated', 'pushed', 'full_name'];
  final List<String>? directions = ['asc', 'desc'];
  final String? selectType;
  final String? selectSort;
  final String? selectDirection;

  FilterState({
    this.selectType,
    this.selectSort,
    this.selectDirection,
  });
}