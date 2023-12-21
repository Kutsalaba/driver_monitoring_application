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
        var vehicles = context.read<AddDeliveryCubit>().state.vehicles;
        var drivers = context.read<AddDeliveryCubit>().state.deliveryDrivers;
        log(state.toString());
        return (state.deliveryDrivers.isNotEmpty && state.vehicles.isNotEmpty)
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
                      height: 180.h,
                      child: Scrollbar(
                        child: ListView.builder(
                          primary: false,
                          itemCount: vehicles.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 6.h,
                              horizontal: 10.w,
                            ),
                            child: ScrollableTile(
                              index: index,
                              isDriver: false,
                              params: ScrollableTileParams(
                                title: vehicles[index].vehicleName,
                                liscenseCategories:
                                    'License category: ${vehicles[index].licenseCategory}',
                                description:
                                    'Category: ${vehicles[index].vehicleCategory}',
                              ),
                            ),
                          ),
                        ),
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
                      height: 180.h,
                      child: Scrollbar(
                        child: ListView.builder(
                            primary: false,
                            itemCount: drivers.length,
                            itemBuilder: (context, index) {
                              var driver = drivers[index].driver;
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
                                        'Rank: ${drivers[index].driver}',
                                    isSelected: drivers[index].isSelected,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Center(
                    child: SizedBox(
                      width: 340.w,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () async {},
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
