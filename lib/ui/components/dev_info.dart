import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:search_devs/ui/components/dev_info_item.dart';
import 'package:search_devs/ui/components/dev_profile.dart';
import 'package:search_devs/utils/constants/theme.dart';

class DevInfo extends StatelessWidget {
  const DevInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.mainLightPurple,
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DevProfile(),
            Row(
              spacing: 16,
              children: [
                DevInfoItem(
                  iconData: CupertinoIcons.group,
                  textItem: '240 seguidores',
                  iconSize: 28,
                ),
                DevInfoItem(
                  iconData: CupertinoIcons.heart,
                  textItem: '50 seguindo',
                ),
              ],
            ),
            Text('Dev Descrição Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: AppTheme.defaultTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DevInfoItem(
                  iconData: FontAwesomeIcons.building,
                  textItem: 'Cidade',
                  iconSize: 16,
                ),
                DevInfoItem(
                  iconData: CupertinoIcons.placemark,
                  textItem: 'Cidade',
                ),
                DevInfoItem(
                  iconData: Icons.mail_outline,
                  textItem: 'nome@email.com.br',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DevInfoItem(
                    iconData: CupertinoIcons.link, textItem: 'www.nome.com.br'),
                DevInfoItem(
                    iconData: FontAwesomeIcons.twitter, textItem: '@nome'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
