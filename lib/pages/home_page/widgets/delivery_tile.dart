import 'dart:async';
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
import 'package:carp_background_location/carp_background_location.dart';
import '../../../cubit/app_state.dart';
import '../../../cubit/app_state_cubit.dart';
import '../../../styles/app_colors.dart';

class DeliveryTile extends StatefulWidget {
  const DeliveryTile({
    super.key,
    required this.deliveryModel,
  });

  final DeliveryModel deliveryModel;

  @override
  State<DeliveryTile> createState() => _DeliveryTileState();
}

class _DeliveryTileState extends State<DeliveryTile>
    with WidgetsBindingObserver {
  Timer? _timer;
  StreamSubscription<LocationDto>? locationSubscription;

  @override
  void initState() {
    
    WidgetsBinding.instance.addObserver(this);
    // configure the location manager
    // LocationManager().interval = 1;
    // LocationManager().distanceFilter = 0;
    // LocationManager().notificationTitle = 'CARP Location Example';
    // LocationManager().notificationMsg = 'CARP is tracking your location';

    // // start listen to location updates
    // locationSubscription = LocationManager()
    //     .locationStream
    //     .listen((LocationDto loc) => print(loc));
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    // if (AppLifecycleState.paused == state) {
    //   await Permission.locationAlways.isGranted
    //   var loc = await LocationManager().getCurrentLocation();
    //   log(loc.toString());
    //   // await context
    //   //     .read<HomeCubit>()
    //   //     .postVehicleLocation(widget.deliveryModel.vehicleId);
    // } else if (state == AppLifecycleState.inactive) {
    //   // works here
    //   print("inactive");
    //   locationSubscription?.cancel();
    //   LocationManager().stop();
    //   super.initState();
    // }
    // log(state.toString());
  }

  @override
  Widget build(BuildContext context) {
    var user = (context.read<AppStateCubit>().state as AuthorizedState).user;

    if (!user.chiefFlag!) {
      _timer = Timer.periodic(const Duration(seconds: 60), (timer) async {
        log(widget.deliveryModel.deliveryName.toString());
        if (!user.chiefFlag!) {
          // await didChangeAppLifecycleState(AppLifecycleState.paused);
          await context
              .read<HomeCubit>()
              .postVehicleLocation(widget.deliveryModel.vehicleId);
        }
      });
    }
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
            widget.deliveryModel.deliveryName,
            style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                  color: AppColors.contrastBlack,
                ),
          ),
          Text(
            widget.deliveryModel.deliveryDescription,
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
          // await context
          //     .read<HomeCubit>()
          //     .postVehicleLocation(widget.deliveryModel.vehicleId);
          router.push(MapCheckRoute(delivery: widget.deliveryModel));
        } else {
          var cubit = context.read<HomeCubit>();
          await cubit.getVehicleLocation(widget.deliveryModel.vehicleId);
          router.push(
            MapCheckRoute(
              delivery: widget.deliveryModel,
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
