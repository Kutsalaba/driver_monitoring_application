import 'dart:developer';

import 'package:driver_monitoring_application/models/delivery_model.dart';
import 'package:driver_monitoring_application/services/deliveries_service.dart';
import 'package:driver_monitoring_application/services/injectible/injectible_init.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/shared_models/api/user_model.dart';
import '../../../services/location_service.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  LatLng? tempLocation;

  Future<void> load(UserModel user) async {
    {
      if (user.chiefFlag!) {
        return await getChiefDeliveries();
      }
      if (await getIt<LocationService>().requestPermission()) {
        var locationData = await getIt<LocationService>().getCurrentLocation();
        tempLocation = LatLng(locationData.latitude!, locationData.longitude!);
        log(tempLocation.toString());
      }
      return await getUserDeliveries(user.userId!);
    }
  }

  Future<void> getVehicleLocation(String vehicleId) async {
    tempLocation = await getIt<LocationService>().getVehicleLocation(vehicleId: vehicleId);
    log(tempLocation.toString());
  }

  Future<void> postVehicleLocation(String vehicleId) async {
    var locationData = await getIt<LocationService>().getCurrentLocation();
    tempLocation = LatLng(locationData.latitude!, locationData.longitude!);
    log(tempLocation.toString());

    await getIt<LocationService>()
        .postVehicleLocation(vehicleId: vehicleId, latLng: tempLocation!);
  }

  Future<void> getUserDeliveries(String userId) async {
    var deliveries = await getIt<DeliveriesService>().getUserDeliveries(userId);
    emit(HomeLoadedState(deliveries: deliveries));
  }

  Future<void> getChiefDeliveries() async {
    var deliveries = await getIt<DeliveriesService>().getChiefDeliveries();
    emit(HomeLoadedState(deliveries: deliveries));
  }
}
