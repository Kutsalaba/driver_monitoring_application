import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/localization/locale_keys.g.dart';
import 'package:driver_monitoring_application/routes/app_router.gr.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/assets.gen.dart';
import 'custom_menu_tile.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20.h,
      children: [
        SizedBox(height: 60.h),
        SvgPicture.asset(
          Assets.icons.location,
          height: 40.h,
          width: 40.w,
          colorFilter: const ColorFilter.mode(
            AppColors.brightYellow,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          LocaleKeys.appName.tr(),
          style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                color: Theme.of(context).primaryColorLight,
              ),
        ),
        SizedBox(height: 32.h),
        CustomMenuTile(
          itemText: 'userName',
          iconPath: Assets.icons.location,
        ),
        const Divider(
          color: AppColors.white,
        ),
        CustomMenuTile(
          itemText: 'Home',
          iconPath: Assets.icons.location,
          onTap: () {
            AutoRouter.of(context).replace(const HomeRoute());
          },
        ),
        SizedBox(height: 16.h),
        CustomMenuTile(
          itemText: 'Add driver',
          iconPath: Assets.icons.location,
          onTap: () {
            AutoRouter.of(context).push(const AddDriverRoute());
          },
        ),
        SizedBox(height: 280.h),
        CustomMenuTile(
            itemText: 'Log out',
            iconPath: Assets.icons.location,
            onTap: () {
              log('Logout');
            }),
      ],
    );
  }
}
