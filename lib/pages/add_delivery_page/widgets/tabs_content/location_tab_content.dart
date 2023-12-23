import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/gen/assets.gen.dart';
import 'package:driver_monitoring_application/routes/app_router.gr.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../services/injectible/injectible_init.dart';
import '../../../widgets/multy_alert_dialog.dart';
import '../../cubit/add_delivery_cubit.dart';
import '../location_button.dart';

class LocationTabContent extends StatefulWidget {
  const LocationTabContent({super.key});

  @override
  State<LocationTabContent> createState() => _LocationTabContentState();
}

class _LocationTabContentState extends State<LocationTabContent> {
  late GoogleMapController? mapController;
  LatLng? tempLatLng;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDeliveryCubit, AddDeliveryState>(
      builder: (context, state) {
        log(getIt<AddDeliveryCubit>().state.toString());
        var cubit = getIt<AddDeliveryCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  var latLng = await AutoRouter.of(context).push(
                    MapRoute(
                      markerId: 'selectToLatLng',
                    ),
                  );
                  if (latLng is LatLng) {
                    cubit.selectFromLatLng(latLng);
                  }
                },
                child: const LocationButton(),
              ),
              GestureDetector(
                onTap: () async {
                  var latLng = await AutoRouter.of(context).push(
                    MapRoute(
                      markerId: 'selectToLatLng',
                    ),
                  );
                  if (latLng is LatLng) {
                    cubit.selectToLatLng(latLng);
                  }
                },
                child: const LocationButton(),
              ),
              Center(
                child: SizedBox(
                  width: 320.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      var route = AutoRouter.of(context);
                      if (cubit.confirmInputAddVehicle()) {
                        if (context.mounted) {
                          Timer? timer =
                              Timer(const Duration(milliseconds: 1800), () {
                            route.popAndPush(const HomeRoute());
                          });

                          await showDialog(
                            context: context,
                            builder: (context) {
                              return MultyAlertDialog(
                                text: 'The delivery was successfully added!',
                                svgImagePath: Assets.icons.success,
                                haveOkButton: false,
                              );
                            },
                          ).then((value) {
                            timer?.cancel();
                            timer = null;
                          });
                          await cubit.addNewDelivery();
                        }
                      } else {
                        if (context.mounted) {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return MultyAlertDialog(
                                text: 'Please complete all information',
                                svgImagePath: Assets.icons.success,
                              );
                            },
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.dingyGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                    ),
                    child: Text(
                      'NEXT',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium!
                          .copyWith(
                            color: AppColors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
