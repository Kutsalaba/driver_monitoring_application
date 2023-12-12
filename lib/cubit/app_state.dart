import 'package:equatable/equatable.dart';

import '../domain/shared_models/api/user_model.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class UnauthorizedState extends AppState {
  const UnauthorizedState();
}

class SplashState extends AppState {
  const SplashState();
}

class AuthorizedState extends AppState {
  const AuthorizedState({required this.user});

  final UserModel user;
}
