import 'package:driver_monitoring_application/gen/assets.gen.dart';
import 'package:driver_monitoring_application/pages/add_delivery_page/cubit/add_delivery_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/app_colors.dart';
import '../models/scrollable_tile_params.dart';

class ScrollableTile extends StatelessWidget {
  const ScrollableTile({
    super.key,
    required this.params,
    this.isDriver = true,
    required this.index,
  });

  final ScrollableTileParams params;
  final bool isDriver;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: params.isSelected ? AppColors.blue : AppColors.dirtyWhite,
      ),
      child: ListTile(
        leading: Container(
          width: 56.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: AppColors.brightGrey,
          ),
          child: Image.asset(
            params.imagePath ??
                (isDriver
                    ? Assets.images.defaultDriver.path
                    : Assets.images.defaultCar.path),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              params.title,
              style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                    color: AppColors.contrastBlack,
                  ),
            ),
            Text(
              params.liscenseCategories,
              style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                    color: AppColors.glazyGrey,
                  ),
            ),
            Text(
              params.description,
              style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                    color: AppColors.glazyGrey,
                  ),
            ),
          ],
        ),
        onTap: () {
          isDriver
              ? context.read<AddDeliveryCubit>().selectDriverTile(index)
              : context.read<AddDeliveryCubit>().selectVehicleTile(index);
        },
        // tileColor: AppColors.dirtyWhite,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(18.w),
        // ),
      ),
    );
  }
}
