// class VehicleModel {
//   VehicleModel({
//     required this.vehicleName,
//     required this.maxDistance,
//     required this.fuelPer100km,
//     required this.capacityKg,
//     required this.licenseCategoty,
//     required this.vehicleCategory,
//     required this.vehicleId,
//     required this.currentStatus,
//   });

//   final String vehicleId;
//   final String vehicleName;
//   final double maxDistance;
//   final double fuelPer100km;
//   final double capacityKg;
//   final String licenseCategoty;
//   final String vehicleCategory;
//   final String currentStatus;

//   VehicleModel copyWith({
//     String? vehicleName,
//     double? maxDistance,
//     double? fuelPer100km,
//     double? capacityKg,
//     String? licenseCategoty,
//     String? vehicleCategory,
//     String? vehicleId,
    
//   }) {
//     return VehicleModel(
//       vehicleName: vehicleName ?? this.vehicleName,
//       maxDistance: maxDistance ?? this.maxDistance,
//       fuelPer100km: fuelPer100km ?? this.fuelPer100km,
//       capacityKg: capacityKg ?? this.capacityKg,
//       licenseCategoty: licenseCategoty ?? this.licenseCategoty,
//       vehicleCategory: vehicleCategory ?? this.vehicleCategory,
//       vehicleId: vehicleId ?? this.vehicleId,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       'vehicle_id': vehicleId,
//       'vehicle_name': vehicleName,
//       'max_distance': maxDistance,
//       'fuel_per_100_km': fuelPer100km,
//       'capacity_kg': capacityKg,
//       'license_categoty': licenseCategoty,
//       'vehicle_category': vehicleCategory,
//     };
//   }

//   factory VehicleModel.fromJson(Map<String, dynamic> json) {
//     return VehicleModel(
//       vehicleId: json['vehicle_id'] as String,
//       vehicleName: json['vehicle_name'] as String,
//       maxDistance: json['max_distance'] as double,
//       fuelPer100km: json['fuel_per_100_km'] as double,
//       capacityKg: json['capacity_kg'] as double,
//       licenseCategoty: json['license_categoty'] as String,
//       vehicleCategory: json['vehicle_category'] as String,
//     );
//   }
// }
