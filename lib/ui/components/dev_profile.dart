import 'package:flutter/material.dart';
import 'package:search_devs/domain/entities/dev.dart';
import 'package:search_devs/utils/constants/theme.dart';

class DevProfile extends StatelessWidget {
  final Dev dev;

  const DevProfile({
    super.key,
    required this.dev,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage:
          NetworkImage(dev.photo!),
          backgroundColor: Colors.transparent,
          radius: 24,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dev.name != null ?
            Text(
              dev.name!,
              style: AppTheme.titleTextStyle,
            ) : const SizedBox.shrink(),
            Text('@${dev.nickname}',
                style: AppTheme.iconTextStyle
                    .copyWith(color: AppTheme.mainDarkGrey)),
          ],
        )
      ],
    );
  }
}
