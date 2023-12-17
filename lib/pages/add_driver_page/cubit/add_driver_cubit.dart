import 'package:driver_monitoring_application/pages/add_driver_page/models/license_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'add_driver_state.dart';

@injectable
class AddDriverCubit extends Cubit<AddDriverState> {
  AddDriverCubit() : super(const AddDriverState());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController rankController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

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

    void savePhoneNumber(String number) {
      emit(state.copyWith());
    }
    // licenseCategories.where((category) {
    //   if (category.name == name) {
    //     category.copyWith(isSelected: !category.isSelected!);
    //     return true;
    //   }
    //   return false;
    // });
    emit(state.copyWith());
  }
}
