import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/pages/vehicles_page/cubit/vehicles_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';
import '../../localization/locale_keys.g.dart';
import '../../routes/app_router.gr.dart';
import '../../services/injectible/injectible_init.dart';
import '../../styles/app_colors.dart';
import '../drivers_page/cubit/drivers_cubit.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_menu_drawer/custom_menu_drawer.dart';
import 'widgets/vehicle_tile.dart';

@RoutePage()
class VehiclesPage extends StatelessWidget {
  const VehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.contrastBlack,
      drawer: const CustomMenuDrawer(),
      appBar: CustomAppBar(
        title: LocaleKeys.vehicles.tr(),
      ),
      body: BlocProvider(
        create: (context) => getIt<VehiclesCubit>()..getAllVehicles(),
        child: BlocBuilder<VehiclesCubit, VehiclesState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h, width: double.infinity),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 20.h, bottom: 2.h),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         LocaleKeys.vehicles.tr(),
                  //         style: Theme.of(context)
                  //             .primaryTextTheme
                  //             .titleMedium
                  //             ?.copyWith(
                  //               fontWeight: FontWeight.w300,
                  //             ),
                  //       ),
                  //       const Spacer(),
                  //       Switch.adaptive(
                  //         value: true,
                  //         onChanged: (newValue) {
                  //           log('SWITCHING!');
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const AddVehicleRoute());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.deepGrey,
                      shape: const CircleBorder(),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: SvgPicture.asset(
                        Assets.icons.circlePlus,
                        width: 32.w,
                        height: 32.h,
                      ),
                    ),
                  ),
                  state.vehicles.isNotEmpty
                      ? RefreshIndicator(
                          onRefresh: () async => await context
                              .read<DriversCubit>()
                              .getAllDrivers(),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: state.vehicles
                                  .map(
                                    (vehicle) => Padding(
                                      padding: EdgeInsets.only(top: 20.h),
                                      child: VehicleTile(
                                        vehicle: vehicle,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 200.h),
                          child: SizedBox(
                            height: 50.h,
                            width: 50.w,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
