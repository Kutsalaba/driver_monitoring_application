import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/cubit/app_state.dart';
import 'package:driver_monitoring_application/cubit/app_state_cubit.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../localization/locale_keys.g.dart';
import '../../../routes/app_router.gr.dart';
import '../../../services/injectible/injectible_init.dart';
import '../../sign_in_page/cubit/sign_in_cubit.dart';
import 'custom_menu_tile.dart';

class CustomMenuDrawer extends StatelessWidget {
  const CustomMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var chiefFlag =
        (context.read<AppStateCubit>().state as AuthorizedState).user.chiefFlag;
    var signInCubit = getIt<SignInCubit>();
    return Drawer(
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      width: 200.w,
      backgroundColor: AppColors.dirtyBlack,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 45.h),
              Assets.logo.image(height: 80.h),
              SizedBox(height: 60.h),
              CustomMenuTile(
                itemText: LocaleKeys.orders.tr(),
                iconPath: Assets.icons.home,
                onTap: () {
                  AutoRouter.of(context).replace(const HomeRoute());
                  AutoRouter.of(context).pop();
                },
              ),
              Visibility(
                visible: chiefFlag!,
                child: Padding(
                  padding: EdgeInsets.only(top: 26.h),
                  child: CustomMenuTile(
                    itemText: LocaleKeys.drivers.tr(),
                    iconPath: Assets.icons.driver,
                    onTap: () {
                      AutoRouter.of(context).replace(const DriversRoute());
                      AutoRouter.of(context).pop();
                    },
                  ),
                ),
              ),
              Visibility(
                visible: chiefFlag,
                child: Padding(
                  padding: EdgeInsets.only(top: 26.h),
                  child: CustomMenuTile(
                    itemText: LocaleKeys.vehicles.tr(),
                    iconPath: Assets.icons.car,
                    onTap: () {
                      AutoRouter.of(context).push(const VehiclesRoute());
                    },
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              CustomMenuTile(
                itemText: LocaleKeys.support.tr(),
                iconPath: Assets.icons.support,
                onTap: () {
                  AutoRouter.of(context).push(const SupportRoute());
                },
              ),
              SizedBox(height: 26.h),
              const Spacer(),
              CustomMenuTile(
                itemText: LocaleKeys.logOut.tr(),
                iconPath: Assets.icons.logOut,
                onTap: () async {
                  var route = AutoRouter.of(context);
                  await signInCubit.signOut();
                  route.replace(const SignInRoute());
                },
              ),
              SizedBox(height: 50.h)
            ],
          ),
        ),
      ),
    );
  }
}
