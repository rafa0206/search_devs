import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget phone;
  final Widget? tablet;
  final Widget largerDesktop;
  final Widget? extraLargerDesktop;

  static const double _phoneLimit = 576.0;
  static const double _tabletLimit = 768.0;
  static const double _largerDesktopLimit = 992.0;
  static const double _extraLargerDesktopLimit = 1280.0;

  const ResponsiveLayout({
    super.key,
    required this.phone,
    this.tablet,
    required this.largerDesktop,
    this.extraLargerDesktop,
  });

  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width <= _phoneLimit;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > _phoneLimit &&
          MediaQuery.of(context).size.width <= _tabletLimit;

  static bool isLargerDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > _tabletLimit &&
          MediaQuery.of(context).size.width <= _largerDesktopLimit;

  static bool isExtraLargerDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > _largerDesktopLimit ||
          MediaQuery.of(context).size.width >= _extraLargerDesktopLimit;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width <= _phoneLimit) {
      return phone;
    } else if (size.width > _phoneLimit && size.width <= _tabletLimit) {
      return tablet ?? largerDesktop;
    } else if (size.width > _tabletLimit &&
        size.width <= _largerDesktopLimit) {
      return largerDesktop;
    } else {
      return extraLargerDesktop ?? largerDesktop;
    }
  }
}
