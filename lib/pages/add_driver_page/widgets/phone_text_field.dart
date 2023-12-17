import 'dart:developer';

import 'package:driver_monitoring_application/pages/add_driver_page/cubit/add_driver_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../styles/app_colors.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    required this.focusNode,
  });

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      focusNode: focusNode,
      style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
            color: AppColors.white,
          ),
      dropdownTextStyle: Theme.of(context)
          .primaryTextTheme
          .displaySmall!
          .copyWith(color: AppColors.white, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
        hintText: 'Enter phone number',
        hintStyle: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
              color: AppColors.glazyGrey,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.w),
        ),
        errorStyle: const TextStyle(
          color: AppColors.glazyBlue,
          fontWeight: FontWeight.w500,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.w)),
          borderSide: const BorderSide(
            color: AppColors.glazyBlue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.w)),
          borderSide: const BorderSide(
            color: AppColors.glazyBlue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.w)),
          borderSide: const BorderSide(
            color: AppColors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.w)),
          borderSide: BorderSide(
            color: AppColors.glazyBlue,
            width: 2.w,
          ),
        ),
      ),
      initialCountryCode: 'UA',
      languageCode: 'ua',
      onChanged: (phone) {
        log(phone.completeNumber);

        log(context.read<AddDriverCubit>().state.toString());
      },
      onCountryChanged: (country) {
        print('Country changed to: ' + country.name);
      },
    );
  }
}
