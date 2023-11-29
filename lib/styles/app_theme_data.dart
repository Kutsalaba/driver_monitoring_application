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
      fontFamily: GoogleFonts.rubik().fontFamily,
      primaryTextTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 42.sp,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          fontSize: 44.sp,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
        ),
      ).apply(
        bodyColor: AppColors.white,
        displayColor: AppColors.white,
      ),
    );
  }

  ThemeData get defaultThemeData => _appTheme!;
}
