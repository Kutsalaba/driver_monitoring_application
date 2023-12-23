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
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/multy_alert_dialog.dart';
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
      appBar: CustomAppBar(
        title: LocaleKeys.drivers.tr(),
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
                                hintText: '0',
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
                      spacing: 10.w,
                      runSpacing: 8.h,
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
                    SizedBox(height: 16.h),
                    Center(
                      child: SizedBox(
                        width: 300.w,
                        child: ElevatedButton(
                          onPressed: () async {
                            var route = AutoRouter.of(context);
                            if (context
                                .read<AddDriverCubit>()
                                .confirmInputAddDriver()) {
                              await context.read<AddDriverCubit>().addDriver();
                              if (context.mounted) {
                                Timer? timer = Timer(
                                    const Duration(milliseconds: 1800), () {
                                  route.popAndPush(const DriversRoute());
                                });
                                await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return MultyAlertDialog(
                                      text:
                                          'The driver was successfully added!',
                                      svgImagePath: Assets.icons.success,
                                      haveOkButton: false,
                                    );
                                  },
                                ).then((value) {
                                  timer?.cancel();
                                  timer = null;
                                });
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return MultyAlertDialog(
                                    text: LocaleKeys.fieldsCannotBeEmpty.tr(),
                                    svgImagePath: Assets.icons.success,
                                  );
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.glazyBlue,
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
        ),
      ),
    );
  }
}
