import 'package:flutter/material.dart';
import 'package:search_devs/utils/constants/theme.dart';

class DevInfoItem extends StatelessWidget {
  final IconData iconData;
  final String textItem;
  final double? iconSize;

  const DevInfoItem({
    required this.iconData,
    required this.textItem,
    this.iconSize,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Icon(
          iconData,
          size: iconSize ?? 20,
          color: AppTheme.mainGrey,
        ),
        Text(
          textItem,
          style: AppTheme.iconTextStyle,
        ),
      ],
    );
  }
}
