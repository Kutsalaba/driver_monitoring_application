import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/app_colors.dart';

class MultyAlertDialog extends StatelessWidget {
  const MultyAlertDialog({
    super.key,
    required this.svgImagePath,
    required this.text,
    this.haveOkButton = true,
  });

  final String svgImagePath;
  final String text;
  final bool haveOkButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.deepGrey,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            svgImagePath,
            width: 80.w,
            fit: BoxFit.fitHeight,
            // colorFilter: ColorFilter.mode(
            //   AppColors.glazyGrey,
            //   BlendMode.srcIn,
            // ),
          ),
          SizedBox(height: 16.h),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).primaryTextTheme.displayMedium,
          ),
        ],
      ),
      actions: [
        Visibility(
          visible: haveOkButton,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.luminanceGrey,
                // shape: const CircleBorder(),
              ),
              onPressed: () {
                AutoRouter.of(context).pop();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'OK',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .displayMedium!
                      .copyWith(
                        color: AppColors.deepGrey,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
