part of 'drivers_cubit.dart';

class DriversState {
  const DriversState({this.drivers = const []});

  final List<DriverModel> drivers;

  DriversState copyWith({
    List<DriverModel>? drivers,
  }) {
    return DriversState(
      drivers: drivers ?? this.drivers,
    );
  }
}
