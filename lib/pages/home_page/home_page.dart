import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/cubit/app_state_cubit.dart';
import 'package:driver_monitoring_application/localization/locale_keys.g.dart';
import 'package:driver_monitoring_application/pages/home_page/cubit/home_cubit.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cubit/app_state.dart';
import '../../gen/assets.gen.dart';
import '../../routes/app_router.gr.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_menu_drawer/custom_menu_drawer.dart';
import 'widgets/delivery_tile.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var user = (context.read<AppStateCubit>().state as AuthorizedState).user;
    return Scaffold(
      backgroundColor: AppColors.contrastBlack,
      drawer: const CustomMenuDrawer(),
      appBar: CustomAppBar(
        title: LocaleKeys.deliveries.tr(),
      ),
      body: BlocProvider(
        create: (context) {
          if (user.chiefFlag!) {
            return HomeCubit()..getChiefDeliveries();
          }
          return HomeCubit()..getUserDeliveries(user.userId!);
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h, width: double.infinity),
                Visibility(
                  visible: user.chiefFlag!,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SizedBox(
                      width: 240.w,
                      child: ElevatedButton(
                        onPressed: () {
                          AutoRouter.of(context).push(const AddDeliveryRoute());
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          foregroundColor: Colors.transparent,
                          disabledBackgroundColor: Colors.transparent,
                          disabledForegroundColor: Colors.transparent,
                          backgroundColor: AppColors.deepGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.w),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 20.w),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 16.w),
                                child: SvgPicture.asset(
                                  Assets.icons.circlePlus,
                                  width: 32.w,
                                  height: 32.h,
                                ),
                              ),
                              Text(
                                'CREATE NEW',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .displayMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                state.deliveries.isNotEmpty
                    ? Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            var homeCubit = context.read<HomeCubit>();
                            if (user.chiefFlag!) {
                              await homeCubit.getChiefDeliveries();
                            } else {
                              await homeCubit.getUserDeliveries(user.userId!);
                            }
                          },
                          child: ListView.builder(
                            itemCount: state.deliveries.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 6.h,
                              ),
                              child: DeliveryTile(
                                deliveryModel: state.deliveries[index],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: SizedBox(
                          height: 50.h,
                          width: 50.w,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
