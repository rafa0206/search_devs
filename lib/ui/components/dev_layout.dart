import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_devs/blocs/dev_bloc.dart';
import 'package:search_devs/blocs/dev_states.dart';
import 'package:search_devs/blocs/repositories_bloc.dart';
import 'package:search_devs/blocs/repositories_states.dart';
import 'package:search_devs/ui/components/contact_button.dart';
import 'package:search_devs/ui/components/dev_info.dart';
import 'package:search_devs/ui/components/dev_repository.dart';
import 'package:search_devs/ui/components/search_form.dart';
import 'package:search_devs/ui/components/title_search_devs.dart';
import 'package:search_devs/ui/responsive_layout/responsive_layout.dart';
import 'package:search_devs/utils/constants/theme.dart';

class DevLayout extends StatelessWidget {
  DevLayout({super.key});

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
              body: SafeArea(
                child: Column(
                  children: [
                    BlocBuilder<DevBloc, DevState>(builder: (context, state) {
                      if (state is DevLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is DevLoadedState) {
                        return DevInfo(dev: state.dev);
                      }
                      return const Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Center(child: Text('Ops, não há nenhum dev no github com este username', textAlign: TextAlign.center, style: TextStyle(
                          fontSize: 20
                        ),)),
                      );
                    }),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: BlocBuilder<RepositoriesBloc, RepositoriesState>(
                          builder: (context, state) {
                            if (state is RepositoriesLoadingState) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (state is RepositoriesLoadedState) {
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
                            return Container();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                            children: [
                              const TitleSearchDevs(isDevView: true),
                              const SizedBox(
                                width: 119,
                              ),
                              SearchForm(
                                  isDevView: true,
                                  controller: _searchController)
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        ResponsiveLayout.screenWidth(context) >
                                                800
                                            ? 112.0
                                            : 15,
                                    right:
                                        ResponsiveLayout.screenWidth(context) >
                                                800
                                            ? 112.0
                                            : 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BlocBuilder<DevBloc, DevState>(
                                            builder: (context, state) {
                                          if (state is DevLoadingState) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                          if (state is DevLoadedState) {
                                            return DevInfo(dev: state.dev);
                                          }
                                          return Container();
                                        }),
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
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 10,
                                            ),
                                            child: BlocBuilder<RepositoriesBloc,
                                                RepositoriesState>(
                                              builder: (context, state) {
                                                if (state
                                                    is RepositoriesLoadingState) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                                if (state
                                                    is RepositoriesLoadedState) {
                                                  return ListView.builder(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    shrinkWrap: true,
                                                    itemCount: state
                                                        .repositories.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return DevRepository(
                                                        repository:
                                                            state.repositories[
                                                                index],
                                                      );
                                                    },
                                                  );
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
