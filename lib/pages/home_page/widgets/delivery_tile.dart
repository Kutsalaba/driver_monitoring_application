import 'package:driver_monitoring_application/gen/assets.gen.dart';
import 'package:driver_monitoring_application/models/delivery_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../styles/app_colors.dart';

class DeliveryTile extends StatelessWidget {
  const DeliveryTile({
    super.key,
    required this.deliveryModel,
  });

  final DeliveryModel deliveryModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 28.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.brightGrey,
        ),
        child: const Center(
          child: Icon(
            Icons.circle,
            color: AppColors.dirtyWhite,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'First Text',
            style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                  color: AppColors.contrastBlack,
                ),
          ),
          Text(
            'Second Text',
            style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                  color: AppColors.glazyGrey,
                ),
          ),
        ],
      ),
      trailing: SvgPicture.asset(
        Assets.icons.location,
        height: 32.h,
        fit: BoxFit.fitWidth,
      ),
      onTap: () {
        //TODO
        // Handle the tap event
      },
      tileColor: AppColors.dirtyWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.w),
      ),
    );
  }
}
