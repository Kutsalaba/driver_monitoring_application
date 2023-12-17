import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/localization/locale_keys.g.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';
import '../../routes/app_router.gr.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_menu_drawer/custom_menu_drawer.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.contrastBlack,
      drawer: const CustomMenuDrawer(),
      appBar: CustomAppBar(
        title: LocaleKeys.orders.tr(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Row(
                children: [
                  Text(
                    'Deliveries:',
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
            SizedBox(
              width: 240.w,
              child: ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(const AddDeliveryRoute());
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: Colors.transparent,
                  disabledBackgroundColor: Colors.transparent,
                  disabledForegroundColor: Colors.transparent,
                  backgroundColor: AppColors.deepGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.w),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: SvgPicture.asset(
                          Assets.icons.circlePlus,
                          width: 32.w,
                          height: 32.h,
                        ),
                      ),
                      Text(
                        'CREATE NEW',
                        style: Theme.of(context).primaryTextTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
