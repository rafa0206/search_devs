import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:search_devs/ui/components/dev_info_item.dart';
import 'package:search_devs/ui/components/dev_profile.dart';
import 'package:search_devs/ui/responsive_layout/responsive_layout.dart';
import 'package:search_devs/utils/constants/theme.dart';

class DevInfo extends StatelessWidget {
  const DevInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.isPhone(context)
        ? Container(
            decoration: const BoxDecoration(
              color: AppTheme.mainLightPurple,
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DevProfile(),
                  SizedBox(
                    height: 20,
                  ),
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Dev Descrição Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: AppTheme.defaultTextStyle),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DevInfoItem(
                        iconData: FontAwesomeIcons.building,
                        textItem: 'Empresa',
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DevInfoItem(
                          iconData: CupertinoIcons.link,
                          textItem: 'www.nome.com.br'),
                      DevInfoItem(
                          iconData: FontAwesomeIcons.twitter,
                          textItem: '@nome'),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Container(
            width: 280,
            height: 465,
            decoration: const BoxDecoration(
              color: AppTheme.mainWhite,
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  DevProfile(),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Dev Descrição Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: AppTheme.defaultTextStyle,
                    maxLines: 4,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  DevInfoItem(
                    iconData: CupertinoIcons.group,
                    textItem: '240 seguidores',
                    iconSize: 28,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  DevInfoItem(
                    iconData: CupertinoIcons.heart,
                    textItem: '50 seguindo',
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  DevInfoItem(
                    iconData: FontAwesomeIcons.building,
                    textItem: 'Empresa',
                    iconSize: 16,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  DevInfoItem(
                    iconData: CupertinoIcons.placemark,
                    textItem: 'Cidade',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  DevInfoItem(
                    iconData: Icons.mail_outline,
                    textItem: 'nome@email.com.br',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  DevInfoItem(
                      iconData: CupertinoIcons.link,
                      textItem: 'www.nome.com.br'),
                  SizedBox(
                    height: 12,
                  ),
                  DevInfoItem(
                      iconData: FontAwesomeIcons.twitter, textItem: '@nome'),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          );
  }
}
