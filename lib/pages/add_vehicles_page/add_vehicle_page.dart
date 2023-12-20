import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/routes/app_router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';
import '../../localization/locale_keys.g.dart';
import '../../services/injectible/injectible_init.dart';
import '../../styles/app_colors.dart';
import '../add_driver_page/models/license_category.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_menu_drawer/custom_menu_drawer.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/multy_alert_dialog.dart';
import 'cubit/add_vehicle_cubit.dart';
import 'models/vehicle_category.dart';
import 'models/vehicle_status_params.dart';
import 'widgets/vehicle_status_item.dart';

@RoutePage()
class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.contrastBlack,
      drawer: const CustomMenuDrawer(),
      appBar: CustomAppBar(
        title: LocaleKeys.vehicles.tr(),
      ),
      body: BlocProvider(
        create: (context) => getIt<AddVehicleCubit>()..load(),
        child: BlocBuilder<AddVehicleCubit, AddVehicleState>(
          builder: (context, state) {
            var addVehicleCubit = context.read<AddVehicleCubit>();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        log('Add picture');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.deepGrey,
                          borderRadius: BorderRadius.circular(18.w),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 32.h),
                            child: SvgPicture.asset(
                              Assets.icons.pictureAdd,
                              width: 52.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Text(
                        'NAME',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      child: CustomTextField(
                        controller: addVehicleCubit.nameController,
                        hintText: 'Mitsubishi Lancer',
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 6.h),
                    //   child: Text(
                    //     'STATUS',
                    //     textAlign: TextAlign.start,
                    //     style: Theme.of(context).primaryTextTheme.displaySmall,
                    //   ),
                    // ),
                    // Wrap(
                    //   spacing: 10.w,
                    //   runSpacing: 8.h,
                    //   children: state.vehiclesStatus
                    //       .map(
                    //         (params) => VehicleStatusItem(
                    //           vehicleStatusParams: params,
                    //           onPressed: () => addVehicleCubit
                    //               .onSelectVehiclesStatus(params.type),
                    //         ),
                    //       )
                    //       .toList(),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.h, bottom: 10.h),
                                child: Text(
                                  LocaleKeys.maxDistanceTitle.tr(),
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .displaySmall,
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                                width: 100.w,
                                child: CustomTextField(
                                  controller:
                                      addVehicleCubit.maxDistanceController,
                                  hintText: '385',
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    LocaleKeys.categoryOfVehicles.tr(),
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .displaySmall,
                                  ),
                                ),
                              ),
                              DropdownButton<VehicleCategory>(
                                dropdownColor: AppColors.deepGrey,
                                padding: EdgeInsets.zero,
                                value: addVehicleCubit.vehicleCategory,
                                items: state.vehicleCategories
                                    .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item.name,
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .bodyMedium,
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (vehicleCategory) {
                                  addVehicleCubit.onSelectVehicleCategory(
                                      vehicleCategory!);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.h, bottom: 10.h),
                                child: Text(
                                  LocaleKeys.fuelTitle.tr(),
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .displaySmall,
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                                width: 100.w,
                                child: CustomTextField(
                                  controller: addVehicleCubit.fuelController,
                                  hintText: '9.4',
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    LocaleKeys.categoryOfLicense.tr(),
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .displaySmall,
                                  ),
                                ),
                              ),
                              DropdownButton<LicenseCategory>(
                                dropdownColor: AppColors.deepGrey,
                                padding: EdgeInsets.zero,
                                value: addVehicleCubit.licenseCategory,
                                items: state.licenseCategories
                                    .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item.name,
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .bodyMedium,
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (onSelectLicenseCategory) {
                                  addVehicleCubit.onSelectLicenseCategory(
                                      onSelectLicenseCategory!);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 12.h, bottom: 10.h),
                          child: Text(
                            LocaleKeys.capacityTittle.tr(),
                            textAlign: TextAlign.start,
                            style:
                                Theme.of(context).primaryTextTheme.displaySmall,
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                          width: 100.w,
                          child: CustomTextField(
                            controller: addVehicleCubit.capacityController,
                            hintText: '222',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Center(
                      child: SizedBox(
                        width: 300.w,
                        child: ElevatedButton(
                          onPressed: () async {
                            var route = AutoRouter.of(context);
                            if (context
                                .read<AddVehicleCubit>()
                                .confirmInput()) {
                              await context
                                  .read<AddVehicleCubit>()
                                  .addVehicle();
                              if (context.mounted) {
                                Timer? timer = Timer(
                                    const Duration(milliseconds: 1800), () {
                                  route.popAndPush(const VehiclesRoute());
                                });
                                await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return MultyAlertDialog(
                                      text:
                                          'The vehicle was successfully added!',
                                      svgImagePath: Assets.icons.success,
                                      haveOkButton: false,
                                    );
                                  },
                                ).then((value) {
                                  timer?.cancel();
                                  timer = null;
                                });
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return MultyAlertDialog(
                                    text: LocaleKeys.fieldsCannotBeEmpty.tr(),
                                    svgImagePath: Assets.icons.success,
                                  );
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.glazyBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                          ),
                          child: Text(
                            'CONFIRM',
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
              ),
            );
          },
        ),
      ),
    );
  }
}
