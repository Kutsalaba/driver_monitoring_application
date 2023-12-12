import 'package:driver_monitoring_application/services/db_service.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../../shared_models/api/user_model.dart';

abstract class AuthDataSourceI {
  Future<UserModel> signIn({
    required String login,
    required String password,
  });
  // Future<UserCredential> signUp(String email, String password);
  Future<void> signOut();
  Future<UserModel> getUserBylogin(String login);
}

@Injectable(as: AuthDataSourceI)
class AuthDataSourceImpl implements AuthDataSourceI {
  AuthDataSourceImpl({
    required this.dbService,
    // required this.firestoreUsers,
  });

  final DbService dbService;
  // final FirestoreUsers firestoreUsers;

  @override
  Future<UserModel> signIn({
    required String login,
    required String password,
  }) async {
    try {
      final userCredential = await dbService.signInWithLoginAndPassword(
        login: login,
        password: password,
      );

      return userCredential;
    } catch (exception) {
      throw (OtherFailure(message: 'Failed to sign in $exception'));
    }
  }

  @override
  Future<void> signOut() async {
    try {
      dbService.signOut();
    } catch (exception) {
      throw (ServerFailure(message: exception.toString()));
    }
  }

  @override
  Future<UserModel> getUserBylogin(String login) async {
    try {
      final result = await dbService.getUserByLogin(login);
      return result;
    } catch (exception) {
      throw ServerFailure(message: 'Something went wrong: $exception');
    }
  }

  // @override
  // Future<UserCredential> signUp(String email, String password) async {
  //   try {
  //     final userCredential = await dbService.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     await firestoreUsers.addUser(email);

  //     return userCredential;
  //   // } on FirebaseAuthException catch (exception) {
  //   //   throw (ServerFailure(message: exception.message ?? exception.code));
  //   } catch (exception) {
  //     throw (OtherFailure(message: 'Failed to sign up $exception'));
  //   }
  // }
}
