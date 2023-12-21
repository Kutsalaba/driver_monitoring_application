import 'package:driver_monitoring_application/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../styles/app_colors.dart';

class DateTextField extends StatelessWidget {
  const DateTextField({
    super.key,
    required this.dateController,
  });

  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dateController,
      style: Theme.of(context).primaryTextTheme.displaySmall,
      decoration: InputDecoration(
        hintText: 'Select date',
        contentPadding: EdgeInsets.zero,
        prefixIconConstraints: BoxConstraints(maxHeight: 80.h, maxWidth: 80.w),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: SvgPicture.asset(
            Assets.icons.calendar,
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
          ),
        ),
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
      readOnly: true,
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          dateController.text = picked.toString().split(" ")[0];
        }
      },
    );
  }
}
