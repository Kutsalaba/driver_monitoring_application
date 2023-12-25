import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../styles/app_colors.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColors.dirtyWhite,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            SvgPicture.asset(Assets.icons.location),
            SizedBox(width: 10.w),
            Text(
              text,
              style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                    color: AppColors.glazyGrey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
