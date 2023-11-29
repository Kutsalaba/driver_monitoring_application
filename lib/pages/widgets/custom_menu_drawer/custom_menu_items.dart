import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/localization/locale_keys.g.dart';
import 'package:driver_monitoring_application/routes/app_router.dart';
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
    return Padding(
      padding: EdgeInsets.all(24.h),
      child: Wrap(
        runSpacing: 20.h,
        children: [
          SizedBox(height: 60.h),
          SvgPicture.asset(
            Assets.icons.location,
            height: 40.h,
          ),
          SizedBox(height: 16.h),
          Text(
            LocaleKeys.appName.tr(),
            style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
          ),
          const SizedBox(height: 32),
          CustomMenuTile(
            itemText: 'userName',
            iconPath: Assets.icons.location,
          ),
          Divider(
            color: AppColors.black,
          ),
          // const SizedBox(height: 12),
          // Container(
          //   height: 1,
          //   width: double.infinity,
          //   color: const Color(0xFFFFFFFF).withOpacity(0.3),
          // ),
          // const SizedBox(height: 16),
          // CustomMenuTile(
          //   itemText: 'Calendar',
          //   iconPath: Assets.icons.calendarIcon.path,
          //   // TODO: go to CalendarPage
          //   onTap: () => Routemaster.of(context).push(CalendarPage.path),
          // ),
          // const SizedBox(height: 16),
          // CustomMenuTile(
          //     itemText: 'Find Event',
          //     iconPath: Assets.icons.searchIcon.path,
          //     // TODO: go to FindEvent(mainPage?)
          //     onTap: () async {
          //     }),
          // const Spacer(),
          CustomMenuTile(
            itemText: 'Home',
            iconPath: Assets.icons.location,
            onTap: () {
              AutoRouter.of(context).replace(const HomeRoute());
            },
          ),
          const SizedBox(height: 16),
          CustomMenuTile(
            itemText: 'Add driver',
            iconPath: Assets.icons.location,
            onTap: () {
              AutoRouter.of(context).push(const AddDriverRoute());
            },
          ),
          const SizedBox(height: 16),
          CustomMenuTile(
            itemText: 'Map',
            iconPath: Assets.icons.location,
            onTap: () {
              AutoRouter.of(context).push(const GeoMapsRoute());
            },
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
