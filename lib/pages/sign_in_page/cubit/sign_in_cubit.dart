import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/repository/auth_repo.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.repository) : super(SignInInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthRepositoryI repository;

  Future<void> signIn() async {
    final result = await repository.signIn(
      login: loginController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) {
        emit(SignInError(failure.message));
      },
      (result) {
        emit(SignInSuccess());
      },
    );
  }

  Future<void> signOut() async {
    final result = await repository.signOut();
    result.fold(
      (failure) {
        emit(SignInError(failure.message));
      },
      (result) {
        emit(SignInSuccess());
      },
    );
  }
}
