import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_devs/blocs/dev_bloc.dart';
import 'package:search_devs/blocs/dev_events.dart';
import 'package:search_devs/blocs/repositories_bloc.dart';
import 'package:search_devs/blocs/repositories_events.dart';
import 'package:search_devs/ui/components/search_button.dart';
import 'package:search_devs/ui/responsive_layout/responsive_layout.dart';
import 'package:search_devs/utils/constants/theme.dart';

class SearchForm extends StatelessWidget {
  final bool isDevView;
  final TextEditingController controller;

  const SearchForm({
    super.key,
    required this.isDevView,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.isPhone(context)
        ? TextFormField(
            controller: controller,
            cursorColor: AppTheme.mainMediumGrey,
            decoration: InputDecoration(
              disabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme.mainMediumGrey, width: 1),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppTheme.mainMediumGrey, width: 1),
                  borderRadius: BorderRadius.circular(4)),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppTheme.mainMediumGrey, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: AppTheme.mainMediumGrey,
                    width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              labelStyle: const TextStyle(color: AppTheme.mainMediumGrey),
              hintText: 'Search',
              hintStyle: const TextStyle(color: AppTheme.mainMediumGrey),
              labelText: 'Search',
              prefixIcon: const Icon(Icons.search, size: 24, color: AppTheme.mainMediumGrey),
            ),
          )
        : Flexible(
            child: Row(
              mainAxisAlignment: isDevView
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 592),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () {
                        if(isDevView){
                          final query = controller.text;
                          if (query.isNotEmpty) {
                            BlocProvider.of<DevBloc>(context).add(SearchDevEvent(query));
                            BlocProvider.of<RepositoriesBloc>(context).add(SearchRepositoriesEvent(query));
                          }
                          FocusScope.of(context).unfocus();
                          controller.clear();
                        }else{
                          null;
                        }
                      },
                      controller: controller,
                      cursorColor: isDevView
                          ? AppTheme.mainPurple
                          : AppTheme.mainMediumGrey,
                      decoration: InputDecoration(
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppTheme.mainMediumGrey, width: 1),
                        ),
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 14.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: isDevView
                                  ? AppTheme.mainPurple
                                  : AppTheme.mainMediumGrey,
                              width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: isDevView
                                  ? AppTheme.mainPurple
                                  : AppTheme.mainMediumGrey,
                              width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppTheme.mainMediumGrey, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                            fontSize: 18, color: AppTheme.mainMediumGrey),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 26,
                          color: AppTheme.mainMediumGrey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                Visibility(
                  visible: !isDevView,
                  child: SearchButton(
                    onTap: () {
                      final query = controller.text;
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
          );
  }
}
