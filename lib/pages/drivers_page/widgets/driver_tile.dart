import 'dart:developer';

import 'package:driver_monitoring_application/gen/assets.gen.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriverTile extends StatelessWidget {
  const DriverTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('OPEN');
      },
      child: Container(
        height: 90.h,
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
                      child: Assets.images.test.image(
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
                          'Kyrylo Budanov',
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
                            onTap: () {
                              log('CLOSE');
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Age: 37',
                              style:
                                  Theme.of(context).primaryTextTheme.bodySmall,
                            ),
                            Text(
                              'Rank: Letin',
                              style:
                                  Theme.of(context).primaryTextTheme.bodySmall,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Category: B, C1, D1',
                              style:
                                  Theme.of(context).primaryTextTheme.bodySmall,
                            ),
                            Text(
                              'Departyres: 12',
                              style:
                                  Theme.of(context).primaryTextTheme.bodySmall,
                            ),
                          ],
                        ),
                        SizedBox()
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
