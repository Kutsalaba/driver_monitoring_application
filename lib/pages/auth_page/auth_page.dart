import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/app_state.dart';
import '../../cubit/app_state_cubit.dart';
import '../../gen/assets.gen.dart';
import '../../services/injectible/injectible_init.dart';
import '../../services/secure_storage_service.dart';
import '../../styles/app_colors.dart';
import 'cubit/sign_in_cubit.dart';
import 'widgets/email_field.dart';
import 'widgets/password_field.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.contrastBlack,
      body: BlocProvider(
        create: (context) => getIt<SignInCubit>(),
        child: Builder(
          builder: (context) {
            return BlocListener<SignInCubit, SignInState>(
              listener: (context, state) async {
                if (state is SignInSuccess) {
                  await context.read<AppStateCubit>().checkAuthStatus();
                  if (context.mounted &&
                      context.read<AppStateCubit>().state is AuthorizedState) {
                    await getIt<SecureStorage>().writeSecureData(
                      key: 'creds',
                      value: jsonEncode(
                          (context.read<AppStateCubit>().state as AuthorizedState)
                              .user
                              .toJson()),
                    );
                    AutoRouter.of(context).replace(const HomeRoute());
                  } else if (context.mounted &&
                      context.read<AppStateCubit>().state
                          is UnauthorizedState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Not correct login or password')),
                    );
                  }
                } else if (state is SignInError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorText)),
                  );
                }
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: context.read<SignInCubit>().formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 140.h),
                        Assets.logo.image(
                          height: 110.h,
                          width: 110.w,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'SIGN IN',
                          style:
                              Theme.of(context).primaryTextTheme.displayMedium,
                        ),
                        SizedBox(height: 40.h),
                        EmailField(
                          controller:
                              context.read<SignInCubit>().loginController,
                        ),
                        SizedBox(height: 10.h),
                        PasswordField(
                          controller:
                              context.read<SignInCubit>().passwordController,
                        ),
                        SizedBox(height: 30.h),
                        Material(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(4.w),
                          child: InkWell(
                            onTap: () async {
                              final formState = context
                                  .read<SignInCubit>()
                                  .formKey
                                  .currentState;

                              // if (formState?.validate() ?? false) {
                              await context.read<SignInCubit>().signIn();
                              // }
                            },
                            borderRadius: BorderRadius.circular(4.w),
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.w),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  child: Text(
                                    'Sign in',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .titleMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account? ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  color: Color(0xFFFFE500),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
