import 'package:driver_monitoring_application/pages/add_delivery_page/cubit/add_delivery_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../styles/app_colors.dart';
import '../../../widgets/custom_text_field.dart';
import '../date_text_field.dart';

class InfoTabContent extends StatelessWidget {
  const InfoTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDeliveryCubit, AddDeliveryState>(
      builder: (context, state) {
        var addDeliveryCubit = context.read<AddDeliveryCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Text(
                    'TITLE',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).primaryTextTheme.displaySmall,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  child: CustomTextField(
                    controller: addDeliveryCubit.titleController,
                    hintText: 'Enter title',
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Text(
                    'DESCRIPTION',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).primaryTextTheme.displaySmall,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  child: CustomTextField(
                    controller: addDeliveryCubit.descriptionController,
                    hintText: 'Description',
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Text(
                    'DATE',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).primaryTextTheme.displaySmall,
                  ),
                ),
                DateTextField(dateController: addDeliveryCubit.dateController),
                SizedBox(height: 50.h),
                Center(
                  child: SizedBox(
                    width: 320.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () async {
                        // var route = AutoRouter.of(context);
                        // if (context
                        //     .read<AddVehicleCubit>()
                        //     .confirmInput()) {
                        //   await context
                        //       .read<AddVehicleCubit>()
                        //       .addVehicle();
                        //   if (context.mounted) {
                        //     Timer? timer = Timer(
                        //         const Duration(milliseconds: 1800), () {
                        //       route.popAndPush(const VehiclesRoute());
                        //     });
                        //     await showDialog(
                        //       context: context,
                        //       builder: (context) {
                        //         return MultyAlertDialog(
                        //           text:
                        //               'The vehicle was successfully added!',
                        //           svgImagePath: Assets.icons.success,
                        //           haveOkButton: false,
                        //         );
                        //       },
                        //     ).then((value) {
                        //       timer?.cancel();
                        //       timer = null;
                        //     });
                        //   }
                        // } else {
                        //   await showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return MultyAlertDialog(
                        //         text: LocaleKeys.fieldsCannotBeEmpty.tr(),
                        //         svgImagePath: Assets.icons.success,
                        //       );
                        //     },
                        //   );
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.dingyGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.w),
                        ),
                      ),
                      child: Text(
                        'NEXT',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium!
                            .copyWith(
                              color: AppColors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
