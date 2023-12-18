import 'package:dartz/dartz.dart';

import '../../shared_models/api/user_model.dart';
import '../../core/errors/failures.dart';

abstract class AuthRepositoryI {
  // Future<Either<Failure, Token>> getOAuthToken();
  // Future<Either<Failure, Token>> getRefreshToken(String refreshToken);
  Future<Either<Failure, UserModel>> signIn({
    required String login,
    required String password,
  });
  // Future<Either<Failure, UserModel>> signUp({
  //   required String login,
  //   required String password,
  // });
  Future<Either<Failure, void>> signOut();
}
