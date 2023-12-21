part of 'add_delivery_cubit.dart';

class AddDeliveryState {
  const AddDeliveryState({
    this.vehicles = const [],
    this.deliveryDrivers = const [],
  });

  final List<VehicleModel> vehicles;
  final List<DeliveryDriverModel> deliveryDrivers;

  AddDeliveryState copyWith({
    List<VehicleModel>? vehicles,
    List<DeliveryDriverModel>? deliveryDrivers,
  }) {
    return AddDeliveryState(
      vehicles: vehicles ?? this.vehicles,
      deliveryDrivers: deliveryDrivers ?? this.deliveryDrivers,
    );
  }
}

final class AddDeliveryInitial extends AddDeliveryState {}

final class AddDeliveryLoadedState extends AddDeliveryState {
  AddDeliveryLoadedState({
    super.vehicles,
    super.deliveryDrivers,
  });
}
