import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppThemeData {
  static AppThemeData? _instance;
  ThemeData? _appTheme;

  factory AppThemeData() {
    return _instance ??= AppThemeData._();
  }

  AppThemeData._() {
    _appTheme = ThemeData(
      fontFamily: GoogleFonts.heebo().fontFamily,
      primaryTextTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w900,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w300,
        ),
      ).apply(
        bodyColor: AppColors.contrastGrey,
        displayColor: AppColors.contrastGrey,
      ),
    );
  }

  ThemeData get defaultThemeData => _appTheme!;
}
