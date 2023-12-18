part of 'vehicles_cubit.dart';

class VehiclesState {
  const VehiclesState({this.drivers = const []});

  final List<VehicleModel> drivers;

  VehiclesState copyWith({
    List<VehicleModel>? drivers,
  }) {
    return VehiclesState(
      drivers: drivers ?? this.drivers,
    );
  }
}
