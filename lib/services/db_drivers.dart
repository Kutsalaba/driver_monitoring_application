import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:driver_monitoring_application/utils/constants.dart';

import '../models/driver_model.dart';

class DbDrivers {
  DbDrivers();

  final Dio _dio = Dio();

  Future<List<DriverModel>> fetchAllDrivers() async {
    try {
      var response = await _dio.get('${UrlConstants.baseUrl}/drivers');
      var jsonNew = jsonDecode(response.data);
      // if (jsonNew['drivers'] is List) {
      var drivers = (jsonNew['drivers'] as List)
          .map<DriverModel>((driver) => DriverModel.fromJson(driver))
          .toList();
      log(drivers.toString());
      log(drivers.first.driverLastName.toString());
      return drivers;
      // }
    } catch (e) {
      throw Exception(e);
    }
  }
}
