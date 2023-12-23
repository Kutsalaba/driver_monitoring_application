import 'package:auto_route/annotations.dart';
import 'package:driver_monitoring_application/localization/locale_keys.g.dart';
import 'package:driver_monitoring_application/pages/add_delivery_page/cubit/add_delivery_cubit.dart';
import 'package:driver_monitoring_application/pages/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/injectible/injectible_init.dart';
import '../../styles/app_colors.dart';
import 'widgets/delivery_tab.dart';
import 'widgets/tabs_content/info_tab_content.dart';
import 'widgets/tabs_content/location_tab_content.dart';
import 'widgets/tabs_content/vehicle_driver_content.dart';

@RoutePage()
class AddDeliveryPage extends StatefulWidget {
  const AddDeliveryPage({super.key});

  @override
  State<AddDeliveryPage> createState() => _AddDeliveryPageState();
}

class _AddDeliveryPageState extends State<AddDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.contrastBlack,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200.h),
            child: CustomAppBar(
              title: LocaleKeys.createDelivery.tr(),
              bottom: TabBar(
                padding: EdgeInsets.zero,
                splashBorderRadius: BorderRadius.circular(6.w),
                indicatorColor: Colors.transparent,
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.white.withOpacity(0.5),
                      offset: const Offset(0, 2),
                      spreadRadius: 8.w,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 12.w,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                tabs: const [
                  DeliveryTab(
                    partNumber: '1',
                    title: 'INFO',
                  ),
                  DeliveryTab(
                    partNumber: '2',
                    title: 'CAR/DRIVER',
                  ),
                  DeliveryTab(
                    partNumber: '3',
                    title: 'LOCATION',
                  ),
                ],
              ),
            ),
          ),
          body: BlocProvider(
            create: (context) => getIt<AddDeliveryCubit>()..load(),
            child: const TabBarView(
              children: [
                InfoTabContent(),
                VehicleDriverContent(),
                LocationTabContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
