import 'package:flutter/material.dart';
import 'package:search_devs/utils/constants/theme.dart';

class FilterButton extends StatelessWidget {
  final void Function()? onPressed;

  const FilterButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 48,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.format_list_bulleted_outlined,
          color: Colors.white,
          size: 25,
        ),
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(AppTheme.mainPurple),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
