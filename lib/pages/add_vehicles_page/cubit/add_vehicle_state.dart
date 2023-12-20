part of 'add_vehicle_cubit.dart';

class AddVehicleState {
  const AddVehicleState({
    this.vehicleCategories = const [],
    this.vehiclesStatus = const [],
    this.licenseCategories = const [],
    this.vehicle,
  });

  final VehicleModel? vehicle;
  final List<VehicleStatusParams> vehiclesStatus;
  final List<VehicleCategory> vehicleCategories;
  final List<LicenseCategory> licenseCategories;

  AddVehicleState copyWith({
    VehicleModel? vehicle,
    List<VehicleStatusParams>? vehiclesStatus,
    List<VehicleCategory>? vehicleCategories,
    List<LicenseCategory>? licenseCategories,
  }) {
    return AddVehicleState(
      vehicle: vehicle ?? this.vehicle,
      vehiclesStatus: vehiclesStatus ?? this.vehiclesStatus,
      vehicleCategories: vehicleCategories ?? this.vehicleCategories,
      licenseCategories: licenseCategories ?? this.licenseCategories,
    );
  }
}

final class AddVehicleInitial extends AddVehicleState {}

final class AddVehicleSelecting extends AddVehicleState {
  const AddVehicleSelecting({
    super.vehicle,
    super.vehiclesStatus,
    super.vehicleCategories,
    super.licenseCategories,
  });
}
