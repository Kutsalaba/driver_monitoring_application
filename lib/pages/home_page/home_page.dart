import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/localization/locale_keys.g.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_menu_drawer/custom_menu_drawer.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.contrastBlack,
      appBar: AppBar(
        backgroundColor: AppColors.contrastBlack,
        iconTheme: IconThemeData(color: AppColors.contrastGrey),
        title: Text(
          LocaleKeys.home.tr(),
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Center(child: Text('HOME')),
      drawer: CustomMenuDrawer(),
    );
  }
}
