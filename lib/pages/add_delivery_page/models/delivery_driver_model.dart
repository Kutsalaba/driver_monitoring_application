import '../../../models/driver_model.dart';

class DeliveryDriverModel {
  const DeliveryDriverModel({
    required this.driver,
    this.isSelected = false,
  });

  final DriverModel driver;
  final bool isSelected;

  DeliveryDriverModel copyWith({
    DriverModel? driver,
    bool? isSelected,
  }) {
    return DeliveryDriverModel(
      driver: driver ?? this.driver,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
