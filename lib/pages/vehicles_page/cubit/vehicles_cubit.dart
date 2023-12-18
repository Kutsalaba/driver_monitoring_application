import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../models/vehicle_model.dart';
import '../../../services/vehicles_service.dart';
import '../../../services/injectible/injectible_init.dart';

part 'vehicles_state.dart';

@injectable
class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit() : super(const VehiclesState());

  Future<void> fetchAllDrivers() async {
    var drivers = await getIt<VehiclesService>().fetchAllVehicles();
    emit(state.copyWith(drivers: drivers));
  }
}
