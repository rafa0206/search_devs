import 'package:flutter/material.dart';
import 'package:search_devs/utils/constants/theme.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppTheme.mainBlackBlue,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppTheme.mainBlackBlue, width: 1),
            borderRadius: BorderRadius.circular(4)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        labelStyle: const TextStyle(color: AppTheme.mainBlackBlue),
        hintText: 'Search',
        labelText: 'Search',
        prefixIcon: const Icon(Icons.search, size: 24),
      ),
    );
  }
}
