part of 'add_driver_cubit.dart';

class AddDriverState {
  const AddDriverState({
    this.licenseCategories = const [],
  });

  final List<LicenseCategory> licenseCategories;

  AddDriverState copyWith({
    List<LicenseCategory>? licenseCategories,
  }) {
    return AddDriverState(
      licenseCategories: licenseCategories ?? this.licenseCategories,
    );
  }
}

final class AddDriverInitial extends AddDriverState {}

final class AddDriverSelecting extends AddDriverState {
  const AddDriverSelecting({
    super.licenseCategories,
  });
}
