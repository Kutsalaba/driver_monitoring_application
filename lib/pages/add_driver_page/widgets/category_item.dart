import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.name,
    required this.onPressed,
    this.isSelected = false,
    super.key,
  });

  final String name;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10.w),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? const Color(0xffFF8A00)
                : Theme.of(context).primaryColor,
          ),
          color: isSelected
              ? const Color(0xffFF8A00).withOpacity(0.8)
              : Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.w),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        child: Text(
          name,
          style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                color: isSelected ? AppColors.contrastGrey : AppColors.blue,
              ),
        ),
      ),
    );
  }
}
