import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_devs/blocs/dev_bloc.dart';
import 'package:search_devs/blocs/dev_events.dart';
import 'package:search_devs/blocs/dev_states.dart';
import 'package:search_devs/blocs/filter_bloc.dart';
import 'package:search_devs/blocs/filter_events.dart';
import 'package:search_devs/blocs/filter_states.dart';
import 'package:search_devs/blocs/repositories_bloc.dart';
import 'package:search_devs/blocs/repositories_events.dart';
import 'package:search_devs/blocs/repositories_states.dart';
import 'package:search_devs/ui/components/contact_button.dart';
import 'package:search_devs/ui/components/dev_info.dart';
import 'package:search_devs/ui/components/dev_repository.dart';
import 'package:search_devs/ui/components/filter_button.dart';
import 'package:search_devs/ui/components/filter_dialog.dart';
import 'package:search_devs/ui/components/search_button.dart';
import 'package:search_devs/ui/components/search_form.dart';
import 'package:search_devs/ui/components/title_search_devs.dart';
import 'package:search_devs/ui/responsive_layout/responsive_layout.dart';
import 'package:search_devs/utils/constants/theme.dart';

class DevView extends StatelessWidget {
  DevView({super.key});

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.isPhone(context)
        ? PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              if (!didPop) {
                Modular.to.navigate('/');
              }
            },
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Modular.to.navigate('/');
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
              ),
              backgroundColor: AppTheme.mainWhite,
              body: BlocBuilder<DevBloc, DevState>(builder: (context, state) {
                if (state is DevLoadingState) {
                  return const SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 80.0,
                            width: 80.0,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state is DevLoadedState) {
                  return Column(
                    children: [
                      DevInfo(dev: state.dev),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child:
                              BlocBuilder<RepositoriesBloc, RepositoriesState>(
                            builder: (context, state) {
                              if (state is RepositoriesLoadingState) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (state is RepositoriesErrorState) {
                                return const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text("Erro de servidor"),
                                    ),
                                  ],
                                );
                              }
                              if (state is RepositoriesLoadedState) {
                                if (state.repositories.isEmpty) {
                                  return const Center(
                                    child: Text("Não há repositórios"),
                                  );
                                } else {
                                  return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: state.repositories.length,
                                    itemBuilder: (context, index) {
                                      return DevRepository(
                                        repository: state.repositories[index],
                                      );
                                    },
                                  );
                                }
                              }
                              return Container();
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }
                if (state is DevErrorState) {
                  return const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Center(
                      child: Text(
                        'Ops, não há nenhum dev no github com este username',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                }
                return Container();
              }),
            ),
          )
        : Scaffold(
            backgroundColor: AppTheme.mainWhiteBackground,
            body: SizedBox(
              child: SafeArea(
                child: Flexible(
                  child: Column(
                    children: [
                      Container(
                        color: AppTheme.mainWhite,
                        height: 88,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: ResponsiveLayout.screenWidth(context) > 800
                                  ? 112.0
                                  : 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const TitleSearchDevs(isDevView: true),
                              const SizedBox(
                                width: 119,
                              ),
                              BlocBuilder<FilterBloc, FilterState>(
                                  builder: (context, state) {
                                  return Flexible(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                                              BlocProvider.of<RepositoriesBloc>(
                                                      context)
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
                                        Visibility(
                                          visible:
                                              !ResponsiveLayout.isPhone(context),
                                          child: FilterButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return ConstrainedBox(
                                                    constraints:
                                                        const BoxConstraints(
                                                            maxHeight: 500.0),
                                                    child: BlocBuilder<FilterBloc, FilterState>(
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
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              ),
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<DevBloc, DevState>(
                        builder: (context, state) {
                          if (state is DevLoadingState) {
                            const Expanded(
                              child: Center(
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                          }
                          if (state is DevErrorState) {
                            return const Expanded(
                              child: Center(
                                child: Text(
                                  'Ops, não há nenhum dev no github com este username',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            );
                          }
                          if (state is DevLoadedState) {
                            return Flexible(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: ResponsiveLayout.screenWidth(
                                                      context) >
                                                  800
                                              ? 112.0
                                              : 15,
                                          right: ResponsiveLayout.screenWidth(
                                                      context) >
                                                  800
                                              ? 112.0
                                              : 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              DevInfo(dev: state.dev),
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              ContactButton(onTap: () {})
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 32,
                                          ),
                                          Expanded(
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                  maxHeight: 1660),
                                              child: Container(
                                                color: AppTheme.mainWhite,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 16,
                                                    vertical: 10,
                                                  ),
                                                  child: BlocBuilder<
                                                      RepositoriesBloc,
                                                      RepositoriesState>(
                                                    builder: (context, state) {
                                                      if (state
                                                          is RepositoriesLoadingState) {
                                                        return const Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      }
                                                      if (state
                                                          is RepositoriesErrorState) {
                                                        return Container();
                                                      }
                                                      if (state
                                                          is RepositoriesLoadedState) {
                                                        if (state.repositories
                                                            .isEmpty) {
                                                          return const Expanded(
                                                            child: Text(
                                                              "Não há repositórios",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          );
                                                        } else {
                                                          return ListView
                                                              .builder(
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            shrinkWrap: true,
                                                            itemCount: state
                                                                .repositories
                                                                .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return DevRepository(
                                                                repository:
                                                                    state.repositories[
                                                                        index],
                                                              );
                                                            },
                                                          );
                                                        }
                                                      }
                                                      return Container();
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}