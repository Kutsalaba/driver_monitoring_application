import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../widgets/custom_menu_drawer/custom_menu_drawer.dart';

@RoutePage()
class AddDriverPage extends StatelessWidget {
  const AddDriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: AppColors.brightGrey,
          ),
      body: Center(child: Text('Add Drivers')),
      drawer: CustomMenuDrawer(),
    );
  }
}
