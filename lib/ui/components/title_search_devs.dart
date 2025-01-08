import 'package:flutter/material.dart';
import 'package:search_devs/utils/constants/theme.dart';

class TitleSearchDevs extends StatelessWidget {
  const TitleSearchDevs({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        const TextSpan(
          text: 'Search ',
          style: AppTheme.mainTitleTextStyle,
        ),
        TextSpan(
          text: 'd_evs',
          style:
              AppTheme.mainTitleTextStyle.copyWith(color: AppTheme.mainPurple),
        ),
      ]),
    );
  }
}
