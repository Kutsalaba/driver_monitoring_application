enum VehicleCategoryType {
  offRoadVehicle,
  truck,
  bus,
  car,
  tank,
}

class VehicleCategory {
  final String name;
  final VehicleCategoryType type;

  VehicleCategory({
    required this.name,
    required this.type,
  });
}
