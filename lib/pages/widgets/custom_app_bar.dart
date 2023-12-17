import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize {
    return Size.fromHeight(45.h);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.contrastBlack,
      iconTheme: IconThemeData(
        color: AppColors.contrastGrey,
        size: 32.w,
      ),
      title: Text(
        title,
        style: Theme.of(context).primaryTextTheme.titleLarge,
      ),
      centerTitle: true,
    );
  }
}
