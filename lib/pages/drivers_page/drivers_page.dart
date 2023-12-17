import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/gen/assets.gen.dart';
import 'package:driver_monitoring_application/services/db_drivers.dart';
import 'package:driver_monitoring_application/services/injectible/injectible_init.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../localization/locale_keys.g.dart';
import '../../routes/app_router.gr.dart';
import '../../styles/app_colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_menu_drawer/custom_menu_drawer.dart';
import 'widgets/driver_tile.dart';

@RoutePage()
class DriversPage extends StatelessWidget {
  const DriversPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.contrastBlack,
      drawer: const CustomMenuDrawer(),
      appBar: CustomAppBar(
        title: LocaleKeys.drivers.tr(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 2.h),
              child: Row(
                children: [
                  Text(
                    LocaleKeys.drivers.tr(),
                    style: Theme.of(context)
                        .primaryTextTheme
                        .titleMedium
                        ?.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  const Spacer(),
                  Switch.adaptive(
                    value: true,
                    onChanged: (newValue) {
                      log('SWITCHING!');
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const AddDriverRoute());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.deepGrey,
                shape: const CircleBorder(),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: SvgPicture.asset(
                  Assets.icons.circlePlus,
                  width: 32.w,
                  height: 32.h,
                ),
              ),
            ),
            FutureBuilder(
              future: getIt<DbDrivers>().fetchAllDrivers(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: snapshot.requireData
                              .map(
                                (driver) => Padding(
                                  padding: EdgeInsets.only(top: 20.h),
                                  child: DriverTile(
                                    driver: driver,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 200.h),
                        child: SizedBox(
                          height: 50.h,
                          width: 50.w,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
