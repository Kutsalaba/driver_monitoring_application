import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_menu_drawer/custom_menu_drawer.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.brightGrey,
      ),
      body: Center(child: Text('HOME')),
      drawer: CustomMenuDrawer(),
    );
  }
}

