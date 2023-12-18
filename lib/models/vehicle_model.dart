class VehicleModel {
  VehicleModel({
    required this.vehicleName,
    required this.maxDistance,
    required this.fuelPer100km,
    required this.capacityKg,
    required this.licenseCategory,
    required this.vehicleCategory,
    required this.vehicleId,
    required this.currentStatus,
  });

  final String vehicleId;
  final String vehicleName;
  final double maxDistance;
  final double fuelPer100km;
  final double capacityKg;
  final String licenseCategory;
  final String vehicleCategory;
  final String currentStatus;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'vehicle_id': vehicleId,
      'vehicle_name': vehicleName,
      'max_distance': maxDistance,
      'fuel_per_100_km': fuelPer100km,
      'capacity_kg': capacityKg,
      'license_category': licenseCategory,
      'vehicle_category': vehicleCategory,
      'current_status': currentStatus,
    };
  }

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      vehicleId: json['vehicle_id'] as String,
      vehicleName: json['vehicle_name'] as String,
      maxDistance: json['max_distance'] as double,
      fuelPer100km: json['fuel_per_100_km'] as double,
      capacityKg: json['capacity_kg'] as double,
      licenseCategory: json['license_category'] as String,
      vehicleCategory: json['vehicle_category'] as String,
      currentStatus: json['current_status'] as String,
    );
  }

  VehicleModel copyWith({
    String? vehicleId,
    String? vehicleName,
    double? maxDistance,
    double? fuelPer100km,
    double? capacityKg,
    String? licenseCategory,
    String? vehicleCategory,
    String? currentStatus,
  }) {
    return VehicleModel(
      vehicleId: vehicleId ?? this.vehicleId,
      vehicleName: vehicleName ?? this.vehicleName,
      maxDistance: maxDistance ?? this.maxDistance,
      fuelPer100km: fuelPer100km ?? this.fuelPer100km,
      capacityKg: capacityKg ?? this.capacityKg,
      licenseCategory: licenseCategory ?? this.licenseCategory,
      vehicleCategory: vehicleCategory ?? this.vehicleCategory,
      currentStatus: currentStatus ?? this.currentStatus,
    );
  }
}
