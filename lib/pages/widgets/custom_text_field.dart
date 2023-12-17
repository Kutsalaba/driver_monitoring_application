import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../localization/locale_keys.g.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.glazyBlue,
      style: Theme.of(context).primaryTextTheme.displaySmall,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        hintText: hintText,
        hintStyle: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
              color: AppColors.glazyGrey,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.w),
        ),
        errorStyle: const TextStyle(
          color: AppColors.contrastRed,
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
            color: AppColors.contrastRed,
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
      validator: (input) {
        if (input != null && input.isNotEmpty) {
          return input;
        }
        return null;
      },
    );
  }
}
