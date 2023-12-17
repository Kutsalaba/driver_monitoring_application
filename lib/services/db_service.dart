import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:driver_monitoring_application/domain/shared_models/api/user_model.dart';
import 'package:driver_monitoring_application/services/secure_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';

import '../domain/core/errors/failures.dart';
import 'injectible/injectible_init.dart';

class DbService {
  // final Dio _dio = Dio();
  // late final Connection conn;
  UserModel? currentUser;

  Future<void> init() async {
    // conn = await Connection.open(
    //   // Endpoint(
    //   //   port: 19713,
    //   //   host: 'driver-monitoring-application-db-khok-8eb3.a.aivencloud.com',
    //   //   database: 'defaultdb',
    //   //   username: 'avnadmin',
    //   //   password: 'AVNS_zb-76Zov-eh6OfnbW-Z',
    //   // ),
    //    Endpoint(
    //     host: '34.82.23.154',
    //     database: 'prod_db',
    //     username: 'postgres',
    //     password: 'IvNa2023OlKh',
    //   ),
    // );
  }

  Future<UserModel> signInWithLoginAndPassword({
    required String login,
    required String password,
  }) async {
    try {
      final result = [
        ['1', 'superuser', 'werrttt', 'true']
      ];
      //   final result = await conn.execute("""
      //   select * from users
      //   where login = '$login' and user_password = '$password'
      // """);
      if (result.isNotEmpty) {
        var userModel = UserModel(
          userId: int.parse(result.first[0].toString()),
          login: result.first[1].toString(),
          password: result.first[2].toString(),
          chiefFlag: result.first[3].toString() == 'true',
        );
        log(userModel.toJson().toString());
        currentUser = userModel;
        return userModel;
      }
      return const UserModel();
    } catch (exception) {
      throw (OtherFailure(message: 'Failed to sign in $exception'));
    }
  }

  Future<UserModel> getUserByLogin(String login) async {
    try {
      // final result = await conn.execute("""
      // select * from users where login = '$login'
      // """);
      // if (result.isNotEmpty) {
      //   var userModel = UserModel(
      //     userId: int.parse(result.first[0].toString()),
      //     login: result.first[1].toString(),
      //     password: result.first[2].toString(),
      //     chiefFlag: result.first[3].toString() == 'true',
      //   );
      //   log(userModel.toJson().toString());
      //   currentUser = userModel;
      //   return userModel;
      // }
      return const UserModel();
    } catch (exception) {
      throw (OtherFailure(message: 'Failed to sign in $exception'));
    }
  }

  Future<void> signOut() async {
    await getIt<SecureStorage>().deleteSecureData('creds');
  }
}
