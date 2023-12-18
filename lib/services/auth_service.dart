import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:driver_monitoring_application/domain/shared_models/api/user_model.dart';
import 'package:driver_monitoring_application/services/secure_storage_service.dart';

import '../domain/core/errors/failures.dart';
import '../utils/constants.dart';
import 'injectible/injectible_init.dart';

class AuthService {
  final Dio _dio = Dio();

  UserModel? currentUser;

  Future<UserModel> signInWithLoginAndPassword({
    required String login,
    required String password,
  }) async {
    try {
      var response =
          await _dio.get('${UrlConstants.baseUrl}/user/$login,$password');

      log(response.data.toString());
      var jsonNew = jsonDecode(response.data);
      var user = (jsonNew['user'] as List)
          .map<UserModel>((driver) => UserModel.fromJson(driver))
          .toList();
      currentUser = user.first;
      return user.first;
    } catch (exception) {
      throw (OtherFailure(message: 'Failed to sign in $exception'));
    }
  }

  Future<void> signOut() async {
    await getIt<SecureStorage>().deleteSecureData('creds');
  }

  // late final Connection conn;
  // Future<void> init() async {
  //   conn = await Connection.open(
  //       // Endpoint(
  //       //   port: 19713,
  //       //   host: 'driver-monitoring-application-db-khok-8eb3.a.aivencloud.com',
  //       //   database: 'defaultdb',
  //       //   username: 'avnadmin',
  //       //   password: 'AVNS_zb-76Zov-eh6OfnbW-Z',
  //       // ),
  //     Endpoint(
  //       host: '34.82.23.154',
  //       database: 'prod_db',
  //       username: 'postgres',
  //       password: 'IvNa2023OlKh',
  //     ),
  //   );
  // }
}
