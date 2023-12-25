import 'dart:developer';

import 'package:driver_monitoring_application/gen/assets.gen.dart';
import 'package:driver_monitoring_application/pages/drivers_page/cubit/drivers_cubit.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/driver_model.dart';
import '../../../services/injectible/injectible_init.dart';
import '../../../utils/helpers.dart';
import '../../widgets/confirmaton_alert_dialog.dart';
import 'driver_info_dialog.dart';

class DriverTile extends StatelessWidget {
  const DriverTile({
    super.key,
    required this.driver,
  });

  final DriverModel driver;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //TODO
      // onTap: () => showDialog(
      //   context: context,
      //   builder: (context) {
      //     return Center(
      //       child: DriverInfoDialog(
      //         imagePath: Assets.images.defaultDriver.path,
      //         driverModel: driver,
      //       ),
      //     );
      //   },
      // ),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: AppColors.deepGrey,
          borderRadius: BorderRadius.circular(18.w),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.w),
                      child: Assets.images.defaultDriver.image(
                        width: 65.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 240.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${driver.driverFirstName} ${driver.driverLastName} ${driver.driverPatronymic}',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium!
                              .copyWith(
                                color: AppColors.white,
                              ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(top: 6.h),
                          child: GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ConfirmationAlertDialog(
                                    onPressed: () async {
                                      log('Delete ${driver.userId}');
                                      await getIt<DriversCubit>()
                                          .deleteDriver(driver.userId!);
                                      log('Successfully deleted');
                                    },
                                  );
                                },
                              );
                            },
                            child: SvgPicture.asset(
                              Assets.icons.closeRed,
                              width: 32.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 240.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 120.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Age: ${driver.driverAge.toString()}',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodySmall,
                              ),
                              Text(
                                'Rank: ${driver.driverRank}',
                                maxLines: 2,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodySmall,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Categories: ${getStringCategories(driver)}',
                                maxLines: 1,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodySmall,
                              ),
                              Text(
                                'Status: ${driver.currentStatus}',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
