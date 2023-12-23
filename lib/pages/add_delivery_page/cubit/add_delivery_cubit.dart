import 'dart:developer';

import 'package:driver_monitoring_application/pages/add_delivery_page/models/delivery_driver_model.dart';
import 'package:driver_monitoring_application/services/deliveries_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../models/delivery_model.dart';
import '../../../services/drivers_service.dart';
import '../../../services/injectible/injectible_init.dart';
import '../../../services/vehicles_service.dart';
import '../models/delivery_vehicle_model.dart';

part 'add_delivery_state.dart';

@singleton
class AddDeliveryCubit extends Cubit<AddDeliveryState> {
  AddDeliveryCubit() : super(AddDeliveryInitial());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  LatLng? shipFromLatLng;
  LatLng? shipToLatLng;
  String? shipFromAddress;
  String? shipToAddress;

  Future<void> load() async {
    var vehicles = await getIt<VehiclesService>().getAllVehicles();
    var drivers = await getIt<DriversService>().getAllDrivers();
    var deliveryDrivers = drivers
        .map<DeliveryDriverModel>(
            (driver) => DeliveryDriverModel(driver: driver))
        .toList();
    var deliveryVehicles = vehicles
        .map<DeliveryVehicleModel>(
            (vehicle) => DeliveryVehicleModel(vehicle: vehicle))
        .toList();
    //TODO clean
    emit(AddDeliveryLoadedState(
      deliveryVehicles: deliveryVehicles,
      deliveryDrivers: deliveryDrivers,
    ));
  }

  Future<void> addNewDelivery() async {
    var vehicleId = state.deliveryVehicles
        .firstWhere((vehicle) => vehicle.isSelected)
        .vehicle
        .vehicleId!;
    var driverId = state.deliveryDrivers
        .firstWhere((driver) => driver.isSelected)
        .driver
        .userId!;
    var delivery = DeliveryModel(
      deliveryName: titleController.text,
      deliveryDescription: descriptionController.text,
      deadline: DateTime.parse(dateController.text),
      shipFromLongitude: shipFromLatLng!.longitude,
      shipFromLatitude: shipFromLatLng!.latitude,
      shipToLongitude: shipToLatLng!.longitude,
      shipToLatitude: shipToLatLng!.latitude,
      shipToAddress: shipToAddress,
      shipFromAddress: shipFromAddress,
      vehicleId: vehicleId,
      driverId: driverId,
    );

    await getIt<DeliveriesService>().addNewDelivery(delivery);
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
  }

  Future<void> selectFromLatLng(LatLng latLng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    shipFromLatLng = latLng;
    shipFromAddress = placemarks.first.street.toString();
    log('Lat: ${shipFromLatLng!.latitude}, long: ${shipFromLatLng!.longitude}');
    log(shipFromAddress!);
  }

  Future<void> selectToLatLng(LatLng latLng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );
    shipToLatLng = latLng;
    shipToAddress = placemarks.first.street.toString();
    log('Lat: ${shipToLatLng!.latitude}, long: ${shipToLatLng!.longitude}');
    log(shipToAddress!);
  }

  void selectVehicleTile(int index) {
    var deliveryVehicles = state.deliveryVehicles;
    for (int i = 0; i < deliveryVehicles.length; i++) {
      if (i == index) {
        deliveryVehicles[i] = deliveryVehicles[i]
            .copyWith(isSelected: !deliveryVehicles[i].isSelected);
      } else {
        deliveryVehicles[i] = deliveryVehicles[i].copyWith(isSelected: false);
      }
    }
    emit(state.copyWith(deliveryVehicles: deliveryVehicles));
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

  bool confirmInputAddVehicle() {
    bool hasSelectedVehicle =
        state.deliveryVehicles.any((vehicle) => vehicle.isSelected);
    bool hasSelectedDriver =
        state.deliveryDrivers.any((driver) => driver.isSelected);
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        shipFromLatLng != null &&
        shipToLatLng != null &&
        hasSelectedVehicle &&
        hasSelectedDriver) {
      return true;
    }
    return false;
  }
}
