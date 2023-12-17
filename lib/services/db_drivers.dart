import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:driver_monitoring_application/utils/constants.dart';
import 'package:injectable/injectable.dart';

import '../models/driver_model.dart';
import 'db_service.dart';

class DbDrivers {
  DbDrivers();

  // late final DbService dbService;
  final Dio _dio = Dio();

  // void init(DbService db) {
  //   dbService = db;
  // }

  Future<void> fetchAllDrivers() async {
    try {
      var response = await _dio.get('${UrlConstants.baseUrl}/drivers');
      // log(response.data["drivers"].toString());
      // log(json.decode(response.data["drivers"]).toString());
      // var list = json.decode(response.data.toString());
      log((response.data["drivers"]).toString());
      log((response.data).toString());
      // log(list["drivers"].toString());
      // var list = response.data["drivers"]
      //     .map<DriverModel>((driver) => DriverModel.fromJson(driver))
      //     .toList();
      // log(list["drivers"].toString());
    } catch (e) {
      throw Exception(e);
    }
  }
}
