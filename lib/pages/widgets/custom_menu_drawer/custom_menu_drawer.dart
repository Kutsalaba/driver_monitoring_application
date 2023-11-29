import 'package:flutter/material.dart';

import 'custom_menu_items.dart';

class CustomMenuDrawer extends StatelessWidget {
  const CustomMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff643FDB),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MenuItems(),
        ),
      ),
    );
  }
}
