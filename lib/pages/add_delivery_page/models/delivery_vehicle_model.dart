import '../../../models/vehicle_model.dart';

class DeliveryVehicleModel {
  const DeliveryVehicleModel({
    required this.vehicle,
    this.isSelected = false,
  });

  final VehicleModel vehicle;
  final bool isSelected;

  DeliveryVehicleModel copyWith({
    VehicleModel? vehicle,
    bool? isSelected,
  }) {
    return DeliveryVehicleModel(
      vehicle: vehicle ?? this.vehicle,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}