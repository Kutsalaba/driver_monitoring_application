import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/localization/locale_keys.g.dart';
import 'package:driver_monitoring_application/services/db_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:postgres/postgres.dart';

import '../../cubit/app_state.dart';
import '../../cubit/app_state_cubit.dart';
import '../../domain/shared_models/api/user_model.dart';
import '../../gen/assets.gen.dart';
import '../../routes/app_router.gr.dart';
import '../../services/injectible/injectible_init.dart';
import '../../services/secure_storage_service.dart';
import '../../styles/app_colors.dart';
import 'cubit/splash_cubit.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.contrastBlack,
        body: BlocProvider(
          create: (context) => getIt<SplashCubit>()..load(),
          child: Builder(builder: (context) {
            return BlocListener<SplashCubit, SplashPageState>(
              listener: (context, state) async {
                var route = AutoRouter.of(context);
                if (state is ShowAuth) {
                  var appStateCubit = context.read<AppStateCubit>();
                  await appStateCubit.checkAuthStatus();
                  if (appStateCubit.state is AuthorizedState) {
                    route.replace(const HomeRoute());
                  } else {
                    route.replace(const AuthRoute());
                  }
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.logo.image(
                          height: 150.h,
                          width: 150.w,
                        ),
                        Text(
                          LocaleKeys.startAppName.tr(),
                          style: Theme.of(context).primaryTextTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Supported by',
                    style: Theme.of(context).primaryTextTheme.titleSmall,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
