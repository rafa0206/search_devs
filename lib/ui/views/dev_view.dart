import 'package:flutter/material.dart';
import 'package:search_devs/ui/components/dev_info.dart';
import 'package:search_devs/ui/components/dev_repository.dart';
import 'package:search_devs/utils/constants/theme.dart';

class DevView extends StatelessWidget {
  const DevView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.mainWhite,
      body: SafeArea(
        child: Column(
          children: [
            DevInfo(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      DevRepository(),
                      DevRepository(),
                      DevRepository(),
                      DevRepository(),
                      DevRepository(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
