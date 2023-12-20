import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:driver_monitoring_application/utils/constants.dart';

import '../models/vehicle_model.dart';

class VehiclesService {
  VehiclesService();

  final Dio _dio = Dio();

  Future<List<VehicleModel>> fetchAllVehicles() async {
    try {
      var response = await _dio.get('${UrlConstants.baseUrl}/vehicles');
      var jsonNew = jsonDecode(response.data);
      // if (jsonNew['drivers'] is List) {
      var vehicles = (jsonNew['vehicles'] as List)
          .map<VehicleModel>((driver) => VehicleModel.fromJson(driver))
          .toList();
      return vehicles;
      // }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addVehicle(VehicleModel vehicle) async {
    try {
      await _dio.post(
        '${UrlConstants.baseUrl}/vehicle',
        data: vehicle.toJson(),
      );
      log('SUCCSEE');
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteDriver(String vehicleId) async {
    try {
      await _dio.delete('${UrlConstants.baseUrl}/vehicle/$vehicleId');
    } catch (e) {
      throw Exception(e);
    }
  }
}
