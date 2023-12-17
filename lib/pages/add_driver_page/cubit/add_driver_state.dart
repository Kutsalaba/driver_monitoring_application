part of 'add_driver_cubit.dart';

class AddDriverState {
  const AddDriverState({
    this.licenseCategories = const [],
    this.isInputCompleted = false,
    this.driver,
  });

  final List<LicenseCategory> licenseCategories;
  final bool isInputCompleted;
  final DriverModel? driver;

  AddDriverState copyWith({
    List<LicenseCategory>? licenseCategories,
    bool? isInputCompleted,
    DriverModel? driver,
  }) {
    return AddDriverState(
      licenseCategories: licenseCategories ?? this.licenseCategories,
      isInputCompleted: isInputCompleted ?? this.isInputCompleted,
      driver: driver ?? this.driver,
    );
  }
}

final class AddDriverInitial extends AddDriverState {}

final class AddDriverSelecting extends AddDriverState {
  const AddDriverSelecting({
    super.licenseCategories,
    super.isInputCompleted,
  });
}
