import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/gen/assets.gen.dart';
import 'package:driver_monitoring_application/pages/add_driver_page/cubit/add_driver_cubit.dart';
import 'package:driver_monitoring_application/routes/app_router.gr.dart';
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
                            padding: EdgeInsets.symmetric(vertical: 32.h),
                            child: SvgPicture.asset(
                              Assets.icons.pictureAdd,
                              width: 52.w,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 230.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 6.h),
                                child: Text(
                                  'MILITARY RANK',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .displaySmall,
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                                child: CustomTextField(
                                  controller: addDriverCubit.rankController,
                                  hintText: 'Enter a rank',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.h),
                              child: Text(
                                'AGE',
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .displaySmall,
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: CustomTextField(
                                controller: addDriverCubit.ageController,
                                hintText: '  0',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 140.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 6.h),
                                child: Text(
                                  'LOGIN',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .displaySmall,
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                                child: CustomTextField(
                                  controller: addDriverCubit.loginController,
                                  hintText: 'Enter',
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(width: 32.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.h),
                              child: Text(
                                'PASSWORD',
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .displaySmall,
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                              width: 140.w,
                              child: CustomTextField(
                                controller: addDriverCubit.passwordController,
                                hintText: 'Enter',
                              ),
                            ),
                          ],
                        ),
                      ],
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
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: SizedBox(
                        width: 300.w,
                        child: ElevatedButton(
                          onPressed: () async {
                            var route = AutoRouter.of(context);
                            if (context.read<AddDriverCubit>().confirmInput()) {
                              await context.read<AddDriverCubit>().addDriver();
                              if (context.mounted) {
                                Timer? timer =
                                    Timer(Duration(milliseconds: 1500), () {
                                  route.popAndPush(const DriversRoute());
                                  // route.replace(const AddDriverRoute());
                                });
                                await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: Dialog(
                                        child: Text(
                                            'The driver was successfully added!'),
                                      ),
                                    );
                                  },
                                ).then((value) {
                                  timer?.cancel();
                                  timer = null;
                                });
                              }
                            } else {
                              showAboutDialog(context: context);
                            }
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
