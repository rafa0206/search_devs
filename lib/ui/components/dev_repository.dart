import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_devs/domain/entities/repository.dart';
import 'package:search_devs/utils/constants/theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class DevRepository extends StatelessWidget {
  final Repository repository;

  const DevRepository({
    super.key,
    required this.repository
  });

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  repository.name,
                  style: AppTheme.titleTextStyle,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  repository.description ?? '',
                  style: AppTheme.defaultTextStyle,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.star,
                    size: 18,
                    color: AppTheme.mainGrey,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    repository.points.toString(),
                    style: AppTheme.iconTextStyle,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Icons.circle,
                    size: 5,
                    color: AppTheme.mainGrey,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    timeago.format(DateTime.parse(repository.update), locale: 'pt_BR'),
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