import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:driver_monitoring_application/utils/constants.dart';

import '../models/driver_model.dart';

class DriversService {
  DriversService();

  final Dio _dio = Dio();

  Future<List<DriverModel>> fetchAllDrivers() async {
    try {
      var response = await _dio.get('${UrlConstants.baseUrl}/drivers');
      var jsonNew = jsonDecode(response.data);
      // if (jsonNew['drivers'] is List) {
      var drivers = (jsonNew['drivers'] as List)
          .map<DriverModel>((driver) => DriverModel.fromJson(driver))
          .toList();
      return drivers;
      // }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addDriver(DriverModel driver) async {
    try {
      await _dio.post(
        '${UrlConstants.baseUrl}/driver',
        data: driver.toJson(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteDriver(String driverId) async {
    try {
      await _dio.delete('${UrlConstants.baseUrl}/driver/$driverId');
    } catch (e) {
      throw Exception(e);
    }
  }
}
