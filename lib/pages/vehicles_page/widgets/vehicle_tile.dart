import 'package:driver_monitoring_application/gen/assets.gen.dart';
import 'package:driver_monitoring_application/localization/locale_keys.g.dart';
import 'package:driver_monitoring_application/services/injectible/injectible_init.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/vehicle_model.dart';
import '../../../services/vehicles_service.dart';
import '../../widgets/confirmaton_alert_dialog.dart';
import 'vehicle_info_dialog.dart';

class VehicleTile extends StatelessWidget {
  const VehicleTile({
    super.key,
    required this.vehicle,
  });

  final VehicleModel vehicle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //TODO
      // onTap: () => showDialog(
      //   context: context,
      //   builder: (context) {
      //     return Center(
      //       child: VehicleInfoDialog(
      //         imagePath: Assets.images.defaultDriver.path,
      //         vehicleModel: vehicle,
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
                      child: Assets.images.defaultCar.image(
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
                          vehicle.vehicleName,
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
                                      await getIt<VehiclesService>()
                                          .deleteVehicle(vehicle.vehicleId!);
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
                                '${LocaleKeys.status.tr()}: ${vehicle.currentStatus}',
                                maxLines: 2,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodySmall,
                              ),
                              Text(
                                LocaleKeys.consumption.tr(namedArgs: {
                                  'fuelPer': vehicle.fuelPer100km.toString(),
                                }),
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
                                LocaleKeys.maxDistance.tr(namedArgs: {
                                  'maxDistance': vehicle.maxDistance.toString(),
                                }),
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodySmall,
                              ),
                              Text(
                                LocaleKeys.capacity.tr(namedArgs: {
                                  'capacity': vehicle.capacityKg.toString(),
                                }),
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
