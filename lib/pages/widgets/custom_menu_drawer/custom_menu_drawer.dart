import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../localization/locale_keys.g.dart';
import '../../../routes/app_router.gr.dart';

import 'custom_menu_tile.dart';

class CustomMenuDrawer extends StatelessWidget {
  const CustomMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      width: 200.w,
      backgroundColor: AppColors.dirtyBlack,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 45.h),
              Assets.logo.image(height: 80.h),
              SizedBox(height: 60.h),
              CustomMenuTile(
                itemText: LocaleKeys.home.tr(),
                iconPath: Assets.icons.home,
                onTap: () {
                  AutoRouter.of(context).replace(const HomeRoute());
                  AutoRouter.of(context).pop();
                },
              ),
              SizedBox(height: 26.h),
              CustomMenuTile(
                itemText: LocaleKeys.drivers.tr(),
                iconPath: Assets.icons.driver,
                onTap: () {
                  AutoRouter.of(context).replace(const AddDriverRoute());
                  AutoRouter.of(context).pop();
                },
              ),
              SizedBox(height: 26.h),
              CustomMenuTile(
                itemText: LocaleKeys.cars.tr(),
                iconPath: Assets.icons.car,
                onTap: () {
                  log('CARS');
                },
              ),
              SizedBox(height: 26.h),
              CustomMenuTile(
                itemText: LocaleKeys.help.tr(),
                iconPath: Assets.icons.help,
                onTap: () {
                  log('HELP');
                },
              ),
              SizedBox(height: 26.h),
              const Spacer(),
              CustomMenuTile(
                itemText: LocaleKeys.logOut.tr(),
                iconPath: Assets.icons.logOut,
                onTap: () {
                  log('LOGOUT');
                },
              ),
              SizedBox(height: 50.h)
            ],
          ),
        ),
      ),
    );
  }
}
