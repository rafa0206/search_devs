import 'package:flutter/material.dart';
import 'package:search_devs/ui/components/search_form.dart';
import 'package:search_devs/ui/components/title_search_devs.dart';
import 'package:search_devs/ui/responsive_layout/responsive_layout.dart';
import 'package:search_devs/utils/constants/theme.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainWhite,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              spacing: ResponsiveLayout.isPhone(context) ? 32 : 76,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TitleSearchDevs(isDevView: false),
                SearchForm(isDevView: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
