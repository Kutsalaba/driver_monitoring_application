import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/delivery_model.dart';
import '../utils/constants.dart';

class DeliveriesService {
  DeliveriesService();

  final Dio _dio = Dio();

  Future<List<DeliveryModel>> getChiefDeliveries() async {
    try {
      var response =
          await _dio.get('${UrlConstants.baseUrl}/deliveries');
      var jsonNew = jsonDecode(response.data);
      var vehicles = (jsonNew['deliveries'] as List)
          .map<DeliveryModel>((driver) => DeliveryModel.fromJson(driver))
          .toList();
      return vehicles;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<DeliveryModel>> getUserDeliveries(String userId) async {
    try {
      var response =
          await _dio.get('${UrlConstants.baseUrl}/deliveries/$userId');
      var jsonNew = jsonDecode(response.data);
      var vehicles = (jsonNew['deliveries'] as List)
          .map<DeliveryModel>((driver) => DeliveryModel.fromJson(driver))
          .toList();
      return vehicles;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addNewDelivery(DeliveryModel delivery) async {
    try {
      var response = await _dio.post(
        '${UrlConstants.baseUrl}/deliveries',
        data: delivery.toJson(),
      );
      log(response.data.toString());
    } catch (e) {
      throw Exception(e);
    }
  }
}
