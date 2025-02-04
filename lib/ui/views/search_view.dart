import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_devs/blocs/dev_bloc.dart';
import 'package:search_devs/blocs/dev_events.dart';
import 'package:search_devs/blocs/filter_bloc.dart';
import 'package:search_devs/blocs/filter_events.dart';
import 'package:search_devs/blocs/filter_states.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainWhite,
      body: BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
        return Center(
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
                        selectType: state.selectType,
                        selectSort: state.selectSort,
                        selectDirection: state.selectDirection,
                        types: state.types,
                        sorts: state.sorts,
                        directions: state.directions,
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
                                    type: state.selectType,
                                    sort: state.selectSort,
                                    direction: state.selectDirection,
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
                                    child: BlocBuilder<FilterBloc, FilterState>(
                                      builder: (context, state) {
                                        return FilterDialog((value) {
                                          BlocProvider.of<FilterBloc>(context)
                                              .add(FilterUpdateEvent(
                                                  selectType: value,
                                                  selectSort: state.selectSort,
                                                  selectDirection:
                                                      state.selectDirection));
                                        }, (value) {
                                          BlocProvider.of<FilterBloc>(context)
                                              .add(FilterUpdateEvent(
                                                  selectType: state.selectType,
                                                  selectSort: value,
                                                  selectDirection:
                                                      state.selectDirection));
                                        }, (value) {
                                          BlocProvider.of<FilterBloc>(context)
                                              .add(
                                            FilterUpdateEvent(
                                                selectType: state.selectType,
                                                selectSort: state.selectSort,
                                                selectDirection: value),
                                          );
                                        }, () {
                                          BlocProvider.of<FilterBloc>(context)
                                              .add(const FilterUpdateEvent());
                                          Navigator.of(context)
                                              .pop(); // Fecha o diálogo
                                        },
                                            state.selectType,
                                            state.selectSort,
                                            state.selectDirection,
                                            state.types,
                                            state.sorts,
                                            state.directions);
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
                                constraints:
                                    const BoxConstraints(maxWidth: 592),
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
                                  BlocProvider.of<RepositoriesBloc>(context)
                                      .add(
                                    SearchRepositoriesEvent(
                                      query: query,
                                      type: state.selectType,
                                      sort: state.selectSort,
                                      direction: state.selectDirection,
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
                                      constraints: const BoxConstraints(
                                          maxHeight: 500.0),
                                      child:
                                          BlocBuilder<FilterBloc, FilterState>(
                                              builder: (context, state) {
                                        return FilterDialog(
                                          (value) {
                                            BlocProvider.of<FilterBloc>(context)
                                                .add(FilterUpdateEvent(
                                                    selectType: value,
                                                    selectSort:
                                                        state.selectSort,
                                                    selectDirection:
                                                        state.selectDirection));
                                          },
                                          (value) {
                                            BlocProvider.of<FilterBloc>(context)
                                                .add(FilterUpdateEvent(
                                                    selectType:
                                                        state.selectType,
                                                    selectSort: value,
                                                    selectDirection:
                                                        state.selectDirection));
                                          },
                                          (value) {
                                            BlocProvider.of<FilterBloc>(context)
                                                .add(FilterUpdateEvent(
                                                    selectType:
                                                        state.selectType,
                                                    selectSort:
                                                        state.selectSort,
                                                    selectDirection: value));
                                          },
                                          () {
                                            BlocProvider.of<FilterBloc>(context)
                                                .add(const FilterUpdateEvent());
                                            Navigator.of(context)
                                                .pop(); // Fecha o diálogo
                                          },
                                          state.selectType,
                                          state.selectSort,
                                          state.selectDirection,
                                          state.types,
                                          state.sorts,
                                          state.directions,
                                        );
                                      }),
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
        );
      }),
    );
  }
}