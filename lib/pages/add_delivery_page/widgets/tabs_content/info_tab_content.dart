import 'package:driver_monitoring_application/pages/add_delivery_page/cubit/add_delivery_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                SizedBox(height: 60.h),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
