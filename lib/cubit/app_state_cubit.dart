import 'dart:convert';
import 'dart:developer';

import 'package:driver_monitoring_application/services/db_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../domain/auth/repository/auth_repo.dart';
import '../domain/shared_models/api/user_model.dart';
import '../services/injectible/injectible_init.dart';
import '../services/secure_storage_service.dart';
import 'app_state.dart';

@injectable
class AppStateCubit extends Cubit<AppState> {
  final AuthRepositoryI authRepository;
  final DbService dbService;

  AppStateCubit({
    required this.authRepository,
    required this.dbService,
  }) : super(const SplashState());

  Future<void> checkAuthStatus() async {
    final currentUser = dbService.currentUser;
    if (currentUser != null) {
      final result =
          await authRepository.isUserSignedIn(currentUser.login ?? '');
      result.fold(
        (failure) {
          emit(const UnauthorizedState());
        },
        (user) {
          emit(AuthorizedState(user: user));
        },
      );
    } else {
      var data = await getIt<SecureStorage>().readSecureData('creds');
      if (data != null) {
        var user = UserModel.fromJson(jsonDecode(data));
        log(user.login.toString());
        emit(AuthorizedState(user: user));
      } else {
        emit(const UnauthorizedState());
      }
    }
  }

  void logOut() async {
    await dbService.signOut();
    await checkAuthStatus();
  }
}
