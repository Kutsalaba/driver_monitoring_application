import 'dart:developer';

import 'package:driver_monitoring_application/pages/add_delivery_page/cubit/add_delivery_cubit.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/driver_model.dart';
import '../../models/scrollable_tile_params.dart';
import '../scrollable_tile.dart';

class VehicleDriverContent extends StatelessWidget {
  const VehicleDriverContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDeliveryCubit, AddDeliveryState>(
      builder: (context, state) {
        var deliveryVehicles =
            context.read<AddDeliveryCubit>().state.deliveryVehicles;
        var deliveryDrivers =
            context.read<AddDeliveryCubit>().state.deliveryDrivers;
        log(state.toString());
        return (state.deliveryDrivers.isNotEmpty &&
                state.deliveryVehicles.isNotEmpty)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 30.w),
                    child: Text(
                      'VEHICLE',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).primaryTextTheme.displaySmall,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SizedBox(
                      height: 200.h,
                      child: Scrollbar(
                        child: ListView.builder(
                            primary: false,
                            itemCount: deliveryVehicles.length,
                            itemBuilder: (context, index) {
                              var vehicle = deliveryVehicles[index].vehicle;
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6.h,
                                  horizontal: 10.w,
                                ),
                                child: ScrollableTile(
                                  index: index,
                                  isDriver: false,
                                  params: ScrollableTileParams(
                                    title: vehicle.vehicleName,
                                    liscenseCategories:
                                        'License category: ${vehicle.licenseCategory}',
                                    description:
                                        'Category: ${vehicle.vehicleCategory}',
                                    isSelected:
                                        deliveryVehicles[index].isSelected,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 30.w),
                    child: Text(
                      'DRIVER',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).primaryTextTheme.displaySmall,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SizedBox(
                      height: 200.h,
                      child: Scrollbar(
                        child: ListView.builder(
                            primary: false,
                            itemCount: deliveryDrivers.length,
                            itemBuilder: (context, index) {
                              var driver = deliveryDrivers[index].driver;
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6.h,
                                  horizontal: 10.w,
                                ),
                                child: ScrollableTile(
                                  index: index,
                                  params: ScrollableTileParams(
                                    title:
                                        '${driver.driverFirstName} ${driver.driverLastName} ${driver.driverPatronymic}',
                                    liscenseCategories:
                                        'Categories: ${categoriesToString(driver)}',
                                    description:
                                        'Rank: ${deliveryDrivers[index].driver}',
                                    isSelected:
                                        deliveryDrivers[index].isSelected,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: 50.h,
                width: 50.w,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                ),
              );
      },
    );
  }

  String categoriesToString(DriverModel driver) {
    List<String> categories = [];
    if (driver.a1Category == true) categories.add('A1');
    if (driver.aCategory == true) categories.add('A');
    if (driver.b1Category == true) categories.add('B1');
    if (driver.bCategory == true) categories.add('B');
    if (driver.c1Category == true) categories.add('C1');
    if (driver.cCategoty == true) categories.add('C');
    if (driver.d1Categoty == true) categories.add('D1');
    if (driver.dCategory == true) categories.add('D');
    if (driver.c1eCategory == true) categories.add('C1E');
    if (driver.beCategory == true) categories.add('BE');
    if (driver.ceCategory == true) categories.add('CE');
    if (driver.d1eCategory == true) categories.add('D1E');
    if (driver.deCategory == true) categories.add('DE');
    String categoriesString = categories.join(', ');
    return '$categoriesString.';
  }
}
