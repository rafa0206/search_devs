import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_devs/blocs/dev_bloc.dart';
import 'package:search_devs/blocs/dev_events.dart';
import 'package:search_devs/blocs/repositories_bloc.dart';
import 'package:search_devs/blocs/repositories_events.dart';
import 'package:search_devs/ui/components/filter_button.dart';
import 'package:search_devs/ui/components/filter_dialog.dart';
import 'package:search_devs/ui/components/search_button.dart';
import 'package:search_devs/ui/components/search_form.dart';
import 'package:search_devs/ui/components/title_search_devs.dart';
import 'package:search_devs/ui/responsive_layout/responsive_layout.dart';
import 'package:search_devs/utils/constants/theme.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _searchController = TextEditingController();

  String? _selectType;

  String? _selectSort;

  String? _selectDirection;

  final List<String> _types = ['all', 'owner', 'member'];

  final List<String> _sorts = ['created', 'updated', 'pushed', 'full_name'];

  final List<String> _directions = [
    'asc',
    'desc',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainWhite,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ResponsiveLayout.isPhone(context)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TitleSearchDevs(isDevView: false),
                      const SizedBox(
                        height: 32,
                      ),
                      SearchForm(
                        isDevView: false,
                        controller: _searchController,
                        selectType: _selectType,
                        selectSort: _selectSort,
                        selectDirection: _selectDirection,
                        types: _types,
                        sorts: _sorts,
                        directions: _directions,
                      ),
                      const SizedBox(
                        height: 76,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SearchButton(
                            onTap: () {
                              final query = _searchController.text;
                              if (query.isNotEmpty) {
                                BlocProvider.of<DevBloc>(context)
                                    .add(SearchDevEvent(query));
                                BlocProvider.of<RepositoriesBloc>(context).add(
                                  SearchRepositoriesEvent(
                                    query: query,
                                    type: _selectType,
                                    sort: _selectSort,
                                    direction: _selectDirection,
                                  ),
                                );
                              }
                              Modular.to.navigate('/profile');
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FilterButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxHeight: 500.0),
                                    child: StatefulBuilder(
                                      builder: (context, setState) {
                                        return FilterDialog(
                                          (value) {
                                            setState(() {
                                              _selectType = value;
                                            });
                                          },
                                          (value) {
                                            setState(() {
                                              _selectSort = value;
                                            });
                                          },
                                          (value) {
                                            setState(() {
                                              _selectDirection = value;
                                            });
                                          },
                                          () {
                                            _selectType = null;
                                            _selectSort = null;
                                            _selectDirection = null;
                                            Navigator.of(context)
                                                .pop(); // Fecha o diálogo
                                          },
                                          _selectType,
                                          _selectSort,
                                          _selectDirection,
                                          _types,
                                          _sorts,
                                          _directions,
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TitleSearchDevs(isDevView: false),
                      const SizedBox(
                        height: 32,
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 592),
                                child: SearchForm(
                                  controller: _searchController,
                                  isDevView: false,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 32,
                            ),
                            SearchButton(
                              onTap: () {
                                final query = _searchController.text;
                                if (query.isNotEmpty) {
                                  BlocProvider.of<DevBloc>(context)
                                      .add(SearchDevEvent(query));
                                  BlocProvider.of<RepositoriesBloc>(context).add(
                                    SearchRepositoriesEvent(
                                      query: query,
                                      type: _selectType,
                                      sort: _selectSort,
                                      direction: _selectDirection,
                                    ),
                                  );
                                }
                                Modular.to.navigate('/profile');
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FilterButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ConstrainedBox(
                                      constraints:
                                      const BoxConstraints(maxHeight: 500.0),
                                      child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return FilterDialog(
                                                (value) {
                                              setState(() {
                                                _selectType = value;
                                              });
                                            },
                                                (value) {
                                              setState(() {
                                                _selectSort = value;
                                              });
                                            },
                                                (value) {
                                              setState(() {
                                                _selectDirection = value;
                                              });
                                            },
                                                () {
                                              _selectType = null;
                                              _selectSort = null;
                                              _selectDirection = null;
                                              Navigator.of(context)
                                                  .pop(); // Fecha o diálogo
                                            },
                                            _selectType,
                                            _selectSort,
                                            _selectDirection,
                                            _types,
                                            _sorts,
                                            _directions,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
