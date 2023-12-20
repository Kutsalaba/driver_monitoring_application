import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/vehicle_status_params.dart';

class VehicleStatusItem extends StatelessWidget {
  const VehicleStatusItem({
    required this.onPressed,
    required this.vehicleStatusParams,
    super.key,
  });

  final VoidCallback onPressed;
  final VehicleStatusParams vehicleStatusParams;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10.w),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: vehicleStatusParams.textColor,
          ),
          color: vehicleStatusParams.backgroundColor,
          borderRadius: BorderRadius.circular(20.w),
          boxShadow: [
            if (vehicleStatusParams.isSelected)
              BoxShadow(
                color: vehicleStatusParams.textColor.withOpacity(0.85),
                spreadRadius: 4.w,
                blurRadius: 7.w,
                offset: const Offset(0, 0),
              ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        child: Text(
          vehicleStatusParams.name,
          style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                color: vehicleStatusParams.textColor,
              ),
        ),
      ),
    );
  }
}
