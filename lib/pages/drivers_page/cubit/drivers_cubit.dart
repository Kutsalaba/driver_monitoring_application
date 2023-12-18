import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../models/driver_model.dart';
import '../../../services/drivers_service.dart';
import '../../../services/injectible/injectible_init.dart';

part 'drivers_state.dart';

@injectable
class DriversCubit extends Cubit<DriversState> {
  DriversCubit() : super(const DriversState());

  Future<void> fetchAllDrivers() async {
    var drivers = await getIt<DriversService>().fetchAllDrivers();
    emit(state.copyWith(drivers: drivers));
  }

  Future<void> deleteDriver(String driverId) async {
    await getIt<DriversService>().deleteDriver(driverId);
    emit(state.copyWith());
  }
}
