import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_devs/blocs/dev_bloc.dart';
import 'package:search_devs/blocs/dev_events.dart';
import 'package:search_devs/blocs/repositories_bloc.dart';
import 'package:search_devs/blocs/repositories_events.dart';
import 'package:search_devs/ui/responsive_layout/responsive_layout.dart';
import 'package:search_devs/utils/constants/theme.dart';

//ignore: must_be_immutable
class SearchForm extends StatelessWidget {
  final bool isDevView;
  final TextEditingController controller;
  String? selectType;
  String? selectSort;
  String? selectDirection;
  List<String>? types;
  List<String>? sorts;
  List<String>? directions;

  SearchForm({
    required this.isDevView,
    required this.controller,
    this.selectType,
    this.selectSort,
    this.selectDirection,
    this.types,
    this.sorts,
    this.directions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            textInputAction: TextInputAction.done,
      onEditingComplete: !ResponsiveLayout.isPhone(context) ? () {
        if (isDevView) {
          final query = controller.text;
          if (query.isNotEmpty) {
            BlocProvider.of<DevBloc>(context).add(SearchDevEvent(query));
            BlocProvider.of<RepositoriesBloc>(context).add(
                SearchRepositoriesEvent(
                    query: query,
                    type: selectType,
                    sort: selectSort,
                    direction: selectDirection));
          }
          FocusScope.of(context).unfocus();
          controller.clear();
        } else {
          null;
        }
      } : (){},
            controller: controller,
            cursorColor: AppTheme.mainMediumGrey,
            decoration: InputDecoration(
              disabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme.mainMediumGrey, width: 1),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppTheme.mainPurple, width: 1),
                  borderRadius: BorderRadius.circular(4)),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppTheme.mainMediumGrey, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color:  AppTheme.mainMediumGrey,
                    width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              hintText: 'Search',
              hintStyle: const TextStyle(color: AppTheme.mainMediumGrey),
              prefixIcon: const Icon(Icons.search,
                  size: 24, color: AppTheme.mainMediumGrey),
            ),
          );
  }
}
