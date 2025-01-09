import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget phone;

  static const double _phoneLimit = 576.0;

  const ResponsiveLayout({
    super.key,
    required this.phone,
  });

  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width <= _phoneLimit;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return phone;
  }
}
