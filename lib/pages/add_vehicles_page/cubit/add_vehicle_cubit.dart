import 'dart:developer';

import 'package:driver_monitoring_application/localization/locale_keys.g.dart';
import 'package:driver_monitoring_application/models/vehicle_model.dart';
import 'package:driver_monitoring_application/pages/add_vehicles_page/models/vehicle_status_params.dart';
import 'package:driver_monitoring_application/services/injectible/injectible_init.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../services/vehicles_service.dart';
import '../../add_driver_page/models/license_category.dart';
import '../models/vehicle_category.dart';

part 'add_vehicle_state.dart';

@injectable
class AddVehicleCubit extends Cubit<AddVehicleState> {
  AddVehicleCubit() : super(AddVehicleInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController fuelController = TextEditingController();
  final TextEditingController maxDistanceController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  VehicleCategory vehicleCategory = VehicleCategory(
    name: LocaleKeys.car.tr(),
    type: VehicleCategoryType.car,
  );

  LicenseCategory licenseCategory = LicenseCategory(name: 'A1');

  void load() {
    emit(AddVehicleSelecting(
      vehiclesStatus: [
        VehicleStatusParams(
          name: LocaleKeys.goodStatus.tr(),
          backgroundColor: AppColors.luminanceGreen,
          textColor: AppColors.deepGreen,
          isSelected: true,
          type: VehicleStatusType.good,
        ),
        VehicleStatusParams(
          name: LocaleKeys.onRepairStatus.tr(),
          backgroundColor: AppColors.luminanceOrange,
          textColor: AppColors.deepOrange,
          type: VehicleStatusType.repair,
        ),
        VehicleStatusParams(
          name: LocaleKeys.brokenStatus.tr(),
          backgroundColor: AppColors.luminanceRed,
          textColor: AppColors.deepRed,
          type: VehicleStatusType.broken,
        ),
      ],
      vehicleCategories: [
        VehicleCategory(
          name: LocaleKeys.offRoadVehicle.tr(),
          type: VehicleCategoryType.offRoadVehicle,
        ),
        VehicleCategory(
          name: LocaleKeys.truck.tr(),
          type: VehicleCategoryType.truck,
        ),
        VehicleCategory(
          name: LocaleKeys.bus.tr(),
          type: VehicleCategoryType.bus,
        ),
        vehicleCategory,
        VehicleCategory(
          name: LocaleKeys.tank.tr(),
          type: VehicleCategoryType.tank,
        ),
      ],
      licenseCategories: [
        licenseCategory,
        LicenseCategory(name: 'A'),
        LicenseCategory(name: 'B1'),
        LicenseCategory(name: 'B'),
        LicenseCategory(name: 'C1'),
        LicenseCategory(name: 'C'),
        LicenseCategory(name: 'D'),
        LicenseCategory(name: 'D1'),
        LicenseCategory(name: 'C1E'),
        LicenseCategory(name: 'BE'),
        LicenseCategory(name: 'CE'),
        LicenseCategory(name: 'D1E'),
        LicenseCategory(name: 'DE'),
      ],
    ));
  }

  Future<void> addVehicle() async {
    var vehicle = VehicleModel(
      vehicleName: nameController.text,
      maxDistance: double.parse(maxDistanceController.text),
      fuelPer100km: double.parse(fuelController.text),
      capacityKg: double.parse(capacityController.text),
      licenseCategory: licenseCategory.name,
      vehicleCategory: vehicleCategory.name,
    );

    log(vehicle.toJson().toString());

    await getIt<VehiclesService>().addVehicle(vehicle);
  }

  void onSelectLicenseCategory(LicenseCategory category) {
    licenseCategory = category;
    emit(state.copyWith());
  }

  void onSelectVehicleCategory(VehicleCategory category) {
    vehicleCategory = category;
    emit(state.copyWith());
  }

  void onSelectVehiclesStatus(VehicleStatusType type) {
    var statuses = state.vehiclesStatus
        .map<VehicleStatusParams>((params) => params.copyWith(
              isSelected: false,
            ))
        .toList();
    for (var i = 0; i < statuses.length; i++) {
      if (statuses[i].type == type) {
        statuses[i] = statuses[i].copyWith(
          isSelected: !statuses[i].isSelected,
        );
      }
    }
    emit(state.copyWith(vehiclesStatus: statuses));
  }

    bool confirmInput() {
    if (nameController.text.isNotEmpty &&
        fuelController.text.isNotEmpty &&
        maxDistanceController.text.isNotEmpty &&
        capacityController.text.isNotEmpty) {

      // log(nameController.text);
      // log(rankController.text);
      // log(ageController.text);
      // log(loginController.text);
      // log(passwordController.text);
      // log(phoneNumber);
      return true;
    }
    return false;
  }
}
