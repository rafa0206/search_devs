import 'package:flutter/material.dart';
import 'package:search_devs/utils/constants/theme.dart';

class DevProfile extends StatelessWidget {
  const DevProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blue,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome Sobrenome',
              style: AppTheme.titleTextStyle,
            ),
            Text(
              '@apelido',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Into',
                color: AppTheme.mainDarkGrey,
              ),
            ),
          ],
        )
      ],
    );
  }
}
