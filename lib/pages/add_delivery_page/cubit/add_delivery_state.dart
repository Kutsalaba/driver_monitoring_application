part of 'add_delivery_cubit.dart';

class AddDeliveryState {
  const AddDeliveryState({
    this.deliveryVehicles = const [],
    this.deliveryDrivers = const [],
    this.delivery,
  });

  final List<DeliveryVehicleModel> deliveryVehicles;
  final List<DeliveryDriverModel> deliveryDrivers;
  final DeliveryModel? delivery;

  AddDeliveryState copyWith({
    List<DeliveryVehicleModel>? deliveryVehicles,
    List<DeliveryDriverModel>? deliveryDrivers,
    DeliveryModel? delivery,
  }) {
    return AddDeliveryState(
      deliveryVehicles: deliveryVehicles ?? this.deliveryVehicles,
      deliveryDrivers: deliveryDrivers ?? this.deliveryDrivers,
      delivery: delivery ?? this.delivery,
    );
  }
}
