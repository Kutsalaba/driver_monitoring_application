import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.bottom,
  });

  final String title;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize {
    return Size.fromHeight(65.h);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.h,
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
      bottom: bottom,
    );
  }
}
