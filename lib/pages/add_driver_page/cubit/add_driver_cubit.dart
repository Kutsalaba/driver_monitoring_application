import 'dart:developer';

import 'package:driver_monitoring_application/pages/add_driver_page/models/license_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../models/driver_model.dart';

part 'add_driver_state.dart';

@injectable
class AddDriverCubit extends Cubit<AddDriverState> {
  AddDriverCubit() : super(const AddDriverState());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController rankController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String phoneNumber = '';

  void load() {
    emit(AddDriverSelecting(
      licenseCategories: [
        LicenseCategory(name: 'A1'),
        LicenseCategory(name: 'A2'),
        LicenseCategory(name: 'B1'),
        LicenseCategory(name: 'B2'),
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

  void confirmInput() {
    if (nameController.text.isNotEmpty &&
        rankController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        phoneNumber.isNotEmpty) {
          // state.licenseCategories.
      var selectedLicenses = state.licenseCategories.map<String?>((category) {
        if (category.isSelected) {
          return category.name;
        }
        return null;
      }).toList();
      log(selectedLicenses.toString());
      log(nameController.text);
      log(rankController.text);
      log(ageController.text);
      log(phoneNumber);
    }
  }
}
