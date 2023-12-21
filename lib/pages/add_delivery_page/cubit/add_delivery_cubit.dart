import 'package:driver_monitoring_application/pages/add_delivery_page/models/delivery_driver_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../models/driver_model.dart';
import '../../../models/vehicle_model.dart';
import '../../../services/drivers_service.dart';
import '../../../services/injectible/injectible_init.dart';
import '../../../services/vehicles_service.dart';

part 'add_delivery_state.dart';

@injectable
class AddDeliveryCubit extends Cubit<AddDeliveryState> {
  AddDeliveryCubit() : super(AddDeliveryInitial());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  Future<void> load() async {
    var vehicles = await getIt<VehiclesService>().getAllVehicles();
    var drivers = await getIt<DriversService>().getAllDrivers();
    var deliveryDrivers = drivers.map<DeliveryDriverModel>(
        (driver) => DeliveryDriverModel(driver: driver));
    emit(AddDeliveryLoadedState(vehicles: vehicles, deliveryDrivers: [
      ...deliveryDrivers,
      ...deliveryDrivers,
      ...deliveryDrivers,
    ]));
  }

  void selectDriverTile(int index) {
    var deliveryDrivers = state.deliveryDrivers;
    for (int i = 0; i < deliveryDrivers.length; i++) {
      if (i == index) {
        deliveryDrivers[i] = deliveryDrivers[i]
            .copyWith(isSelected: !deliveryDrivers[i].isSelected);
      } else {
        deliveryDrivers[i] = deliveryDrivers[i].copyWith(isSelected: false);
      }
    }
    emit(state.copyWith(deliveryDrivers: deliveryDrivers));
  }
}
