import 'package:flutter/material.dart';
import 'package:search_devs/ui/responsive_layout/responsive_layout.dart';
import 'package:search_devs/utils/constants/theme.dart';

class TitleSearchDevs extends StatelessWidget {
  final bool isDevView;

  const TitleSearchDevs({
    super.key,
    required this.isDevView,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.isPhone(context)
        ? RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                  text: 'Search ',
                  style: AppTheme.mainTitleTextStyle,
                ),
                TextSpan(
                  text: 'd_evs',
                  style: AppTheme.mainTitleTextStyle
                      .copyWith(color: AppTheme.mainPurple),
                ),
              ],
            ),
          )
        : RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Search ',
                  style: AppTheme.mainTitleTextStyle
                      .copyWith(fontSize: isDevView ? 32 : 80),
                ),
                TextSpan(
                  text: 'd_evs',
                  style: AppTheme.mainTitleTextStyle.copyWith(
                      color: AppTheme.mainPurple,
                      fontSize: isDevView ? 32 : 80),
                ),
              ],
            ),
          );
  }
}
