import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/delivery_model.dart';
import '../utils/constants.dart';

class DeliveriesService {
  DeliveriesService();

  final Dio _dio = Dio();

  Future<List<DeliveryModel>> getUserDeliveries(String userId) async {
    try {
      var response =
          await _dio.get('${UrlConstants.baseUrl}/deliveries/$userId');
      var jsonNew = jsonDecode(response.data);
      // if (jsonNew['drivers'] is List) {
      var vehicles = (jsonNew['deliveries'] as List)
          .map<DeliveryModel>((driver) => DeliveryModel.fromJson(driver))
          .toList();
      return vehicles;
      // }
    } catch (e) {
      throw Exception(e);
    }
  }
}
