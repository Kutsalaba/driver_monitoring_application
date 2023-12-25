import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/gen/assets.gen.dart';
import 'package:driver_monitoring_application/models/delivery_model.dart';
import 'package:driver_monitoring_application/pages/home_page/cubit/home_cubit.dart';
import 'package:driver_monitoring_application/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../cubit/app_state.dart';
import '../../../cubit/app_state_cubit.dart';
import '../../../styles/app_colors.dart';

class DeliveryTile extends StatelessWidget {
  const DeliveryTile({
    super.key,
    required this.deliveryModel,
  });

  final DeliveryModel deliveryModel;

  @override
  Widget build(BuildContext context) {
    var user = (context.read<AppStateCubit>().state as AuthorizedState).user;
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
            deliveryModel.deliveryName,
            style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                  color: AppColors.contrastBlack,
                ),
          ),
          Text(
            deliveryModel.deliveryDescription,
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
      onTap: () async {
        var router = AutoRouter.of(context);
        //TODO
        if (!user.chiefFlag!) {
          await context
              .read<HomeCubit>()
              .postVehicleLocation(deliveryModel.vehicleId);
          router.push(MapCheckRoute(delivery: deliveryModel));
        } else {
          var cubit = context.read<HomeCubit>();
          await cubit.getVehicleLocation(deliveryModel.vehicleId);
          log('MEM');
          log(cubit.tempLocation!.toString());
          router.push(
            MapCheckRoute(
              delivery: deliveryModel,
              vehiclePosition: cubit.tempLocation!,
            ),
          );
        }
      },
      tileColor: AppColors.dirtyWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.w),
      ),
    );
  }
}
