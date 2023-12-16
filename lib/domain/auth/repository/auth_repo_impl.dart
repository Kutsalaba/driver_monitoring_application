import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../../shared_models/api/user_model.dart';
import '../datasource/auth_datasource.dart';
import 'auth_repo.dart';

@Injectable(as: AuthRepositoryI)
class AuthRepositoryImplementation implements AuthRepositoryI {
  AuthRepositoryImplementation(
    this.remoteDataSource,
  );

  final AuthDataSourceI remoteDataSource;

  @override
  Future<Either<Failure, UserModel>> isUserSignedIn(String login) async {
    try {
      //TODO
      final result = await remoteDataSource.getUserBylogin(login);
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(ServerFailure(message: 'Something went wrong: $exception'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signIn({
    required String login,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.signIn(
        login: login,
        password: password,
      );
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(ServerFailure(message: 'Something went wrong: $exception'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final result = await remoteDataSource.signOut();
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(ServerFailure(message: 'Something went wrong: $exception'));
    }
  }
}
