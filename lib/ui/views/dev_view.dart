import 'package:flutter/material.dart';
import 'package:search_devs/ui/components/contact_button.dart';
import 'package:search_devs/ui/components/dev_info.dart';
import 'package:search_devs/ui/components/dev_repository.dart';
import 'package:search_devs/ui/components/search_form.dart';
import 'package:search_devs/ui/components/title_search_devs.dart';
import 'package:search_devs/ui/responsive_layout/responsive_layout.dart';
import 'package:search_devs/utils/constants/theme.dart';

class DevView extends StatelessWidget {
  const DevView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.isPhone(context)
        ? Scaffold(
            backgroundColor: AppTheme.mainWhite,
            body: SafeArea(
              child: Column(
                children: [
                  const DevInfo(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 14,
                          itemBuilder: (context, index) {
                            return const DevRepository();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            backgroundColor: AppTheme.mainWhiteBackground,
            body: SizedBox(
              child: SafeArea(
                child: Flexible(
                  child: Column(
                    children: [
                      Container(
                        color: AppTheme.mainWhite,
                        height: 88,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: ResponsiveLayout.screenWidth(context) > 800
                                  ? 112.0
                                  : 15),
                          child: const Row(
                            children: [
                              TitleSearchDevs(isDevView: true),
                              SizedBox(
                                width: 119,
                              ),
                              SearchForm(isDevView: true)
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        ResponsiveLayout.screenWidth(context) >
                                                800
                                            ? 112.0
                                            : 15,
                                    right:
                                        ResponsiveLayout.screenWidth(context) >
                                                800
                                            ? 112.0
                                            : 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const DevInfo(),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        ContactButton(onTap: () {})
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 32,
                                    ),
                                    Expanded(
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                            maxHeight: 1660),
                                        child: Container(
                                          color: AppTheme.mainWhite,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 10,
                                            ),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: 14,
                                              itemBuilder: (context, index) {
                                                return const DevRepository();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
