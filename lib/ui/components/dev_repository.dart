import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_devs/utils/constants/theme.dart';

class DevRepository extends StatelessWidget {
  const DevRepository({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppTheme.mainLightGrey,
              width: 1,
            ),
          ),
        ),
        child: const Column(
          children: [
            Column(
              spacing: 18,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome Repositório',
                  style: AppTheme.titleTextStyle,
                ),
                Text(
                  'Descricão Repositório Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: AppTheme.defaultTextStyle,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                spacing: 8,
                children: [
                  Icon(
                    CupertinoIcons.star,
                    size: 18,
                    color: AppTheme.mainGrey,
                  ),
                  Text(
                    '100',
                    style: AppTheme.iconTextStyle,
                  ),
                  Icon(
                    Icons.circle,
                    size: 5,
                    color: AppTheme.mainGrey,
                  ),
                  Text(
                    'Atualizado há 2 dias',
                    style: AppTheme.iconTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
