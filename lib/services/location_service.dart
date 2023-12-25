import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../utils/constants.dart';

class LocationService {
  final Location location = Location();
  final Dio _dio = Dio();

  Future<bool> requestPermission() async {
    final permission = await location.requestPermission();
    return permission == PermissionStatus.granted;
  }

  Future<LocationData> getCurrentLocation() async {
    final serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      final result = await location.requestService.call();
      if (result) {
        log('Service has been enabled');
      } else {
        throw Exception('GPS service not enabled');
      }
    }

    final locationData = await location.getLocation();
    return locationData;
  }

  Future<void> postVehicleLocation({
    required String vehicleId,
    required LatLng latLng,
  }) async {
    try {
      await _dio.post(
        '${UrlConstants.baseUrl}/location',
        data: {
          'vehicle_id': vehicleId,
          'longitude': latLng.longitude,
          'latitude': latLng.latitude,
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<LatLng> getVehicleLocation({required String vehicleId}) async {
    try {
      var response =
          await _dio.get('${UrlConstants.baseUrl}/location/$vehicleId');
      var jsonNew = jsonDecode(response.data);
      // // if (jsonNew['drivers'] is List) {
      var location = (jsonNew['deliveries'] as List)
          .map<LatLng>(
            (delivery) => LatLng(
              delivery['latitude'],
              delivery['longitude'],
            ),
          )
          .toList();
      log(location.first.toString());
      return location.first;
      // }
    } catch (e) {
      throw Exception(e);
    }
  }
}
