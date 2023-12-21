import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/app_colors.dart';

class DeliveryTab extends StatelessWidget {
  const DeliveryTab({
    super.key,
    required this.title,
    required this.partNumber,
  });

  final String title;
  final String partNumber;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 100.h,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.brightGrey,
                width: 2.w,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Text(
                partNumber,
                style: Theme.of(context).primaryTextTheme.titleMedium,
              ),
            ),
          ),
          Text(
            title,
            style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
