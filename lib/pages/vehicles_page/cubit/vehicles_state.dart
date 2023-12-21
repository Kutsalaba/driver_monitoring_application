part of 'vehicles_cubit.dart';

class VehiclesState {
  const VehiclesState({this.vehicles = const []});

  final List<VehicleModel> vehicles;

  VehiclesState copyWith({
    List<VehicleModel>? vehicles,
  }) {
    return VehiclesState(
      vehicles: vehicles ?? this.vehicles,
    );
  }
}
