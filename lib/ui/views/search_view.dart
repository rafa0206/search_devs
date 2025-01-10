import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_devs/blocs/dev_bloc.dart';
import 'package:search_devs/blocs/dev_events.dart';
import 'package:search_devs/blocs/repositories_bloc.dart';
import 'package:search_devs/blocs/repositories_events.dart';
import 'package:search_devs/ui/components/search_button.dart';
import 'package:search_devs/ui/components/search_form.dart';
import 'package:search_devs/ui/components/title_search_devs.dart';
import 'package:search_devs/ui/responsive_layout/responsive_layout.dart';
import 'package:search_devs/utils/constants/theme.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainWhite,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TitleSearchDevs(isDevView: false),
                ResponsiveLayout.isPhone(context)
                    ? const SizedBox(
                        height: 32,
                      )
                    : const SizedBox(
                        height: 76,
                      ),
                SearchForm(
                  isDevView: false,
                  controller: _searchController,
                ),
                ResponsiveLayout.isPhone(context)
                    ? const SizedBox(
                        height: 32,
                      )
                    : const SizedBox(
                        height: 76,
                      ),
                Visibility(
                  visible: ResponsiveLayout.isPhone(context),
                  child: SearchButton(
                    onTap: () {
                      final query = _searchController.text;
                      if (query.isNotEmpty) {
                        BlocProvider.of<DevBloc>(context).add(SearchDevEvent(query));
                        BlocProvider.of<RepositoriesBloc>(context).add(SearchRepositoriesEvent(query));
                      }
                      Modular.to.navigate('/profile');
                    },
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
