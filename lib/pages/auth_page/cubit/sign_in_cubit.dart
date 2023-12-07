import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  Future<void> signIn() async {
    //TODO
    // final result = await signInUseCase(
    //   SignInParams(
    //     email: emailController.text,
    //     password: passwordController.text,
    //   ),
    // );
    // result.fold(
    //   (failure) {
    //     emit(SignInError(failure.message));
    //   },
    //   (result) {
    //     emit(SignInSuccess());
    //   },
    // );
  }
}