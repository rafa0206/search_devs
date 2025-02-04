import 'package:flutter/material.dart';
import 'package:search_devs/ui/components/custom_dropdown.dart';

class FilterDialog extends StatelessWidget {
  final void Function(dynamic) _onChangeType;
  final void Function(dynamic) _onChangeSort;
  final void Function(dynamic) _onChangeDirections;
  final VoidCallback _onCancelFilter;
  final String? _selectType;
  final String? _selectSort;
  final String? _selectDirection;
  final List<String>? _types;
  final List<String>? _sorts;
  final List<String>? _directions;
  final String? variavelTeste;
  final void Function()? incrementValue;

  const FilterDialog(
      this._onChangeType,
      this._onChangeSort,
      this._onChangeDirections,
      this._onCancelFilter,
      this._selectType,
      this._selectSort,
      this._selectDirection,
      this._types,
      this._sorts,
      this._directions,

      {super.key, this.variavelTeste, this.incrementValue,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(variavelTeste ?? 'variavel teste'),
      scrollable: true,
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        children: [
          CustomDropdown('Type', _types ?? [], _onChangeType, _selectType),
          CustomDropdown('Sort', _sorts ?? [], _onChangeSort, _selectSort),
          CustomDropdown(
              'Direction', _directions ?? [], _onChangeDirections, _selectDirection),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _onCancelFilter,
          child: const Text(
            'Clear Filter',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
              ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Apply Filter',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
