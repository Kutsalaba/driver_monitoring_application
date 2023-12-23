import 'dart:developer';

import 'package:driver_monitoring_application/pages/add_driver_page/models/license_category.dart';
import 'package:driver_monitoring_application/services/drivers_service.dart';
import 'package:driver_monitoring_application/services/injectible/injectible_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../models/driver_model.dart';

part 'add_driver_state.dart';

@injectable
class AddDriverCubit extends Cubit<AddDriverState> {
  AddDriverCubit() : super(AddDriverInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController rankController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  String phoneNumber = '';

  void load() {
    emit(AddDriverSelecting(
      licenseCategories: [
        LicenseCategory(name: 'A1'),
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

  void onSelectCategory(String name) {
    var categories = state.licenseCategories;
    for (var i = 0; i < categories.length; i++) {
      if (categories[i].name == name) {
        categories[i] = categories[i].copyWith(
          isSelected: !categories[i].isSelected,
        );
      }
    }
    emit(state.copyWith());
  }

  void savePhoneNumber(String number) {
    log(number);
    phoneNumber = number;
    emit(state.copyWith());
  }

  bool confirmInputAddDriver() {
    if (nameController.text.isNotEmpty &&
        rankController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        loginController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      // state.licenseCategories.

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

  Future<void> addDriver() async {
    var selectedLicenses = state.licenseCategories
        .where((category) => category.isSelected)
        .map((category) => category.name)
        .toList();
    log(selectedLicenses.join(',').toString());
    var names = nameController.text.split(' ');
    var newDriver = DriverModel(
      driverFirstName: names.first,
      driverLastName: names.length > 1 ? names[1] : 'null',
      driverPatronymic: names.length > 2 ? names[2] : 'null',
      driverAge: int.parse(ageController.text),
      driverRank: rankController.text,
      mobilePhone: phoneNumber,
      login: loginController.text,
      password: passwordController.text,
    );

    newDriver = _addCategoriesToDriver(newDriver);
    log(newDriver.toJson().toString());
    await getIt<DriversService>().addDriver(newDriver);
  }

  DriverModel _addCategoriesToDriver(DriverModel driver) {
    DriverModel driverWithCategories = driver;
    for (var category in state.licenseCategories) {
      switch (category.name) {
        case 'A1':
          driverWithCategories =
              driverWithCategories.copyWith(a1Category: category.isSelected);
          break;
        case 'A':
          driverWithCategories =
              driverWithCategories.copyWith(aCategory: category.isSelected);
          break;
        case 'B1':
          driverWithCategories =
              driverWithCategories.copyWith(b1Category: category.isSelected);
          break;
        case 'B':
          driverWithCategories =
              driverWithCategories.copyWith(bCategory: category.isSelected);
          break;
        case 'C1':
          driverWithCategories =
              driverWithCategories.copyWith(c1Category: category.isSelected);
          break;
        case 'C':
          driverWithCategories =
              driverWithCategories.copyWith(cCategoty: category.isSelected);
          break;
        case 'D1':
          driverWithCategories =
              driverWithCategories.copyWith(d1Categoty: category.isSelected);
          break;
        case 'D':
          driverWithCategories =
              driverWithCategories.copyWith(dCategory: category.isSelected);
          break;
        case 'C1E':
          driverWithCategories =
              driverWithCategories.copyWith(c1eCategory: category.isSelected);
          break;
        case 'BE':
          driverWithCategories =
              driverWithCategories.copyWith(beCategory: category.isSelected);
          break;
        case 'CE':
          driverWithCategories =
              driverWithCategories.copyWith(ceCategory: category.isSelected);
          break;
        case 'D1E':
          driverWithCategories =
              driverWithCategories.copyWith(d1eCategory: category.isSelected);
          break;
        case 'DE':
          driverWithCategories =
              driverWithCategories.copyWith(deCategory: category.isSelected);
          break;
        default:
      }
    }
    return driverWithCategories;
  }
}
