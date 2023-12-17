import 'package:driver_monitoring_application/models/driver_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/app_colors.dart';

class DriverInfoDialog extends StatelessWidget {
  const DriverInfoDialog({
    super.key,
    required this.imagePath,
    required this.driverModel,
  });

  final String imagePath;
  final DriverModel driverModel;

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
                driverModel.driverFirstName,
                style: Theme.of(context).primaryTextTheme.titleLarge,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Daily phrase',
                style: Theme.of(context).primaryTextTheme.titleMedium,
              ),
              Divider(
                height: 10.h,
              ),
              Text(
                'TEXT',
                style: Theme.of(context).primaryTextTheme.titleSmall,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Daily horoscope',
                style: Theme.of(context).primaryTextTheme.titleMedium,
              ),
              Divider(
                height: 10.h,
              ),
              Text(
                'Texr',
                style: Theme.of(context).primaryTextTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
