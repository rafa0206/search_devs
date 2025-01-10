import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_devs/blocs/dev_bloc.dart';
import 'package:search_devs/blocs/dev_events.dart';
import 'package:search_devs/blocs/repositories_bloc.dart';
import 'package:search_devs/blocs/repositories_events.dart';
import 'package:search_devs/data/api/dev_api.dart';
import 'package:search_devs/data/api/repositories_api.dart';
import 'package:search_devs/routes/app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DevApi>(
            create: (context) => DevApi()),
        RepositoryProvider<RepositoriesApi>(
            create: (context) => RepositoriesApi())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<DevBloc>(
            create: (context) => DevBloc(
              RepositoryProvider.of<DevApi>(context),
            )..add(LoadDevEvent()),
            // child: DevLayout(),
          ),
          BlocProvider<RepositoriesBloc>(
            create: (context) => RepositoriesBloc(
              RepositoryProvider.of<RepositoriesApi>(context),
            )..add(LoadRepositoriesEvent()),
            // child: DevLayout(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // theme: ThemeData(),
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
        ),
      ),
    );
  }
}