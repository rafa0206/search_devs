import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:search_devs/domain/entities/dev.dart';
import 'package:search_devs/ui/components/dev_info_item.dart';
import 'package:search_devs/ui/components/dev_profile.dart';
import 'package:search_devs/ui/responsive_layout/responsive_layout.dart';
import 'package:search_devs/utils/constants/theme.dart';

class DevInfo extends StatelessWidget {
  final Dev dev;

  const DevInfo({
    super.key,
    required this.dev
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.isPhone(context)
        ? Container(
            decoration: const BoxDecoration(
              color: AppTheme.mainLightPurple,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DevProfile(dev: dev),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    // spacing: 16,
                    children: [
                      DevInfoItem(
                        iconData: CupertinoIcons.group,
                        textItem: '${dev.followers} seguidores',
                        iconSize: 28,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      DevInfoItem(
                        iconData: CupertinoIcons.heart,
                        textItem: '${dev.following} seguindo',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      dev.description ?? '',
                      style: AppTheme.defaultTextStyle),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DevInfoItem(
                        iconData: FontAwesomeIcons.building,
                        textItem: dev.company,
                        iconSize: 16,
                      ),
                       DevInfoItem(
                        iconData: CupertinoIcons.placemark,
                        textItem: dev.location,
                      ),
                      DevInfoItem(
                        iconData: Icons.mail_outline,
                        textItem: dev.email,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DevInfoItem(
                          iconData: CupertinoIcons.link,
                          textItem: dev.link),
                      DevInfoItem(
                          iconData: FontAwesomeIcons.twitter,
                          textItem: dev.twitter),
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  DevProfile(dev: dev),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    dev.description ?? '',
                    style: AppTheme.defaultTextStyle,
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  DevInfoItem(
                    iconData: CupertinoIcons.group,
                    textItem: '${dev.followers} seguidores',
                    iconSize: 28,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  DevInfoItem(
                    iconData: CupertinoIcons.heart,
                    textItem: '${dev.following} seguindo',
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  DevInfoItem(
                    iconData: FontAwesomeIcons.building,
                    textItem: dev.company,
                    iconSize: 16,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  DevInfoItem(
                    iconData: CupertinoIcons.placemark,
                    textItem: dev.location,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  DevInfoItem(
                    iconData: Icons.mail_outline,
                    textItem: dev.email,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  DevInfoItem(
                      iconData: CupertinoIcons.link,
                      textItem: dev.link),
                  const SizedBox(
                    height: 12,
                  ),
                  DevInfoItem(
                      iconData: FontAwesomeIcons.twitter, textItem: dev.twitter),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          );
  }
}
