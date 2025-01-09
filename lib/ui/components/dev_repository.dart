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
          color: AppTheme.mainWhite,
          border: Border(
            bottom: BorderSide(
              color: AppTheme.mainLightGrey,
              width: 1,
            ),
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome Repositório',
                  style: AppTheme.titleTextStyle,
                ),
                SizedBox(
                  height: 18,
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
                children: [
                  Icon(
                    CupertinoIcons.star,
                    size: 18,
                    color: AppTheme.mainGrey,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '100',
                    style: AppTheme.iconTextStyle,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.circle,
                    size: 5,
                    color: AppTheme.mainGrey,
                  ),
                  SizedBox(
                    width: 8,
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
