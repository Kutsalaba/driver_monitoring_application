import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/vehicle_model.dart';
import '../../../styles/app_colors.dart';

class VehicleInfoDialog extends StatelessWidget {
  const VehicleInfoDialog({
    super.key,
    required this.imagePath,
    required this.vehicleModel,
  });

  final String imagePath;
  final VehicleModel vehicleModel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.deepGrey,
      // backgroundColor: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        height: 0.8.sh,
        width: 0.95.sw,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizedBox(
                height: 55.h,
              ),
              Text(
                vehicleModel.vehicleName,
                style: Theme.of(context).primaryTextTheme.titleLarge,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
