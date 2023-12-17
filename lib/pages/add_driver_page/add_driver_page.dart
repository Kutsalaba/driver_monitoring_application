import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/gen/assets.gen.dart';
import 'package:driver_monitoring_application/pages/add_driver_page/cubit/add_driver_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../localization/locale_keys.g.dart';
import '../../services/injectible/injectible_init.dart';
import '../../styles/app_colors.dart';
import '../widgets/custom_text_field.dart';
import 'widgets/category_item.dart';
import 'widgets/phone_text_field.dart';

@RoutePage()
class AddDriverPage extends StatefulWidget {
  const AddDriverPage({super.key});

  @override
  State<AddDriverPage> createState() => _AddDriverPageState();
}

class _AddDriverPageState extends State<AddDriverPage> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.contrastBlack,
      appBar: AppBar(
        backgroundColor: AppColors.contrastBlack,
        iconTheme: IconThemeData(
          color: AppColors.contrastGrey,
          size: 32.w,
        ),
        title: Text(
          LocaleKeys.drivers.tr(),
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => getIt<AddDriverCubit>()..load(),
        child: BlocBuilder<AddDriverCubit, AddDriverState>(
          builder: (context, state) {
            var addDriverCubit = context.read<AddDriverCubit>();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        log('Add picture');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.deepGrey,
                          borderRadius: BorderRadius.circular(18.w),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 40.h),
                            child: SvgPicture.asset(
                              Assets.icons.pictureAdd,
                              width: 56.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Text(
                        'FULL NAME',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      child: CustomTextField(
                        controller: addDriverCubit.nameController,
                        hintText: 'Enter a full name',
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Text(
                        'MILITARY RANK',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      child: CustomTextField(
                        controller: addDriverCubit.rankController,
                        hintText: 'Enter a rank',
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Text(
                        'MOBILE PHONE',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                    ),
                    PhoneTextField(focusNode: focusNode),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Text(
                        'CATEGORIES',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                    ),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: state.licenseCategories
                          .map(
                            (category) => CategoryItem(
                              name: category.name,
                              isSelected: category.isSelected,
                              onPressed: () => context
                                  .read<AddDriverCubit>()
                                  .onSelectCategory(category.name),
                            ),
                          )
                          .toList(),
                      // [
                      //   CategoryItem(
                      //     name: 'A',
                      //     isSelected: true,
                      //     onPressed: () {
                      //       log('Press');
                      //     },
                      //   ),
                      // ],
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Text(
                        'AGE',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 50.w,
                      child: CustomTextField(
                        controller: addDriverCubit.ageController,
                        hintText: '  0',
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: SizedBox(
                        width: 300.w,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AddDriverCubit>().confirmInput();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: state.isInputCompleted
                                ? AppColors.glazyBlue
                                : AppColors.contrastGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                          ),
                          child: Text(
                            'CONFIRM',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .titleMedium!
                                .copyWith(
                                  color: state.isInputCompleted
                                      ? AppColors.white
                                      : AppColors.deepGrey,
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
        ),
      ),
    );
  }
}
