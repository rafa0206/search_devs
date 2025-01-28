import 'package:flutter/material.dart';
import 'package:search_devs/utils/constants/theme.dart';

class DevInfoItem extends StatelessWidget {
  final IconData iconData;
  final String? textItem;
  final double? iconSize;

  const DevInfoItem(
      {required this.iconData,
      required this.textItem,
      this.iconSize,
      super.key});

  @override
  Widget build(BuildContext context) {
    return textItem == null || textItem == '' ? const SizedBox.shrink() : Row(
      children: [
        textItem != null ?
        Icon(
          iconData,
          size: iconSize ?? 20,
          color: AppTheme.mainGrey,
        ) : const SizedBox.shrink(),
        const SizedBox(
          width: 8,
        ),
        Text(
          textItem!,
          style: AppTheme.iconTextStyle,
        ),
      ],
    );
  }
}
